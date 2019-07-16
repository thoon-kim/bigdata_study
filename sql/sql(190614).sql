use sqldb;

select cast('2020-10-19 12:35:29.123' AS Date) as 'date';
select cast('2020-10-19 12:35:29.123' AS Time) as 'time';
select cast('2020-10-19 12:35:29.123' AS Datetime) as 'datetime';
-- Cast( expression as type ) : expression 을 타입으로 형변환

Set @myVar1 = 5;
Set @myVar2 = 3;
Set @myVar3 = 4.25;
Set @myVar4 = '가수 이름 ==> ';
-- 변수 설정

Select @myVar1;
Select @myVar2 + @myVar3;
Select @myVar4, Name From usertbl where height > 180;

Set @myVar1 = 3;

PREPARE myQuery
	From 'Select Name, height from usertbl order by height limit ?';
EXECUTE myQuery Using @myVar1;
-- ? 에 특정값을 넣어서 Query 사용 가능


use sqldb;

select avg(amount) as '평균 구매 개수' from buytbl;
select cast(avg(amount) as signed integer) as '평균 구매 개수' from buytbl;
select convert(avg(amount), signed integer) as '평균 구매 개수' from buytbl;
-- convert(expresson, type) : expression을 type으로 형변환
-- 평균 구매 개수 구하기

select cast('2020$12$12' as Date); 
select cast('2020/12/12' as Date);
select cast('2020%12%12' as Date);
select cast('2020@12@12' as Date);
-- 네 가지 결과값 다 똑같음

select num, concat(cast(price as Char(10)), ' X ', 
				   cast(amount as char(4)), ' =') as '단가x수량', 
                   price*amount as '구매액'
from buytbl;

select '100' + '200';  -- 문자와 문자를 더함 (정수로 변환되서 연산됨)
select concat('100', '200'); -- 문자와 문자를 연결(문자로 처리)
select concat(100, '200'); -- 정수와 문자를 연결(정수가 문자로 변환되서 처리)

select if(100 > 200, '참', '거짓');
-- if(expression, t, f) : expression이 true면 t 아니면 f 출력
select ifnull(NULL, 'Yes Null'), ifnull(100, 'Yes Null');
-- ifnull(expression, t) : expression이 null이면 t 출력 아니면 expression 출력
select nullif(100, 100), nullif(200, 100);
-- nullif(exp1, exp2) : exp1 = exp2 이면 null 출력 아니면 exp1

select case 10
	when 1 then '일'
    when 5 then '오'
    when 10 then '십'
    else '모름'
end;
-- case 10의 값에 따라 when 조건절을 실행

select bit_length('abc'), char_length('abc'), length('abc');
-- byte 길이 ( 24 / 3 / 3 )
select bit_length('가나다'), char_length('가나다'), length('가나다');
-- byte 길이 ( 72 / 3 / 9 )

select concat_ws('/', '2020', '01', '01');
-- concat_ws(sep, str1, str2, str3 ....) : sep로 str들을 이어준다.

#############################################
select elt(2, '하나', '둘', '셋'),
	   field('둘', '하나', '둘', '셋'),
       find_in_set('둘', '하나, 둘, 셋'),
       instr('하나둘셋', '둘'),
       locate('둘', '하나둘셋');

select format(123456.123456, 4);
#############################################

select insert('abcdefghi', 3, 4, '@@@@'),
	   insert('abcdefghi', 3, 2, '@@@@');
-- insert(str, start, num, substr) : str의 start 위치부터 num개의 단어를 substr로 바꿈

select left('abcdefghi', 3), right('abcdefghi', 3);
-- left(str, num), right(str, num) : str의 왼쪽/오른쪽에서부터 num개의 단어를 출력

select lower('abcdEFGH'), upper('abcdEFGH');

