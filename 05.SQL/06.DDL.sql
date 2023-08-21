/*
 * 3. DDL(Data Definition Language)
 */
 
 /* 
  * 3.1 CREATE TABLE
  */
/*  다음과 같은 속성을 가진 NewBook 테이블을 생성하시오,
    정수형은 NUMBER를, 문자형은 가변형 문자타입인 VARCHAR2를 사용
    bookid(도서번호) – NUMBER
    bookname(도서이름) – VARCHAR2(20)
    publisher(출판사) – VARCHAR2(20)
    price(가격) – NUMBER
*/
create table NewBook (          -- create table if not exists NewBook(최신 버젼)
    bookid number primary key,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

drop table NewBook;

/* 기본키 - 복합키(도서이름, 출판사)
   도서이름 - 같은 값을 가지면 안됨.
   출판사 - NULL 이 아님어야 함.
   가격 기본이 10000원, 1000원 이상이어야 함.
*/

create table NewBook(
    bookname varchar2(40) unique,
    publisher varchar2(20) not null,
    price number default 10000 check(price >= 1000),
    primary key (bookname, publisher)
);

/*
    다음과 같은 속성을 가진 NewCustomer 테이블을 생성하시오
    custid(고객번호) - NUMBER, 기본키
    name(이름) – VARCHAR2(40)
    address(주소) – VARCHAR2(40)
    phone(전화번호) – VARCHAR2(30)
*/

create table NewCustomer(
    custid number primary key,
    name varchar2(40),      -- name을 다른 이름으로 저장하는게 좋음.
    address varchar2(40),
    phone varchar2(30)
);

/*
 * 3.2 ALTER TABLE
 */ 
-- NewCustomer 테이블에 email varchar2(40) 추가
alter table NewCustomer add email varchar2(40);
desc newcustomer;
-- NewCustomer 테이블에서 phone 필드 제거
alter table NewCustomer drop column phone;
-- name 필드를 cname으로 이름 변경하고 not null 속성 추가
alter table NewCustomer modify name varchar2(40) not null;
alter table NewCustomer rename column name to cname;

/*
 * 3.3 DROP TABLE
 */
drop table NewCustomer;
drop table NewBook;
commit;