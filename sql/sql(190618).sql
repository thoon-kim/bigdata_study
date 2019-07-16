DROP DATABASE IF EXISTS shopdb;
DROP DATABASE IF EXISTS ModelDB;
DROP DATABASE IF EXISTS sqlDB;
DROP DATABASE IF EXISTS tableDB;


DROP DATABASE IF EXISTS tableDB;
CREATE DATABASE tableDB;

use tableDB;
DROP TABLE IF EXISTS buyTbl, userTbl;

create table userTbl(
	userID char(8), -- 사용자 아이디
    name nvarchar(10), -- 이름
    birthYear int, -- 출생년도 
    addr nchar(2), -- 지역(경기, 서울, 경남 등으로) -- nchar : unicode 방식으로 저장
    mobile1 char(3), -- 휴대폰 국번 				   -- char : ascii 영문 문자 인코딩 방식
    mobile2 char(8), -- 휴대폰의 나머지 전화번호
    height smallint, -- 키
    mDate date -- 회원 가입일
);

create table buyTbl (
	num int, -- 순번(PK)
    userid char(8), -- 아이디(FK)
    prodName nchar(6), -- 물품명
    groupName nchar(4), -- 분류
    price int, -- 단가
    amount smallint -- 수량
);



use tableDB;
DROP TABLE IF EXISTS buyTbl, userTbl;

create table userTbl(
	userID char(8) not null, -- 사용자 아이디
    name nvarchar(10) not null, -- 이름
    birthYear int not null, -- 출생년도 
    addr nchar(2) not null, -- 지역(경기, 서울, 경남 등으로) -- nchar : unicode 방식으로 저장
    mobile1 char(3) null, -- 휴대폰 국번 				   -- char : ascii 영문 문자 인코딩 방식
    mobile2 char(8) null, -- 휴대폰의 나머지 전화번호
    height smallint null, -- 키
    mDate date null -- 회원 가입일
);

create table buyTbl (
	num int not null, -- 순번(PK)
    userid char(8) not null, -- 아이디(FK)
    prodName nchar(6) not null, -- 물품명
    groupName nchar(4) null, -- 분류
    price int not null, -- 단가
    amount smallint not null -- 수량
);


-- 제약조건(constraints) -

/* 제약조건
	primary key - unique, not null
	foreign key -
	unique
	default
	null, not null
*/

DROP TABLE IF EXISTS buyTbl, userTbl;

create table userTbl(
	userID char(8) not null primary key, -- 사용자 아이디
    name nvarchar(10) not null, -- 이름
    birthYear int not null, -- 출생년도 
    addr nchar(2) not null, -- 지역(경기, 서울, 경남 등으로) -- nchar : unicode 방식으로 저장
    mobile1 char(3) null, -- 휴대폰 국번 				   -- char : ascii 영문 문자 인코딩 방식
    mobile2 char(8) null, -- 휴대폰의 나머지 전화번호
    height smallint null, -- 키
    mDate date null -- 회원 가입일
);

create table buyTbl (
	num int not null primary key, -- 순번(PK)
    userid char(8) not null, -- 아이디(FK)
    prodName nchar(6) not null, -- 물품명
    groupName nchar(4) null, -- 분류
    price int not null, -- 단가
    amount smallint not null -- 수량
);


DROP TABLE IF EXISTS buyTbl;

create table buyTbl (
	num int auto_increment not null primary key, -- 순번(PK)
    -- auto_increment : primary key or unique key 일 때만 설정가능
    userid char(8) not null, -- 아이디(FK)
    prodName nchar(6) not null, -- 물품명
    groupName nchar(4) null, -- 분류
    price int not null, -- 단가
    amount smallint not null -- 수량
);


DROP TABLE IF EXISTS buyTbl;

create table buyTbl (
	num int auto_increment not null primary key, -- 순번(PK)
    userid char(8) not null, -- 아이디(FK)
    prodName nchar(6) not null, -- 물품명
    groupName nchar(4) null, -- 분류
    price int not null, -- 단가
    amount smallint not null, -- 수량
    foreign key(userid) references userTbl(userID)
    -- foreign key : userTbl(기본 테이블), buyTbl(참조 테이블, 외래 테이블)
);


INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');

select * from usertbl;

INSERT INTO buyTbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2); -- error

select * from buytbl;

INSERT ignore INTO buyTbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1); 
-- ignore : 오류가 나는 데이터는 안들어가지만 정상 데이터는 들어간다.
INSERT ignore INTO buyTbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT ignore INTO buyTbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2); -- error

select * from buytbl;


-- <Primary Key> -- 3가지 방법

drop table usertbl; -- 참조받는 테이블이라 삭제가 안됨
alter table buytbl drop foreign key buytbl_ibfk_1; -- fk 제약조건 삭제
drop table usertbl; -- 삭제 가능


-- 1
create table userTbl(
	userID char(8) not null primary key, -- 사용자 아이디
    name nvarchar(10) not null, -- 이름
    birthYear int not null, -- 출생년도 
    addr nchar(2) not null, -- 지역(경기, 서울, 경남 등으로) -- nchar : unicode 방식으로 저장
    mobile1 char(3) null, -- 휴대폰 국번 				   -- char : ascii 영문 문자 인코딩 방식
    mobile2 char(8) null, -- 휴대폰의 나머지 전화번호
    height smallint null, -- 키
    mDate date null -- 회원 가입일
);

describe usertbl;

-- 2
drop table if exists usertbl;

create table userTbl(
	userID char(8) not null, -- 사용자 아이디
    name nvarchar(10) not null, -- 이름
    birthYear int not null, -- 출생년도 
    addr nchar(2) not null, -- 지역(경기, 서울, 경남 등으로) -- nchar : unicode 방식으로 저장
    mobile1 char(3) null, -- 휴대폰 국번 				   -- char : ascii 영문 문자 인코딩 방식
    mobile2 char(8) null, -- 휴대폰의 나머지 전화번호
    height smallint null, -- 키
    mDate date null, -- 회원 가입일
    constraint primary key pk_usertbl_userid(userid)
);

describe usertbl;

-- 3
drop table if exists usertbl;

create table userTbl(
	userID char(8) not null, -- 사용자 아이디
    name nvarchar(10) not null, -- 이름
    birthYear int not null, -- 출생년도 
    addr nchar(2) not null, -- 지역(경기, 서울, 경남 등으로) -- nchar : unicode 방식으로 저장
    mobile1 char(3) null, -- 휴대폰 국번 				   -- char : ascii 영문 문자 인코딩 방식
    mobile2 char(8) null, -- 휴대폰의 나머지 전화번호
    height smallint null, -- 키
    mDate date null -- 회원 가입일
);

alter table usertbl
	add constraint pk_usertbl_userID
    primary key (userID);


-- 2개의 칼럼을 묶어서 primary key지정
DROP TABLE IF EXISTS prodTbl;

CREATE TABLE prodTbl( 
	prodCode CHAR(3) NOT NULL,
	prodID CHAR(4) NOT NULL,
	prodDate DATETIME NOT NULL,
	prodCur CHAR(10) NULL
);

ALTER TABLE prodTbl
	ADD CONSTRAINT PK_prodTbl_proCode_prodID
	PRIMARY KEY (prodCode, prodID);

DROP TABLE IF EXISTS prodTbl;

CREATE TABLE prodTbl(
	prodCode CHAR(3) NOT NULL,
	prodID CHAR(4) NOT NULL,
	prodDate DATETIME NOT NULL,
	prodCur CHAR(10) NULL,
	CONSTRAINT PK_prodTbl_proCode_prodID
	PRIMARY KEY (prodCode, prodID)
);

DROP TABLE IF EXISTS prodTbl;

CREATE TABLE prodTbl(
	prodCode CHAR(3) NOT NULL,
	prodID CHAR(4) NOT NULL,
	prodDate DATETIME NOT NULL,
	prodCur CHAR(10) NULL,
	PRIMARY KEY (prodCode, prodID)
);

-- Foreign Key
-- 두 테이블의 관계 선언, 데이터의 무결성을 보장
-- 기준키 테이블, 외래 키 테이블
-- 외래키 테이블에 데이터를 입력 시, 기준키 테이블에 데이터가 존재해야 함
-- 기준키 테이블의 참조 열은 반드시 unique or primary key이어야 함

