/*
 * 1. 질의어 (query)
 */
 /*
SELECT 필드명
    FROM 테이블명
    JOIN 테이블명
    ON 조인 조건
    WHERE 조건
    GROUP BY 필드명
    HAVING 그룹 조건
    ORDER BY 필드명 순서(ASC, DESC);
 
 갯수 조절을 위한 필드가 추가됨.
 */

/* 기본 구문 */
select * from book;
select * from customer;
select * from orders;
select name, address from customer;
-- book 테이블에 있는 출판사 이름은? 중복제거
select distinct publisher from book;

/* 
    1.1 조회 조건 
*/
-- 가격이 10000원 이상인 책
select * from book where price >= 10000;
-- 대한미디어에서 출간한 책
select * from book where publisher = '대한미디어';
-- 축구와 관련된 책
select * from book where bookname like '%축구%'; -- = 안됨.
-- 가격이 10000원 이상 20000원 이하인 책
select * from book where price >= 10000 and price <= 20000;
select * from book where price between 10000 and 20000;
-- 가격이 10000원 미만 또는 20000원 초과인 책
select * from book where price < 10000 or price > 20000;
-- 가격이 13000원이 아닌 책
select * from book where price != 13000;
select * from book where price <> 13000;
-- 가격이 7의 배수인 책
select * from book where mod(price, 7) = 0;
-- 나무수, 굿스포츠, 삼성당에서 출간한 책
select * from book where publisher = '나무수'
                    or publisher = '굿스포츠'
                    or publisher = '삼성당';
select * from book where publisher in ('나무수', '굿스포츠', '삼성당');
-- 전화가 NULL인 고객은?
select * from customer where phone is null;
-- 미국과 영국에 사는 고객은? %(wild charater) 사용시 like 
select * from customer where address like '%미국%' or address like '%영국%';
/*
    1.2 순서(Order by)
*/
-- 책 이름을 오름차순(ascending order)으로 정렬 : asc가 default 
select * from book order by bookname;
-- 책 가격의 내림차순(descencing order)으로 정렬
select * from book order by price desc;
-- 책 가격의 내림차순(descencing order)으로 정렬, 같으면 책이름의 오름 차순으로 정렬
-- bookname asc; price가 일차 기준 bookname이 이차 기준
select * from book order by price desc, bookname;
-- 대한민국에 사는 고객을 이름순으로 정렬 (X order by where) 
select * from customer where address like '%대한민국%' order by name;

/*
 *  1.3 함수
*/
-- 고객의 수는?
select count(*) from customer;
select count(*) as numCustomers from customer;  -- as --> alias
-- 주문금액의 합계, 평균, 최대 최소는? 
select 
    sum(saleprice) as sum_sales,                -- as 생략 가능
    avg(saleprice) as averge_sales, 
    min(saleprice) min_sales, 
    max(saleprice) max_sales
    from orders;
-- 대한미디어에서 출간한 책 가격의 평균은?
select avg(price) as average_price from book where publisher like '%대한미디어%';