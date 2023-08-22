/*
*   연습문제
*/
-- 1.1
select * from customer;
select bookname from book where bookid like 1;
-- 1.2
select bookname, price from book where price >= 20000;
-- 1.3
select sum(saleprice) as sum_saleprice from orders where custid = 1;
select sum(o.saleprice) from orders o
        join customer c        -- 필드 늘어남
        on o.custid = c.custid
        where c.name = '박지성';
-- 1.4
select count(*) as purchase_book_count from orders where custid = 1;
-- 2.1
select count(*) as count_of_book from book;
-- 2.2
select count(distinct publisher) as count_of_publisher from book;   -- distinct 중복제거
-- 2.3
select name, address from customer;
-- 2.4
select orderid from orders where orderdate between '2014-07-04' and '2014-07-07';
-- 2.5
select orderid from orders where orderdate not between '2014-07-04' and '2014-07-07';
-- 2.6
select name, address from customer where name like '김%';
select name, address from customer where regexp_like(name, '^김');
-- 2.7
select name, address from customer where name like '김%아';
select name, address from customer where regexp_like(name, '^김') and regexp_like(name, '아$');

/*
 * p.61 연습문제
 */
 
-- 1.5  박지성이 구매한 도서의 출판사 수
select count(distinct b.publisher) from orders o
        join book b on b.bookid = o.bookid
        join customer c on c.custid = o.custid
        where c.name like '박지성';
-- 1.6 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
select b.bookname, b.price, o.saleprice, (b.price - o.saleprice) from orders o
        join book b on b.bookid = o.bookid
        join customer c on c.custid = o.custid
        where c.name like '박지성'; 
-- 1.7 박지성이 구매하지 않은 도서의 이름
--select distinct b.bookname from orders o
--        join book b on b.bookid = o.bookid
--        join customer c on c.custid = o.custid
--        where c.name not like '박지성';
select bookname from book minus
    select b.bookname from orders o
        join book b on o.bookid = b.bookid
        join customer c on o.custid = c.custid
        where c.name like '박지성';
-- 2.8  주문하지 않은 고객의 이름(부속질의 사용)
select distinct c.name from customer c
        where c.custid not in
        (select custid from orders);
-- 2.9 주문 금액의 총액과 주문의 평균 금액
select sum(o.saleprice), cast(avg(o.saleprice) as number(10,2)) from orders o;
select sum(saleprice), round(avg(saleprice), 0) from orders;
-- 2.10 고객의 이름과 고객별 구매액
select c.name, sum(o.saleprice) from orders o
        join customer c on o.custid = c.custid
        group by c.name;
-- 2.11 고객의 이름과 고객이 구매한 도서 목록
select c.name, b.bookname from orders o
        join customer c on c.custid = o.custid
        join book b on b.bookid = o.bookid
        order by c.name;
select c.name, listagg(b.bookname, ', ') within group (order by b.bookname) booklist
        from orders o
        join customer c on c.custid = o.custid
        join book b on b.bookid = o.bookid
        group by c.name;
-- 2.12 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문
-- 판매가격과 정가의 차이가 제일 큰 값
select max(abs(o.saleprice - b.price)) from orders o
        join book b on o.bookid = b.bookid;
-- 판가와 정가의 차이가 6000원인 주문 찾기
select o.orderid, o.saleprice, b.price from orders o
        join book b on o.bookid = b.bookid
        where abs(o.saleprice - b.price) = 6000;
-- 위 두개의 SQL을 결합
select o.orderid, o.saleprice, b.price from orders o
        join book b on o.bookid = b.bookid
        where abs(o.saleprice - b.price) = (
            select max(abs(o.saleprice - b.price)) from orders o
            join book b on o.bookid = b.bookid);
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
select avg(saleprice) from orders;
select c.name, avg(o.saleprice) from orders o
        join customer c on o.custid = c.custid
        group by c.name
        having avg(o.saleprice) > (select avg(saleprice) from orders);
select c.name from customer c 
        where c.custid like
            (select o.custid from orders o
            group by o.custid having avg(o.saleprice) > (select avg(o.saleprice) from orders o));
