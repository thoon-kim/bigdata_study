SELECT * From shopdb.membertbl;

use employees; -- �߰��� ���̺� ���
SHOW tables; -- employee db �ȿ� �ִ� ���̺��� ���

 -- Ctrl + Shift + Enter : ���� ����
 -- ���콺 �巡�� + Ctrl + Shift + Enter : ���õ� �κ� ����
 -- Ctrl + Enter : Ŀ���� �ִ� �ٸ� ����

SELECT * FROM dept_manager;

use shopdb;

Select membername, memberaddress from membertbl; -- member�� �̸��� �ּ� ����

-- alter table membertbl change "memberaddressl" "memberaddress" char(20);

Select * From membertbl where membername = '������'; -- �̸��� ������ ��� ����

create table test (id int, address char);
create table test1 (id int);

show tables;

insert into test1 values(1); -- test1 �� id 1 �߰�
insert into test1(id) values(2); -- test1 �� id 2 �߰�

select * from test1;

use employees;
select * from shopdb.membertbl;
show tables;
select * from titles;

select first_name, last_name, gender -- �̸��� ���� ������ ��
from employees;

/*
select * from titles;
*/

show databases; -- db�� ���
use employess; -- db ����
show tables; -- db���� table ���
show table status; -- table�� ���� �ڼ��� ����

describe employees;
select first_name, gender from employees;
select first_name as �̸�, gender ���� from employees;

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

insert into usertbl values('LSG', '�̽±�', 1987, '����', '011', '11111111', 182, '2008-8-8');
insert into usertbl values('KBS', '�����', 1979, '�泲', '011', '2222222', 173, '2012-4-4');
insert into usertbl values('KKH', '���ȣ', 1971, '����', '019', '3333333', 177, '2007-7-7');
insert into usertbl values('JYP', '������', 1950, '���', '011', '4444444', 166, '2009-4-4');
insert into usertbl values('SSK', '���ð�', 1979, '����', null, null, 186, '2013-12-12');
insert into usertbl values('LJB', '�����', 1963, '����', '016', '6666666', 182, '2009-9-9');
insert into usertbl values('YJS', '������', 1969, '�泲', null, null, 170, '2005-5-5');
insert into usertbl values('EJW', '������', 1972, '���', '011', '8888888', 174, '2014-3-3');
insert into usertbl values('JKW', '������', 1965, '���', '018', '9999999', 172, '2010-10-10');
insert into usertbl values('BBK', '�ٺ�Ŵ', 1973, '����', '010', '0000000', 176, '2013-5-5');
 
insert into buytbl values(null, 'KBS', '�ȭ', null, 30, 2);
insert into buytbl values(null, 'KBS', '��Ʈ��', '����', 1000, 1);
insert into buytbl values(null, 'JYP', '�����', '����', 200, 1);
insert into buytbl values(null, 'BBK', '�����', '����', 200, 5);
insert into buytbl values(null, 'KBS', 'û����', '�Ƿ�', 50, 3);
insert into buytbl values(null, 'BBK', '�޸�', '����', 80, 10);
insert into buytbl values(null, 'SSK', 'å', '����', 15, 5);
insert into buytbl values(null, 'EJW', 'å', '����', 15, 2);
insert into buytbl values(null, 'EJW', 'û����', '�Ƿ�', 30, 2);
insert into buytbl values(null, 'BBK', '�ȭ', null, 30, 2);
insert into buytbl values(null, 'EJW', 'å', '����', 15, 1);
insert into buytbl values(null, 'BBK', '�ȭ', null, 30, 2);

select * from usertbl;
select * from buytbl;