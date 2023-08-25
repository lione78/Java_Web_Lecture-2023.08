
/* Drop Triggers */

DROP TRIGGER TRI_blog_bid;
DROP TRIGGER TRI_member1_sid;
DROP TRIGGER TRI_member_sid;



/* Drop Tables */

DROP TABLE member1 CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_blog_bid;
DROP SEQUENCE SEQ_member1_sid;
DROP SEQUENCE SEQ_member_sid;




/* Create Sequences */

CREATE SEQUENCE SEQ_blog_bid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_member1_sid INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_member_sid INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE member1
(
	sid number NOT NULL,
	userid varchar2(20) NOT NULL,
	pwd varchar2(30) NOT NULL,
	uname varchar2(20) NOT NULL,
	email varchar2(30),
	gender number(10),
	content varchar2(4000),
	modTime timestamp DEFAULT CURRENT_TIMESTAMP,
	isDeleted number DEFAULT 0 NOT NULL,
	PRIMARY KEY (sid)
);



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_blog_bid BEFORE INSERT ON blog
FOR EACH ROW
BEGIN
	SELECT SEQ_blog_bid.nextval
	INTO :new.bid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_member1_sid BEFORE INSERT ON member1
FOR EACH ROW
BEGIN
	SELECT SEQ_member1_sid.nextval
	INTO :new.sid
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_member_sid BEFORE INSERT ON member
FOR EACH ROW
BEGIN
	SELECT SEQ_member_sid.nextval
	INTO :new.sid
	FROM dual;
END;

/