DROP TABLE IF EXISTS buyTbl, userTbl;

CREATE TABLE userTbl (
	userID char(8) NOT NULL PRIMARY KEY,
	name varchar(10) NOT NULL,
	birthYear int NOT NULL,
	addr char(2) NOT NULL,
	mobile1 char(3) NULL,
	mobile2 char(8) NULL,
	height smallint NULL,
	mDate date NULL
);

-- 1
CREATE TABLE buyTbl (
	num int AUTO_INCREMENT NOT NULL PRIMARY KEY ,
	userid char(8) NOT NULL ,
	FOREIGN KEY(userid) REFERENCES userTbl(userID),
	prodName char(6) NOT NULL,
	groupName char(4) NULL ,
	price int NOT NULL,
	amount smallint NOT NULL
);

DROP TABLE IF EXISTS buyTbl;

-- 2
CREATE TABLE buyTbl (
	num int AUTO_INCREMENT NOT NULL PRIMARY KEY,
	userid char(8) NOT NULL,
	prodName char(6) NOT NULL,
	groupName char(4) NULL ,
	price int NOT NULL,
	amount smallint NOT NULL,
	CONSTRAINT FK_userTbl_buyTbl FOREIGN KEY(userid) 
    REFERENCES userTbl(userID)
    -- constarint 제약조건_이름 제약조건
);

DROP TABLE IF EXISTS buyTbl;

-- 3
CREATE TABLE buyTbl (
	num int AUTO_INCREMENT NOT NULL PRIMARY KEY,
	userid char(8) NOT NULL,
	prodName char(6) NOT NULL,
	groupName char(4) NULL ,
	price int NOT NULL,
	amount smallint NOT NULL,
	FOREIGN KEY(userid) REFERENCES userTbl(userID)
);

DROP TABLE IF EXISTS buyTbl, userTbl ;

-- 4
CREATE TABLE userTbl (
	userID char(8) NOT NULL PRIMARY KEY,
	name nvarchar(10) NOT NULL,
	birthYear int NOT NULL,
	addr char(2) NOT NULL,
	mobile1 char(3) NULL,
	mobile2 char(8) NULL,
	height smallint NULL,
	mDate date NULL
);

CREATE TABLE buyTbl (
	num int AUTO_INCREMENT NOT NULL PRIMARY KEY,
	userid char(8) NOT NULL,
	prodName char(6) NOT NULL,
	groupName char(4) NULL ,
	price int NOT NULL,
	amount smallint NOT NULL
);

ALTER TABLE buyTbl ADD CONSTRAINT FK_userTbl_buyTbl 
FOREIGN KEY (userid) REFERENCES userTbl(userID);

show index from buytbl;
show index from usertbl;

-- on delete cascade, on update cascade -- \
-- 기준 테이블의 데이터가 변경 시 외래키 테이블에도 자동 반영

ALTER TABLE buyTbl DROP FOREIGN KEY FK_userTbl_buyTbl; -- 외래 키 제거

ALTER TABLE buyTbl ADD CONSTRAINT FK_userTbl_buyTbl
FOREIGN KEY (userID) REFERENCES userTbl (userID) ON UPDATE CASCADE;
-- userTbl에서 userID 수정 시 buyTbl 에서도 자동으로 업데이트

drop table if exists userTbl, buyTbl;

-- Unique
CREATE TABLE userTbl (
	userID char(8) NOT NULL PRIMARY KEY,
	name nvarchar(10) NOT NULL,
	birthYear int NOT NULL, 
	addr char(2) NOT NULL,
	mobile1 char(3) NULL,
	mobile2 char(8) NULL,
	height smallint NULL,
	mDate date NULL,
	email char(30) NULL UNIQUE
);

drop table if exists userTbl;

CREATE TABLE userTbl (
	userID char(8) NOT NULL PRIMARY KEY,
	name nvarchar(10) NOT NULL,
	birthYear int NOT NULL,
	addr char(2) NOT NULL,
	mobile1 char(3) NULL,
	mobile2 char(8) NULL,
	height smallint NULL,
	mDate date NULL,
	email char(30) NULL ,
	CONSTRAINT AK_email UNIQUE (email)
);