select lpad('이것이', 5, '##'),rpad('이것이', 5, '##');
-- lpad/rpad(str, len, substr) : str의 길이가 len이 될때까지 substr을 왼쪽/오른쪽에 붙여줌
-- lpad('이것이', 5, '##') == lpad('이것이', 5, '#')

select ltrim('   이것이'), rtrim('이것이   ');
-- 왼쪽/오른쪽 공백 제거

select repeat('이것이', 3);
-- repeat(str, num) : str을 num번 반복

select replace('이것이 mysql이다', '이것이', 'This is');
-- replace(str, substr, replace) : str의 substr을 replace로 바꿔줌

select reverse('mysql'); -- 역순 출력

select concat('이것이', space(10), 'MySQL이다');

select substring('대한민국만세', 3, 2);
-- substring(str, pos, len) : str의 pos번째 문자부터 len개 출력

select abs(-100); -- 절댓값

select ceiling(4.7), floor(4.7), round(4.7);
-- 올림, 내림, 반올림(5, 4, 5)
select ceiling(-4.7), floor(-4.7), round(-4.7);
-- (-4, -5, -5)

select conv('aa', 16, 2), conv(100, 10, 8);
-- ???????????

select mod(157, 10),
	   157 % 10,
       157 mod 10;
-- 나머지 계산

select pow(2, 3), sqrt(9);
-- pow 거듭제곱, sqrt 제곱근alter

select sign(100), sign(0), sign(100.123);

select truncate(12345.12345, 2), truncate(12345.12345, -2);
-- truncate(num, pos) : 소숫점 기준 2(두 번째), -2(반대로 두 번째)

use sqldb;

create table maxtbl(
	col1 longtext,
    col2 longtext );
    
insert into maxtbl values (repeat('a', 1000000), repeat('가', 1000000));

select length(col1), length(col2) from maxtbl;

insert into maxtbl values (repeat('A', 10000000), repeat('가', 10000000));
-- error

/*
CD %Programdata%
CD MySQL
CD 'MySQL Server 5.7'
DIR
notepad my.ini

max_allowed_packet = 4M -> 1000M

net stop mysql
net start mysql
*/

use sqldb;
insert into maxtbl values (repeat('A', 10000000), REPEAT('가',10000000));
-- max_allowed_packet을 늘려줘서 실행가능
select length(col1), length(col2) from maxtbl;

show variables like 'max%';
-- max로 시작하는 환경 변수들 확인

/*
	secure-file-priv=C:/TEMP
*/

use sqldb;
select * into outfile 'C:/Temp/userTBL.txt' From usertbl; 
-- usertbl 의 내용을 파일로 복사

create table membertbl like usertbl; -- 테이블 구조만 복사
load data local infile 'C:/Temp/userTBL.txt' into table membertbl; 
-- 파일의 내용을 membertbl로 복사
select * from membertbl;

-- </실습 2> --
select * from buytbl;
select * from usertbl;

use sqldb;

select * -- 구매자 주소 확인
from buytbl inner join usertbl
	 on buytbl.userid = usertbl.userid
where buytbl.userid = 'JYP';

select userid, name, prodname, addr, mobile1 + mobile2 as '연락처' -- 필요한 열만 추출
from buytbl inner join usertbl
	 on buytbl.userid = usertbl.userid;

select buytbl.userid, name, prodname, addr, mobile1 + mobile2 as '연락처' -- buytbl 기준
from buytbl inner join usertbl
	 on buytbl.userid = usertbl.userid;

select buytbl.userid, name, prodname, addr, mobile1 + mobile2 as '연락처' -- where문 활용
from buytbl, usertbl
where buytbl.userid = usertbl.userid;

select buytbl.userid, usertbl.name, buytbl.prodname, usertbl.addr, -- 모두 테이블명
	   usertbl.mobile1 + usertbl.mobile2 as '연락처'
from buytbl inner join usertbl
	 on buytbl.userid = usertbl.userid;


