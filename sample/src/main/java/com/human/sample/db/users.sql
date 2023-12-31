create table users(
    "uid" varchar2(12) primary key,
    pwd char(60) not null,
    uname varchar2(16) not null,
    email varchar2(40) not null,
    regDate date default (CURRENT_DATE),
    isDeleted number(10,0) default 0
)

select * from users;

update users set isDeleted=0 where "uid" = 'maria';

commit;

update users set pwd='', uname='', email='' where "uid"='';