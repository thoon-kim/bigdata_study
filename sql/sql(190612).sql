SELECT * From shopdb.membertbl;

use employees; -- 추가한 테이블 사용
SHOW tables; -- employee db 안에 있는 테이블의 목록

 -- Ctrl + Shift + Enter : 전부 실행
 -- 마우스 드래그 + Ctrl + Shift + Enter : 선택된 부분 실행
 -- Ctrl + Enter : 커서가 있는 줄만 실행

SELECT * FROM dept_manager;

use shopdb;

Select membername, memberaddress from membertbl; -- member의 이름과 주소 전부

-- alter table membertbl change "memberaddressl" "memberaddress" char(20);

Select * From membertbl where membername = '지운이'; -- 이름이 지운이 모든 정보

create table test (id int, address char);
create table test1 (id int);

show tables;

insert into test1 values(1); -- test1 에 id 1 추가
insert into test1(id) values(2); -- test1 에 id 2 추가

select * from test1;

use employees;
select * from shopdb.membertbl;
show tables;
select * from titles;

select first_name, last_name, gender -- 이름과 열을 가지고 옴
from employees;

/*
select * from titles;
*/

show databases; -- db의 목록
use employess; -- db 선택
show tables; -- db안의 table 목록
show table status; -- table에 대한 자세한 정보

describe employees;
select first_name, gender from employees;
select first_name as 이름, gender 성별 from employees;

drop database if exists sqldb;
create database sqldb;
show databases;
use sqldb;

create table usertbl
( userid char(8) not null primary key,
  name varchar(10) not null,
  birthyear int(10) not null,
  addr char(2) not null,
  mobile1 char(3),
  mobile2 char(8),
  height smallint,
  mdate date );
  
show tables;

create table buytbl
( num int auto_increment not null primary key,
  userid char(8) not null,
  prodname char(8) not null,
  groupname char(4),
  price int not null,
  amount smallint not null,
  foreign key (userid) references usertbl(userid) );
  
show tables;

insert into usertbl values('LSG', '이승기', 1987, '서울', '011', '11111111', 182, '2008-8-8');
insert into usertbl values('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
insert into usertbl values('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
insert into usertbl values('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
insert into usertbl values('SSK', '성시경', 1979, '서울', null, null, 186, '2013-12-12');
insert into usertbl values('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
insert into usertbl values('YJS', '윤종신', 1969, '경남', null, null, 170, '2005-5-5');
insert into usertbl values('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
insert into usertbl values('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
insert into usertbl values('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');
 
insert into buytbl values(null, 'KBS', '운동화', null, 30, 2);
insert into buytbl values(null, 'KBS', '노트북', '전자', 1000, 1);
insert into buytbl values(null, 'JYP', '모니터', '전자', 200, 1);
insert into buytbl values(null, 'BBK', '모니터', '전자', 200, 5);
insert into buytbl values(null, 'KBS', '청바지', '의류', 50, 3);
insert into buytbl values(null, 'BBK', '메모리', '전자', 80, 10);
insert into buytbl values(null, 'SSK', '책', '서적', 15, 5);
insert into buytbl values(null, 'EJW', '책', '서적', 15, 2);
insert into buytbl values(null, 'EJW', '청바지', '의류', 30, 2);
insert into buytbl values(null, 'BBK', '운동화', null, 30, 2);
insert into buytbl values(null, 'EJW', '책', '서적', 15, 1);
insert into buytbl values(null, 'BBK', '운동화', null, 30, 2);

select * from usertbl;
select * from buytbl;