select b.userid, u.name, b.prodname, u.addr, u.mobile1 + u.mobile2 as '연락처' -- 별칭
from buytbl b inner join usertbl u
	 on b.userid = u.userid;
     
select b.userid, u.name, b.prodname, u.addr, u.mobile1 + u.mobile2 as '연락처'
from buytbl b inner join usertbl u
	 on b.userid = u.userid
where b.userid = 'JYP';

select u.userid, u.name, b.prodname, u.addr, u.mobile1 + u.mobile2 as '연락처' -- 회원테이블 기준
from usertbl u inner join buytbl b
	 on u.userid = b.userid
where b.userid = 'JYP';

select u.userid, u.name, b.prodname, u.addr, u.mobile1 + u.mobile2 as '연락처' -- 회원테이블 기준
from usertbl u inner join buytbl b
	 on u.userid = b.userid
order by u.userid;

select distinct u.userid, u.name, u.addr
from usertbl u inner join buytbl b
	 on u.userid = b.userid
order by u.userid;


-- <실습 4> --
drop table stdtbl;
drop table clubtbl;
drop table stdclubtbl;



use sqldb;
create table stdtbl(
	stdName varchar(10) not null primary key,
    addr Char(4) not null 
);
    
create table clubtbl(
	clubName varchar(10) not null primary key,
    roomNo char(4) not null
);
    
create table stdclubtbl(
	num int auto_increment not null primary key,
    stdName varchar(10) not null,
    clubName varchar(10) not null,
    
    foreign key (stdName) references stdtbl(stdName),
    foreign key (clubName) references clubtbl(clubName)
);

INSERT INTO stdTbl VALUES ('김범수','경남'), 
						  ('성시경','서울'),
						  ('조용필','경기'), 
                          ('은지원','경북'),
                          ('바비킴','서울');
                          
INSERT INTO clubTbl VALUES ('수영','101호'), 
						   ('바둑','102호'), 
                           ('축구','103호'), 
                           ('봉사','104호');
                           
INSERT INTO stdclubTbl VALUES (NULL, '김범수','바둑'), 
							  (NULL,'김범수','축구'), 
                              (NULL,'조용필','축구'), 
                              (NULL,'은지원','축구'), 
                              (NULL,'은지원','봉사'), 
                              (NULL,'바비킴','봉사');

select * from stdtbl;
select * from clubtbl;
select * from stdclubtbl;

select s.stdName, s.addr, c.clubName, c.roomNo
From stdtbl s 
	 inner join 
     stdclubtbl sc on s.stdName = sc.stdName
     inner join 
	 clubtbl c on sc.clubName = c.clubName
order by s.stdname;

select c.clubName, c.roomNo, s.stdName, s.addr
from stdtbl s
	 inner join
	 stdclubtbl sc on sc.stdName = s.stdName
     inner join
     clubtbl c on sc.clubName = c.clubName
order by c.clubName;


-- </실습 4> --

use sqldb;
select u.userid, u.name, b.prodName, u.addr, concat(u.mobile1, u.mobile2) as '연락처'
from usertbl u
	 left outer join
     buytbl b
	 on u.userid = b.userid
order by u.userid;

select u.userid, u.name, b.prodName, u.addr, concat(u.mobile1, u.mobile2) as '연락처'
from buytbl b
	 right outer join
     usertbl u
     on u.userid = b.userid
order by u.userid;

select u.userid, u.name, b.prodName, u.addr, concat(u.mobile1, u.mobile2) as '연락처'
from usertbl u
	 left outer join
     buytbl b
     on u.userid = b.userid
where b.prodName is NULL
order by u.userid;


-- <실습 5> --
use sqldb;
select s.stdName, s.addr, c.clubName, c.roomNo
from stdtbl s
	 left outer join
     stdclubtbl sc
     on s.stdName = sc.stdName
     left outer join
     clubtbl c
     on sc.clubName = c.clubName
order by s.stdName;

