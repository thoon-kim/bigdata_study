create database webdb;
use webdb;
show databases;
show tables;

create table pet(
 name varchar(20),
 owner varchar(20),
 species varchar(20),
 sex char(1),
 birth date,
 death date );
 
show tables;
 
-- drop tables pet;
 
insert into pet values ('Fluffy','Harold','cat','f','1999-02-04',null);
load data local infile 'C:/Temp/pet_table.txt' into table pet; -- data 넣기

select * from pet where species = 'dog' and sex = 'f';
select * from pet where species = 'snake' or species = 'bird';

select name, birth from pet;

select name, birth from pet order by birth; -- 생일 순 정렬 오름차순 
select name, birth from pet order by birth desc; -- 생일 순 정렬 내림차순

select name from pet where death is not null; -- 죽은 애완견
select name from pet where death is null; -- 살아있는 애완견

select * from pet where name like 'b%'; -- 이름이 b로 시작하는 애완견
select * from pet where name like '%fy'; -- 이름이 fy로 끝나는 애완견
select * from pet where name like '%w%'; -- 이름 가운데 w가 들어가는 애완견
select * from pet where name like '_____'; -- 이름이 다섯글자인 애완견

select * from pet where name regexp '^b'; -- 이름이 b로 시작하는 애완견(정규식)
select * from pet where name regexp 'fy$'; -- 이름이 fy로 끝나는 애완견(정규식)

select count(*) from pet; -- 전체 행(데이터)의 갯수

set sql_safe_updates = 0; -- safe update modul 을 0 으로 설정
# sql_safe_updates : 데이터를 수정하지 못하도록 막아주는 것
update pet set death = null where death = '0000-00-00'; -- death 값이 0000-00-00 인 것을 null로

update pet set species = 'dog' where name = 'claws'; -- name = claws 의 species를 dog으로

update pet set species = 'pig' where birth < '1990-01-01';
select * from pet where birth < '1990-01-01'; -- 생일이 1990년 이전인 애완견


show variables like 'secure-files%'; -- 보안 관련 환경설정 값 확인 / 딱히 안 중요

use sqldb;
show tables;

select * from usertbl where name = '김경호'; -- 이름이 김경호인 사람의 데이터


select userid, name from usertbl 
where height >= 182 and birthyear > 1970; -- 생일이 1970 이 후, 키 182 이상

select userid, name from usertbl
where height >= 180 and height <= 182; -- 키가 180 이상, 182 이하

select userid, name from usertbl
where height between 180 and 182; -- 같은 문제 between 사용

select name, addr from usertbl
where addr in ('경남', '전남', '경북'); -- 주소가 경남, 전남, 경북

select name, addr from usertbl
where addr = '경남' or addr = '전남' or addr = '경북'; -- 같은 문제 다른 방법

select name, height from usertbl
where name like '김%'; -- 성이 '김' 인 사람

select name, height from usertbl
where name like '_종신'; -- 성이 한 글자 이름이 '종신'

select name, height from usertbl
where height >= 177; -- 키가 177 이상

select name, height from usertbl
where height > (select height 
				from usertbl 
				where name = '김경호'); -- 김경호보다 키가 큰 사람
                
select name, height from usertbl
where height > all (select height
					from usertbl
					where addr = '경남'); -- 주소가 경남인 사람의 키보다 큰 사람들
                    
select name, height from usertbl
where height in (select height
				 from usertbl
                 where addr = '경남'); -- 주소가 경남인 사람의 키와 동일한 사람들
                 
select name, height from usertbl
where height = any (select height
				    from usertbl
                    where addr = '경남'); -- 같은 문제 다른 방법

select name, mdate from usertbl order by mdate; -- 이름, 가입일자 출력 / 가입일자 오름차순 정렬
select name, mdate from usertbl order by mdate desc; -- 이름, 가입일자 출력 / 가입일자 내림차순 정렬

select name, height from usertbl
order by name asc, height desc; -- 이름 오름차순, 키 내림차순 정렬

select distinct addr from usertbl; -- 중복되지 않은 주소


use employees;
select emp_no, hire_date from employees
order by hire_date; -- emp_no, hire_date / hire_date 오름차순