-- Defualt
drop database if exists testdb;

CREATE DATABASE IF NOT EXISTS testDB;
use testDB;

DROP TABLE IF EXISTS userTbl;

-- 1
CREATE TABLE userTbl (
	userID char(8) NOT NULL PRIMARY KEY,
	name varchar(10) NOT NULL,
	birthYear int NOT NULL DEFAULT -1, -- 값의 입력이 없으면 -1로
	addr char(2) NOT NULL DEFAULT '서울', -- 값의 입력이 없으면 서울로
	mobile1 char(3) NULL,
	mobile2 char(8) NULL,
	height smallint NULL DEFAULT 170,  -- 값의 입력이 없으면 170으로
	mDate date NULL
);

use testDB;

DROP TABLE IF EXISTS userTbl;

CREATE TABLE userTbl (
	userID char(8) NOT NULL PRIMARY KEY,
	name varchar(10) NOT NULL,
	birthYear int NOT NULL ,
	addr char(2) NOT NULL,
	mobile1 char(3) NULL,
	mobile2 char(8) NULL,
	height smallint NULL,
	mDate date NULL
);

-- 2
alter table userTbl
	alter column birthYear Set DEFAULT -1;
alter table userTbl
	alter column addr Set DEFAULT '서울';
alter table userTbl
	alter column height Set DEFAULT 170;


-- default 문은 DEFAULT로 설정된 값을 자동 입력한다.
INSERT INTO userTbl VALUES ('LHL', '이혜리', default, default, '011', '1234567', default, '2019.12.12');
-- auto increment와는 다르게 default 인 부분에 null을 넣으면 오류 / null 대신 default로 넣어준다.
INSERT INTO userTbl VALUES ('THK', 'rsr', null, null, '011', '1234567', default, '2019.12.12'); -- error
-- 열이름이 명시되지 않으면 DEFAULT로 설정된 값을 자동 입력한다
INSERT INTO userTbl(userID, name) VALUES('KAY', '김아영');
-- 값이 직접 명기되면 DEFAULT로 설정된 값은 무시된다.
INSERT INTO userTbl VALUES ('WB', '원빈', 1982, '대전', '019', '9876543', 176, '2017.5.5');

SELECT * FROM userTbl;


-- <데이터 압축> --

-- 시스템 변수 확인
show variables like 'innodb_file_format'; -- Barracuda 이어야만 압축 가능
show variables like 'innodb_large_prefix'; -- On 이어야만 압축 가능

create database if not exists compressDB;

use compressDB;

create table normalTBL(
	emp_no int,
    first_name varchar(14)
);

create table compressTBL(
	emp_no int,
    first_name varchar(14)
) row_format = compressed; 
-- 데이터를 압축해서 저장해주는 테이블


insert into normalTbl
	select emp_no, first_name from employees.employees;
insert into compressTbl
	select emp_no, first_name from employees.employees;
-- 외부 DB에서 데이터를 가져오기 때문에 db_name.table_name 으로 불러온다
    
show table status from compressDB;
-- data_length에서 차이가 나는 것을 확인할 수 있다.
-- Data_free : db의 free space

DROP DATABASE IF EXISTS compressDB;


-- 임시 테이블 - 잠시 사용하는 테이블
-- 세션 내에서만 사용, 생성한 클라이언트만 사용 가능
-- 임시테이블 삭제 - drop table, workbench 종료, mysql서비스 재시작

use employees;

CREATE TEMPORARY TABLE IF NOT EXISTS tempTBL (id INT, name CHAR(5));
CREATE TEMPORARY TABLE IF NOT EXISTS employees (id INT, name CHAR(5));
-- 각각 다른 세션에 생성해서 아래 구문들을 확인해 본다.
-- temporary table은 세션 내에서만 사용 가능하다.

DESCRIBE tempTBL;
DESCRIBE employees;

INSERT INTO tempTBL VALUES (1, 'This');
INSERT INTO employees VALUES (2, 'MySQL');

SELECT * FROM tempTBL;
SELECT * FROM employees;

USE employees;

SELECT * FROM tempTBL;
SELECT * FROM employees;

USE employees;

