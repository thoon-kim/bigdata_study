# sales database 생성
create database sales;

# sales database 선택
use sales;

# test table 생성
# test column 생성 - datatype -  DECIMAL(5,3)
create table test(
	test decimal(5,3)
);

# 값 10.5 입력
insert test values (10.5);

# test테이블 출력
select * from test;

# 값 입력 - 12.55555
insert test values (-12.55555);

## 칼럼 추가  `test_fl` - FLOAT(5,3) NULL AFTER `test`
alter table test add column test_f1 float(5,3);

## 값 입력 - test_fl : 14.55555 / test : 16.55555
insert test values (16.55555, 14.5555);

select * from test;

## test table 삭제
drop table test;

select * from test;

/*
sales 테이블 생성
	purchase_number - INT  ,
    date_of_purchase - DATE NOT NULL,     
    customer_id - INT,
    item_code - VARCHAR(10) NOT NULL
 */   
    
create table sales (
	purchase_number  INT  auto_increment primary key,
	date_of_purchase  DATE NOT NULL,     
	customer_id  INT,
	item_code  VARCHAR(10) NOT NULL
);

/*
customers 테이블 생성
    customer_id - INT,
    first_name - varchar(255),
    last_name - varchar(255),
    email_address - varchar(255),
    number_of_complaints - int
*/

create table customers (
	customer_id  INT,
    first_name  varchar(255),
    last_name  varchar(255),
    email_address  varchar(255),
    number_of_complaints  int
);

## sales 테이블의 purchase_number를 primary key로 지정 - 2가지 방범/ not null로 지정/ auto_increment로 지정
drop table if exists sales;

create table sales(
	purchase_number INT not null auto_increment primary key,
	date_of_purchase  DATE NOT NULL,     
	customer_id  INT,
	item_code  VARCHAR(10) NOT NULL
);

drop table if exists sales;

create table sales(
	purchase_number INT not null auto_increment,
	date_of_purchase  DATE NOT NULL,     
	customer_id  INT,
	item_code  VARCHAR(10) NOT NULL,
    constraint primary key (purchase_number)
);

describe sales;

## customers 테이블의 customer_id를 primary key로 지정
drop table if exists customers;

create table customers (
	customer_id  INT primary key,
    first_name  varchar(255),
    last_name  varchar(255),
    email_address  varchar(255),
    number_of_complaints  int
);

drop table if exists customers;

create table customers (
	customer_id int, 
    first_name  varchar(255),
    last_name  varchar(255),
    email_address  varchar(255),
    number_of_complaints  int,
    primary key(customer_id)
);
    
#  customers table에 customer_id에 primary key 제약조건 추가
drop table if exists customers;

create table customers (
	customer_id int, 
    first_name  varchar(255),
    last_name  varchar(255),
    email_address  varchar(255),
    number_of_complaints  int
);

alter table customers
add constraint primary key pk_cust (customer_id);

describe customers;


#  sales 테이블에  purchase_number 칼럼에에 primary key 제약조건 추가
drop table if exists sales;

create table sales(
	purchase_number INT,
	date_of_purchase  DATE NOT NULL,     
	customer_id  INT,
	item_code  VARCHAR(10) NOT NULL
);

alter table sales
add constraint primary key pk_sales (purchase_number);

alter table sales
modify purchase_number int not null auto_increment;

describe sales;

# customers, sales 테이블의 정보 확인
describe customers;
describe sales;



/*
items 테이블 생성, 
	
	primary key - item_id
    item_id - VARCHAR(255),
    item - VARCHAR(255),
    unit_price - NUMERIC(10 , 2 ),
    company_id - VARCHAR(255),
*/ 

create table items (
    item_id  VARCHAR(255) primary key,
    item  VARCHAR(255),
    unit_price  NUMERIC(10 , 2 ),
    company_id  VARCHAR(255)
);

/*
companies 테이블 생성, 
	primary key - company_id
    company_id - VARCHAR(255),
    company_name - VARCHAR(255),
    headquarters_phone_number - INT(12),
*/ 

create table companies (
	company_id  VARCHAR(255),
	company_name  VARCHAR(255),
	headquarters_phone_number  INT(12),
	primary key(company_id)
);
    
## alter - customers테이블 - email_address - unique key로 지정
alter table customers
add constraint unique key uk_cust (email_address);

describe customers;

## sales table에 customer_id 외래키를 추가하고 삭제 시 자동 없데이트 옵션 
alter table sales
add constraint foreign key fk_sales (customer_id)
references customers(customer_id);

describe sales;