select emp_no, hire_date from employees
order by hire_date limit 5; -- 입사 시기가 가장 오래된 5명

select emp_no, hire_date from employees
order by hire_date limit 10, 10; -- 입사 시기가 오래된 10번쩨부터 20번째 까지

use sqldb;
create table buytbl2 (
 select * from buytbl
); -- buytbl2 생성 / 내용은 buytbl 과 똑같이

select userid, sum(amount) from buytbl group by userid; -- 아이디, 총 구매 갯수

select userid 아이디, sum(amount) 총_구매개수 from buytbl group by userid; -- 아이디, 총 구매 갯수(출력 칼럼명 변경)
select userid 아이디, avg(amount) 평균_구매개수 from buytbl group by userid; -- 아이디, 평균 구매 갯수(출력 칼럼명 변경)

select userid 아이디, sum(amount * price) 총구매금액
from buytbl group by userid; -- 총구매금액 userid 묶기

select userid 아이디, sum(amount * price) 총구매금액
from buytbl group by userid order by 총구매금액;  -- 총구매금액 userid / 총구매금액 오름차순 정렬

select max(height), min(height) from usertbl; -- 키의 최댓값과 최솟값

select name , height from usertbl
where height = (select max(height) from usertbl) or 
	  height = (select min(height) from usertbl); -- 가장 큰 사람, 가장 작은 사람
      
select name , height from usertbl
where height in ((select max(height) from usertbl), 
				 (select min(height) from usertbl)); -- 같은 문제 다른 방법
                
select count(*) from usertbl; -- usertbl 데이터 갯수

select count(mobile1) 전화번호_등록자수 from usertbl; -- 전화번호등록자수
select count(*) 전화번호_등록자수 from usertbl where mobile1 is not null; 

select userid, sum(amount*price) total_money from buytbl 
group by userid; -- 아이디별 총 구매 금액

select userid, sum(amount*price) total_money from buytbl 
group by userid having total_money >= 1000; -- 아이디별 총 구매 금액 1000 이상
-- group by 시 조건은 having 절 사용 (where 안 됨)

select userid, sum(amount*price) total_money from buytbl 
group by userid having total_money >= 1000 order by total_money; -- 아이디별 총 구매 금액 1000 이상 오름차순


-- Table 조작

create table testtbl1(
 id int,
 username char(3),
 age int );

insert into testtbl1 values (1, '홍길동', 25);
-- insert into testtbl1 values (2, '설현'); // 이거는 에러
insert into testtbl1(id, username) values (2, '설현');
insert into testtbl1(username, age, id) values ('초아', 26, 3);
select * from testtbl1;

create table testtbl2(
	id int auto_increment primary key,
    username char(3),
    age int );
    
insert into testtbl2 values (null, '지민', 25);
insert into testtbl2 values (null, '유나', 22);
insert into testtbl2 values (null, '유경', 21);
select * from testtbl2;

use sqldb;

create table testtbl5 (
	select emp_no, first_name, last_name
    from employees.employees
); -- 대량 데이터 테이블 생성

create table testtbl4 (
	id int,
    fname varchar(50),
    lname varchar(50)
);

insert into testtbl4 (select emp_no, first_name, last_name 
					  from employees.employees); -- 대량 데이터 테이블 생성
                      
-- 데이터 수정

select * from testtbl4 where fname = 'Parto';

update testtbl4 set lname = '없음'
where fname = 'Parto'; -- fname = 'parto' 인 사람들의 lname을 바꿔준다.
                      
select prodname, price from buytbl;
update buytbl set price = price * 1.5; -- price 를 1.5배로
select * from buytbl;
            
-- 데이터 삭제

select * from testtbl4 where fname = 'Aamer';
delete from testtbl4 where fname = 'Aamer'; -- fname = 'Aamer' 인 사람들을 삭제
select * from testtbl4 where fname = 'Aamer'; -- 아무것도 없음

select count(*) from testtbl4 where fname = 'Parto'; -- 삭제 전 228명
delete from testtbl4 where fname = 'Parto' limit 100; -- 100명만 삭제
select count(*) from testtbl4 where fname = 'Parto'; -- 삭제 후 128명


            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            