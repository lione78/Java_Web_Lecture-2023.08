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