## customers테이블 gender column를 추가 - enum('M', 'F')
select * from customers;
alter table customers
add column gender enum('M', 'F') after last_name;

## customers 테이블 값 추가 - '01', 'John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0
insert customers values ('01', 'John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);

## customers 테이블 값 추가 - customer_id, first_name, last_name, gender, email_address -> 2, 'Peter', 'Figaro', 'M', 'sss@hotmail.com'
insert customers(customer_id, first_name, last_name, gender, email_address)
values (2,  'Peter', 'Figaro', 'M', 'sss@hotmail.com');

select * from customers;

## companies table의 company_name을 not null로 추가
describe companies;

alter table companies
modify company_name varchar(255) not null;

## company_name을 varchar(200), null로 변경
ALTER TABLE companies
modify COLUMN company_name varchar(200) null;

describe companies;

## employees database 선택
use employees;

## first_name, last_name 출력
select first_name, last_name
from employees;

## first_name이  'Denis'인 데이터 출력
select first_name, last_name
from employees
where first_name = 'Denis';
    
# 이름이 'Denis' 이고 남성인 데이터 출력
describe employees;

select first_name, last_name, gender
from employees
where first_name = 'Denis' and gender = 'M';

## 이름이 'Denis' 또는  'Elvis'인 데이터 출력
select first_name, last_name
from employees
where first_name = 'Denis' or first_name = 'Elvis';

## 이름이 'Cathie' , 'Mark', 'Nathan'에 해당하는 row출력 - in 사용
select first_name, last_name
from employees
where first_name in ('Cathie', 'Mark', 'Nathan');

## 이름이 'Cathie' , 'Mark', 'Nathan'에 해당하지 않는 row출력
select first_name, last_name
from employees
where first_name not in ('Cathie', 'Mark', 'Nathan');

## 이름이 Mar로 시작하는 row출력
select first_name, last_name
from employees
where first_name like 'Mar%';

## 이름이 ar로 끝나는 row출력
select first_name, last_name
from employees
where first_name like '%ar';

## 이름이 Mar로 시작하고 4글자인 row출력
select first_name, last_name
from employees
where first_name like 'Mar_';
-- where first_name like 'Mar%' and first_name like '____';

# 이름에 jack을 포한하는 row를 출력
select first_name, last_name
from employees
where first_name like '%jack%';

# hire_date이 '1990-01-01' 과 '2000-01-01' 사이인 row출력
select first_name, last_name, hire_date
from employees
where hire_date between '1990-01-01' and '2000-01-01';
    
# salary가 66000과 70000 사이인 row출력
select emp_no, salary
from salaries
where salary between 66000 and 70000;

# 이름이 null인 row출력
select first_name, last_name
from employees
where first_name is null;

# 이름이 null이 아닌 row출력
select first_name, last_name
from employees
where first_name is not null;
    
# salary가 150000  이상인 데이터 출력
select emp_no, salary
from salaries
where salary >= 150000;

# 중복없는 title 데이터 출력
select distinct title
from titles;
    
# 사원번호 갯수를 출력
select count(emp_no)
from employees;

# 중복없는 이름의 갯수 출력
select count(distinct first_name)
from employees;

# 연봉 100000이상인 사람의 총 수
select count(*)
from employees
where salary >= 100000;

# 메니저인 사람의 총 수 출력
select count(*)
from titles
where title = 'Manager';

# 성울 선순위, 이름을 차순위로 내림차순 정렬
select first_name, last_name
from employees
order by first_name, last_name;

# 연봉 상위 100명  출력
select emp_no, salary
from salaries
order by salary desc limit 100;

#중복 이름이 100 이상인 이름 목록 출력
select first_name, count(first_name)
from employees
group by first_name
having count(first_name) >= 100
order by count(first_name) desc;

# 평균 연봉이 120000 이상인 직원 번호와 평균 임금 출력
select emp_no, avg(salary)
from salaries
group by emp_no
having avg(salary) >= 120000;

# 중복 이름이 200번 이상인 사람의 이름과 중복된 이름의 갯수 출력
select first_name, count(first_name)
from employees
group by first_name
having count(first_name) >= 200
order by count(first_name) desc;

## departments에서 dept_no가 'd010'인 데이터의 dept_name을 'data analysis'로 수정하시오
update departments set dept_name = 'data analysis'
where dept_no = 'd010';

## employees 테이블에서 emp_no가 999903인 데이터를 삭제하시오
delete from employees 
where emp_no = '999903';

## departments에서 dept_no가 'd010'인 데이터를 삭제하시오
delete from departments
where dept_no = 'd010';