select c.clubName, c.roomNo, s.stdName, s.addr
from stdtbl s
	 left outer join
     stdclubtbl sc
     on sc.stdName = s.stdName
     right outer join
     clubtbl c
     on sc.clubName = c.clubName
order by c.clubName;

select s.stdName, s.addr, c.clubName, c.roomNo
from stdtbl s
	 left outer join
     stdclubtbl sc
     on s.stdName = sc.stdName
     left outer join
     clubtbl c
     on sc.clubName = c.clubName
Union
select s.stdName, s.addr, c.clubName, c.roomNo
from stdtbl s
	 left outer join
     stdclubtbl sc
     on sc.stdName = s.stdName
     right outer join
     clubtbl c
     on sc.clubName = c.clubName;
     

use sqldb;
select stdName, addr from stdtbl -- 중복된 열 포함 / union 중복된 열 제거
union all
select clubName, roomNo from clubtbl;

select name, concat(mobile1, mobile2) as '전화번호' -- 전화번호 없는 사람 제거
from usertbl
where name not in (select name
				   from usertbl
				   where mobile1 is NULL);

select name, concat(mobile1, mobile2) as '전화번호' -- 전화번호 없는 사람 조회
from usertbl
where name in (select name
			   from usertbl
               where mobile1 is NULL);
               
drop procedure if exists ifProc; -- 기존에 만든 적이 있다면 삭제

DELIMITER $$
create procedure ifProc()
Begin
	declare var1 int; -- var1 변수 선언
	set var1 = 100; -- 변수에 값 대입

	if var1 = 100 Then -- 만약 @var1이 100이라면
		select '100입니다.'; 
	else
		select '100이 아닙니다.';
	end if;
END $$

DELIMITER ;
call ifProc();

drop procedure if exists ifProc3;
DELIMITER $$

create procedure ifProc3()
BEGIN
	declare point int;
    declare credit char(1);
    set point = 77;
    
    if point >= 90 Then
		set credit = 'A';
	elseif point >= 80 Then
		set credit = 'B';
	elseif point >= 70 Then
		set credit = 'C';
	elseif point >= 60 Then
		set credit = 'D';
	else
		set credit = 'F';
	End if;
    select concat('취득접수 ==>', point),
		   concat('취득학접 ==>', credit);
END $$

DELIMITER ;
CALL ifProc3();


drop procedure if exists caseProc;
DELIMITER $$

create procedure caseProc()
BEGIN
	declare point int;
    declare credit char(1);
    set point = 77;
    
    case
		when point >= 90 then
			set credit = 'A';
		when point >= 80 then
			set credit = 'B';
		when point >= 70 then
			set credit = 'C';
		when point >= 60 then
			set credit = 'D';
		else
			set credit = 'F';
	end case;
    
    select concat('취득점수 ==> ', point),
		   concat('취득학점 ==> ', credit);
END $$

DELIMITER ;
CALL caseProc();

use sqldb;
select u.userid, u.name, sum(price * amount) as '총 구매액',
	   case
			when (sum(price * amount) >= 1500) then
				'최우수 고객'
			when (sum(price * amount) >= 1000) then
				'우수 고객'
			when (sum(price * amount) >= 1) then
				'일반 고객'
			else
				'유령 고객'
		END as '고객 등급'
from buytbl b
	 right outer join
     usertbl u
     on b.userid = u.userid
group by u.userid, u.name
order by sum(price * amount) desc;


-- </실습 7> --
DROP procedure if exists whileProc;
DELIMITER $$

CREATE PROCEDURE whileProc()
BEGIN
	declare i int; -- 1에서 100까지 증가할 변수
    declare hap int; -- 더한 값을 누적할 변수
    set i = 1;
    set hap = 0;
    
    while ( i <= 100) DO
		set hap = hap + i;
        set i = i + 1; -- i++
	END while;
    
    select hap;
END $$

DELIMITER ;
CALL whileProc();