SELECT * FROM employees;


-- 테이블 삭제
-- drop table 테이블 이름
-- 외래키 제약 조건의 기준 테이블은 삭제할 수 없다
-- 먼저 외래키 테이블을 삭제해야 한다.
-- buytbl을 먼저 삭제 후 usertbl을 삭제해야
use tabledb;
drop table usertbl; 
-- delete on cascade 조건이 있어서 usertbl먼저 삭제 가능

use tabledb;
alter table usertbl
	add hompage varchar(30) -- column 추가
		default 'http://www.hanbit.com.kr' -- default 추가
        null; -- null 허용
        
select * from usertbl;

alter table usertbl
	drop column mobile1;
    
select * from usertbl;

alter table usertbl
	change column name uName varchar(20) NULL;
    
select * from usertbl;    

show index from usertbl;
describe usertbl;

select * from prodtbl;

alter table usertbl
	add constraint pk_usertbl_userid
	primary key(userid);

alter table buytbl
	add constraint fk_usertbl_buytbl
    foreign key(userid)
    references usertbl(userid);
    
    ALTER TABLE userTbl

DROP PRIMARY KEY; -- error

show index from usertbl;
show index from buytbl;

ALTER TABLE buyTbl
	DROP FOREIGN KEY fk_usertbl_buytbl;

ALTER TABLE userTbl
	DROP PRIMARY KEY; 

show index from usertbl;


create database tabledb;
USE tableDB;

DROP TABLE IF EXISTS buyTbl, userTbl;

CREATE TABLE userTbl (
	userID char(8),
	name nvarchar(10),
	birthYear int,
	addr nchar(2),
	mobile1 char(3),
	mobile2 char(8),
	height smallint,
	mDate date
);

CREATE TABLE buyTbl (
	num int AUTO_INCREMENT PRIMARY KEY,
	userid char(8),
	prodName nchar(6),
	groupName nchar(4),
	price int ,
	amount smallint
);

INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '김범수', NULL, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '김경호', 1871, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');

INSERT INTO buyTbl VALUES(NULL, 'KBS', '운동화', NULL , 30, 2);
INSERT INTO buyTbl VALUES(NULL,'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTbl VALUES(NULL,'JYP', '모니터', '전자', 200, 1);
INSERT INTO buyTbl VALUES(NULL,'BBK', '모니터', '전자', 200, 5);

select * from usertbl;
select * from buytbl;

alter table usertbl
	add constraint PK_userTbl_userID
    primary key (userID);
    
alter table buytbl
	add constraint fk_userTbl_buyTbl
    foreign key (userID)
    references userTbl(userID); -- error / BBK가 usertbl에 없다

SET SQL_SAFE_UPDATES = 0;
    
delete from buytbl where userid = 'BBK';

alter table buyTbl
	add constraint fk_userTbl_buyTbl
    foreign key (userID)
    references userTbl(userID); -- BBK를 삭제해줘서 제약조건 추가 가능
    
insert into buytbl values(null, 'BBK', '모니터', '전자', 200, 5);
-- error / BBK가 usertbl에 없으므로 입력안됨

set foreign_key_checks = 0; -- 외래키 조건 해제

INSERT INTO buyTbl VALUES(NULL, 'BBK', '모니터', '전자', 200, 5);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '청바지', '의류', 50, 3);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '메모리', '전자', 80, 10);
INSERT INTO buyTbl VALUES(NULL, 'SSK', '책' , '서적', 15, 5);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '책' , '서적', 15, 2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '청바지', '의류', 50, 1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '운동화', NULL , 30, 2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '책' , '서적', 15, 1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '운동화', NULL , 30, 2);
-- 입력 가능

set foreign_key_checks = 1; -- 외래키 조건 재설정

-- check - mysql에서 지원하지 않는다.
select * from usertbl;

alter table usertbl
	add constraint ck_birthYear
    check (birthYear >= 1950 And birthYear <= Year(CURDATE()));
    
