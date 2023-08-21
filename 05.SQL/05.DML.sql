/*
 * 2. 데이터 조작 언어 (DML : Data Manipulation Language)
 */
 
 /*
  * 2.1 삽입(Insert)

INSERT INTO 테이블명 [(필드명1, 필드명2, ... ,필드명 n)]
        VALUES (값1, 값2, ..., 값n);
  */
  
--  북 테이블에 새로운 레코드 추가
insert into book values(11, '스포츠 의학', '한솔의학서적', 90000);
select * from book;
desc book;
-- 스포츠 심리, 24000원, 출판사 모름
insert into book(bookid, bookname, price) 
        values(12, '스포츠심리', 24000);
-- 박세리 고객이 스포츠 의학을 오늘 구매한 사실을 orders 테이블에 기록
insert into orders 
        values(11, 90000, default, 5, 11);
-- 박찬호 고객이 스포츠 심리라는 책을 오늘 구매한 사실을 orders 테이블에 기록
insert into orders(orderid, saleprice, custid, bookid) 
        values(12, 24000, 1, 12);
-- 고객 테이블에 신유빈 선수를 등록
insert into customer(custid, name) values(6, '신유빈');
commit;
select * from orders;
/*
 * 2.2 갱신(Update)
  
UPDATE 테이블명 
    SET 필드명1 = 값1, ..., 필드명n = 값n
    WHERE 조건;
 */
-- 스포츠 심리 책의 출판사를 한솔의학서적으로 변경
select * from book;
update book set publisher = '한솔의학서적' where bookid = 12;
-- 신유빈 선수의 주소를 강원도 영월, 전화번호를 010-2345-6789 으로 변경
update customer set address = '강원도 영월', phone = '010-2345-6789' where custid = 6;
-- 전화번호가 null인 고객을 070-2345-6789로 변경
update customer set phone = '070-2345-6789' where phone is null;    -- 조건을 안 주면 모든 필드가 변경
select * from customer;
commit;

/*
 * 2.3 삭제(DELETE)
 
 DELETE FROM 테이블명 WHERE 조건;
 
 */
 -- 고객 테이블에 테스트 데이터 입력 후 삭제
insert into customer(custid, name) values(7, '테스트');
insert all
        into customer(custid, name) values(8, '류현진')
        into customer(custid, name) values(9, '손흥민')
        select * from dual;
select * from customer;
-- custid가 7인 고객 삭제
delete from customer where custid = 7;
-- 주소가 null인 고객 삭제
delete from customer where address is null;
commit;

/*
 * p.61 연습문제
 */
 
-- 1.5  박지성이 구매한 도서의 출판사 수
select b.publisher from orders o
        join book b on b.bookid = o.bookid
        join customer c on c.custid = o.custid
        where c.name like '박지성';
-- 1.6 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
select b.bookname, b.price, (b.price - o.saleprice) from orders o
        join book b on b.bookid = o.bookid
        join customer c on c.custid = o.custid
        where c.name like '박지성'; 
-- 1.7 박지성이 구매하지 않은 도서의 이름
select distinct b.bookname from orders o
        join book b on b.bookid = o.bookid
        join customer c on c.custid = o.custid
        where c.name not like '박지성';
-- 2.8  주문하지 않은 고객의 이름(부속질의 사용)
select distinct c.name from customer c
        where c.custid not in
        (select custid from orders);
-- 2.9 주문 금액의 총액과 주문의 평균 금액
select sum(o.saleprice), cast(avg(o.saleprice) as number(10,2)) from orders o;
-- 2.10 고객의 이름과 고객별 구매액
select c.name, sum(o.saleprice) from orders o
        join customer c on o.custid = c.custid
        group by c.name;
-- 2.11 고객의 이름과 고객이 구매한 도서 목록
select c.name, b.bookname from orders o
        join customer c on c.custid = o.custid
        join book b on b.bookid = o.bookid
        order by c.name;
-- 2.12 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문
select o.orderid from orders o, book b 
        where o.bookid = b.bookid and abs(o.saleprice - b.price) like 
        (select max(abs(o.saleprice - b.price)) from orders o, book b
                where b.bookid = o.bookid);
select o.orderid, b.bookname, o.saleprice, b.price, abs(o.saleprice - b.price) from orders o
        join book b on o.bookid = b.bookid
        where abs(o.saleprice - b.price) like 
        (select max(abs(o.saleprice - b.price)) from orders o
                join book b on o.bookid = b.bookid);
select max(b.price - o.saleprice) from orders o, book b
        where o.bookid = b.bookid;
        
-- 2.13 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
select c.name from customer c 
        where c.custid like
            (select o.custid from orders o
            group by o.custid having avg(o.saleprice) > (select avg(o.saleprice) from orders o));
/*
 * 연습문제
 */
-- 1.1 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
select b.publisher from orders o
        join customer c on o.custid = c.custid
        join book b on b.bookid = o.bookid;
select distinct c.name from orders o
        join customer c on c.custid = o.custid
        join book b on b.bookid = o.bookid 
        where b.publisher in
            (select distinct b.publisher from orders o
            join customer c on o.custid = c.custid
            join book b on b.bookid = o.bookid);
-- 1.2 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
select c.name from customer c
        where c.custid in
                (select o.custid from orders o
                join book b on b.bookid = o.bookid
                group by o.custid having count(distinct b.publisher) >= 2);
-- 1.3 (생략) 전체 고객의 30% 이상이 구매한 도서
select b.bookname, (count(b.bookname) / (select count(c.custid) from customer c)) as morethan30 from orders o
        join book b on o.bookid = b.bookid
        join customer c on o.custid = c.custid
        group by b.bookname having (count(b.bookname) / (select count(c.custid) from customer c)) >= 0.3 ;
select * from orders; 
-- 2.1  새로운 도서 (‘스포츠 세계’, ‘대한미디어’, 10000원)이 마당서점에 입고
insert into book(bookid, bookname, publisher,  price) values (13, '스포츠세계', '대한미디어', 10000);
select * from book;
-- 2.2 ‘삼성당’에서 출판한 도서를 삭제
delete from book where publisher like '삼성당';
-- 2.3  ‘이상미디어’에서 출판한 도서를 삭제해야 한다. 삭제가 안 될 경우 원인 : orders에 데이터가 있어서 안 됨. order 테이블에 내용부터 지워야함.
select * from orders 
        where bookid in (select bookid from book where publisher like '이상미디어'); 
delete from book where publisher like '이상미디어';
-- 2.4  출판사 ‘대한미디어’가 ‘대한출판사’로 이름을 바꾸었다.
update book set publisher = '대한출판사' where publisher like '대한미디어';