INSERT INTO userTbl VALUES('SSK', '성시경', 1979, '서울', NULL , NULL , 186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', '윤종신', 1969, '경남', NULL , NULL , 170, '2005-5-5');
INSERT INTO userTbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO userTbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');    

select * from usertbl;


-- update 

update usertbl set userid = 'VVK' where userid = 'BBK';
-- error / BBK 가 foreign key 로 되어있기 때문에 안 바뀜.
SET foreign_key_checks = 0;
UPDATE userTbl SET userID = 'VVK' WHERE userID='BBK';
-- foreign_key_checks = 0 으로 두고 강제로 바꿈
SET foreign_key_checks = 1;

select b.userid, u.name, b.prodName, u.addr, u.mobile1 + u.mobile2 as '연락처'
from buytbl b 
	 inner join usertbl u
     on b.userid = u.userid;
-- bbk를 바꿨기 때문에 조회되지 않음
-- 문제가 발생한다.
-- foreign_key_checks 를 설정하여 강제로 바꾸는 방법은 추천하지 않는다.
     
select count(*) from buytbl;
select * from buytbl;


select b.userid, u.name, b.prodName, u.addr, u.mobile1 + u.mobile2 as '연락처'
from buytbl b
	 left outer join usertbl u
     on b.userid = u.userid
order by b.userid;

set foreign_key_checks = 0;
update usertbl set userid = 'BBK' where userid = 'VVK';
set foreign_key_checks = 1;


alter table buytbl
	drop foreign key fk_usertbl_buytbl;
    
-- on update cascade

alter table usertbl
	add constraint primary key (userid);

alter table buytbl
	add constraint fk_usertbl_buytbl
    foreign key (userid) references usertbl(userid)
    on update cascade;
-- on update cascade : 기본키에서 값을 수정하면 외래키에서 값도 자동으로 바뀐다.

update usertbl set userid = 'VVK' where userid = 'BBK';

select b.userid, u.name, b.prodName, u.addr, u.mobile1 + u.mobile2 as '연락처'
from buytbl b 
	 inner join usertbl u
     on b.userid = u.userid
order by b.userid;

delete from usertbl where userid = 'VVK';
-- 외래키의 참조를 받고 있기 때문에 삭제안됨alter

alter table buytbl
	drop foreign key fk_usertbl_buytbl;
    
alter table buytbl
	add constraint fk_usertbl_buytbl
	foreign key (userid)
    references usertbl(userid)
    on update cascade
    on delete cascade;
-- on delete cascade : 기본키 삭제시 참조하고 있는 테이블의 항목들도 자동으로 삭제    

delete from usertbl where userid = 'VVK';
select * from buytbl;
-- buytbl에서 userid가 VVK 인 것들도 함께 삭제됨

alter table usertbl
	drop column birthYear;
    
    
-- <view> --

use tableDB;

create view v_userTbl
as 
	select userid, name, addr 
    from usertbl;
    
select * from v_usertbl;

/*
View 의 장점
	1. 보안에 도움
	2. 복잡한 쿼리를 단순화
*/

SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM userTbl U
	 INNER JOIN buyTbl B
	 ON U.userid = B.userid ;
 
CREATE VIEW v_userbuyTbl
AS
	SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
	FROM userTbl U
		 INNER JOIN buyTbl B
		 ON U.userid = B.userid ;

SELECT * FROM v_userbuyTbl WHERE name = '김범수';
-- 뷰를 테이블처럼 사용할 수 있다


create database sqlDB;

use sqldb;

CREATE TABLE userTbl ( -- 회원 테이블
	userID CHAR(8) NOT NULL PRIMARY KEY, -- 사용자아이디
	name VARCHAR(10) NOT NULL, -- 이름
	birthYear INT NOT NULL, -- 출생년도
	addr CHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
	mobile1 CHAR(3), -- 휴대폰의 국번(011, 016, 017, 018, 019, 010 등)
	mobile2 CHAR(8), -- 휴대폰의 나머지 전화번호(하이픈제외)
	height SMALLINT, -- 키
	mDate DATE -- 회원 가입일
);

CREATE TABLE buyTbl ( -- 회원 구매 테이블
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
	userID CHAR(8) NOT NULL, -- 아이디(FK)
	prodName CHAR(6) NOT NULL, -- 물품명
	groupName CHAR(4) , -- 분류
	price INT NOT NULL, -- 단가
	amount SMALLINT NOT NULL, -- 수량
	FOREIGN KEY (userID) REFERENCES userTbl(userID)
);

INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
INSERT INTO userTbl VALUES('SSK', '성시경', 1979, '서울', NULL , NULL , 186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', '윤종신', 1969, '경남', NULL , NULL , 170, '2005-5-5');
INSERT INTO userTbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO userTbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');

INSERT INTO buyTbl VALUES(NULL, 'KBS', '운동화', NULL , 30, 2);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '모니터', '전자', 200, 5);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '청바지', '의류', 50, 3);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '메모리', '전자', 80, 10);
INSERT INTO buyTbl VALUES(NULL, 'SSK', '책' , '서적', 15, 5);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '책' , '서적', 15, 2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '청바지', '의류', 50, 1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '운동화', NULL , 30, 2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '책' , '서적', 15, 1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '운동화', NULL , 30, 2);

use sqldb;
create view v_userbuyTbl
as
	select u.userid as 'UserID', u.name as 'UserName',
    b.prodName as 'ProductName', u.addr, concat(u.mobile1, u.mobile2) as ' MobilePhone'
    from usertbl u
		 inner join buytbl b
         on u.userid = b.userid;
         
select * from v_userbuytbl;

select `UserID`, `UserName` from v_userbuytbl;
-- View에 있는 칼럼을 선택할 때는 ` `(백틱)을 사용한다. '' 따옴표 아님!
# select 'userid', 'username' from v_userbuytbl;
-- 그냥 'userid', 'username' 만 출력

alter view v_userbuyTbl
as
	select u.userid as '사용자 아이디', u.name as '이름', b.prodName as '제품 이름',
    u.addr as '주소', concat(u.mobile1, u.mobile2) as '전화 번호'
    from usertbl u
    inner join buytbl b
    on u.userid = b.userid;
    
select `이름`, `전화 번호`
from v_userbuytbl;

drop view v_userbuytbl;

/*
view를 사용하는 이유
	1. 보안에 도움이 된다.
	2. 복잡한 쿼리를 단순화한다.
*/

use sqldb;
create or replace view v_usertbl
as
	select userid, name, addr
    from usertbl;
    
describe v_usertbl;

# show create view v_usertbl;

select * from v_usertbl
where userid = 'JKW';

update v_usertbl set addr = '부산'
where userid = 'JKW';

select * 
from v_usertbl;

insert into v_usertbl(userid, name, addr) values ('KBM', '김병만', '충북');
################## 원래 에러인가요?

create view v_sum
as
	select userid as 'userid', sum(price*amount) as 'total'
    from buytbl
    group by userid;
    
select *
from v_sum;

select * from information_schema.views -- 시스템에 저장된 모든 뷰
where table_schema = 'sqldb' and table_name = 'v_sum';

create view v_height177
as 
	select * 
    from usertbl 
    where height >= 177;
    
select * from v_height177;

delete from v_height177 where height < 177;

INSERT INTO v_height177 VALUES('KBM', '김병만', 1977 , '경기', '010', '5555555', 158, '2019-01-01');
-- view에서는 보이지 않지만 usertbl에는 입력된다.

select * from usertbl;

alter view v_height177
as 
	select *
    from usertbl
    where height >= 177
    with check option; -- 입력차단
    
INSERT INTO v_height177 VALUES('WDT', '서장훈', 2006 , '서울', '010', '3333333', 155, '2019-3-3') ;
-- check option으로 height >= 177 인 행들만 넣을 수 있기 때문에 입력되지 않는다.

drop view v_userbuytbl;

create view v_userbuytbl
as
	select u.userid, u.name, b.prodName, u.addr, concat(u.mobile1, u.mobile2) as '연락처'
    from usertbl u
		 inner join buytbl b
         on u.userid = b.userid;
         
insert into v_userbuytbl values ('PKL','박경리','운동화','경기','00000000000','2020-2-2');
-- 두 개 이상의 테이블이 연결된 view는 업데이트할 수 없다.

drop table if exists buytbl, usertbl;

select * from v_userbuytbl; -- view를 구성하던 테이블이 하나라도 사라지면 view도 사라짐

check table v_userbuytbl; -- View의 상태 체크