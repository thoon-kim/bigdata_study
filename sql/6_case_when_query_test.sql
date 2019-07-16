CREATE TABLE CASA_201312 (
	CUST_ID CHAR(13) PRIMARY KEY NOT NULL,
	CUST_SEG CHAR(10) NOT NULL,
	BALANCE_201311 DECIMAL(15,0),
	BALANCE_201312 DECIMAL(15,0)
);

INSERT INTO CASA_201312 VALUES ('54560', 'SILVER', 1000000, 2000000);
INSERT INTO CASA_201312 VALUES ('68477', 'GOLD', 112000, 3500);
INSERT INTO CASA_201312 VALUES ('96147', 'SILVER', 300000, 1000010);
INSERT INTO CASA_201312 VALUES ('32134', 'GOLD', 2354000, 3200000);
INSERT INTO CASA_201312 VALUES ('12478', 'DIAMOND', 6015000, 5800000);
INSERT INTO CASA_201312 VALUES ('54789', 'SILVER', 200000, 300000);
INSERT INTO CASA_201312 VALUES ('34181', 'GOLD', 4200000, 4100000);
INSERT INTO CASA_201312 VALUES ('23458', 'DIAMOND', 5000000, 6200000);
INSERT INTO CASA_201312 VALUES ('12344', 'SILVER', 210000, 200000);

select * from casa_201312;

-- 11월과 12월의 고객별 수신잔고 평균

-- 1. 11월 캠페인결과 잔고증가율이 10%이상인 고객은 1, 아니면 0으로 
--    캠페인 성공 여부를 새로운 칼럼으로 표시하시오
alter table casa_201312 add campaign int; -- campaign column 생성

update casa_201312
set campaign = 1
where BALANCE_201312 >= BALANCE_201311*1.1; -- update

update casa_201312
set campaign = 0
where BALANCE_201312 < BALANCE_201311*1.1;

select * 
from casa_201312; 
-- =========================================================================
select (case 
			when balance_201312 > balance_201311*1.1 then 1 
            else 0 
		end)
as accept from casa_201312;

-- 2. 캠페인 성공률을 계산하시오
select avg(campaign) as success_rate
from casa_201312;
-- =========================================================================
select avg(case 
			when balance_201312 > balance_201311*1.1 then 1 
            else 0 
		end)
as success_rate from casa_201312;

-- 3. 캠페인의 결과로 증가된 수신고 순 증가분을 구하시오
select (sum(balance_201312) - sum(balance_201311) ) as 증가분
from casa_201312;

-- 4. 캠페인 결과 수신고 증가율을 구하시오
select (sum(balance_201312) - sum(balance_201311))/sum(balance_201311) as 증가율
from casa_201312;


use company;

create table stud_score (
	student_id int,
	math_score int,
	eng_score int,
	phil_score int,
	music_score int
);

insert into stud_score values 
(123511,89,78,45,90),
(255475,88,90,null,87),
(9921100,87,null, null, 98),
(9732453,69,98,78,78),
(578981,59,90,89,null),
(768789,94,80,87,99),
(565789,58,64,72,null);

select * from stud_score;

-- 1. null값을 포함해서 행의 개수를 구하시오
select count(*)
from stud_score;

-- 1-1. null값을 포함한 행들만의 갯수..
select count(*)
from stud_score
where math_score is null or eng_score is null or
	  phil_score is null or music_score is null;
      
-- 2. null값을 제외한 음악점수 보유자의 숫자를 구하시오
select count(music_score)
from stud_score;

-- 3. null값 및 중복값을 제외한 영어점수 보유자의 수자를 구하시오
select count(distinct eng_score)
from stud_score;

-- 4. 수학점수의 총합을 구하시오
select sum(math_score)
from stud_score;

-- 5. 음악 점수의 평균을 구하시오
select avg(music_score) -- NULL이 아닌 사람들의 평균
from stud_score;

select avg(coalesce(music_score, 0)) -- NULL값 0으로 계산한 평균
from stud_score;

-- 6. 전과목 최고득점자의 학번을 구하시오
select student_id, (coalesce(math_score, 0) + coalesce(eng_score, 0) + 
					coalesce(phil_score, 0) + coalesce(music_score, 0)) as total_score
from stud_score
order by total_score desc limit 1;

-- 7. 수학점수의 최고점수와 최저점수를 구하시오
select max(math_score) as 수학_최고점, min(math_score) as 수학_최저점
from stud_score;

#####################################################################
-- 8. 평균점수가 가장 높은 과목은 무엇인가
select greatest(avg(math_score), avg(eng_score), 
				avg(phil_score), avg(music_score)) as great_avg
from stud_score;

-- 9. 과목 당 표준편차가 가장 작은 학생의 학번을 구하시오
-- 컬럼별 계산만 가능
select stddev(math_score), stddev(eng_score), 
	   stddev(phil_score), stddev(music_score)
from stud_score; 

-- 10. 분산이 가장 작은 과목은 무엇인가*/
-- 컬럼별 계산만 가능
select least(var_samp(math_score), var_samp(eng_score), 
			 var_samp(phil_score), var_samp(music_score))
from stud_score;
#####################################################################



create table staff_sal (
	id int,
	job char(10),
	current_sal int,
	eng_score int
);

insert into staff_sal value
(2148,'officer',40000,90),
(5780,'clerk',32000,98),
(6870, 'manager', 100000,80),
(4565, 'clerk', 30000,79),
(9687,'clerk', 33000,66),
(7337, 'manager', 100000,95),
(1321,'officer', 43000,80),
(9595, 'clerk', 30000, 50);

select * from staff_sal;

-- 1. 직위 별 연봉 평균을 구하시오
select job, avg(current_sal)
from staff_sal
group by job;

-- 2. clerk은 7%, officer는 5%, manager는 3% 연봉을 인상하기로 하였다. 
--    직원별 인상된 연봉을 현재연봉과 함께 계산하시오
select id, job, current_sal,
	case
		when job = 'clerk' then round(current_sal * 1.07, 0)
		when job = 'officer' then round(current_sal * 1.05, 0)
        when job = 'manager' then round(current_sal * 1.03, 0)
	end as increase_sal
from staff_sal;

-- 3. 연봉인상 기준이 직급과 영어점수에 따라 다음과 같다면 사원별 인상되는 연봉금액을 계산하시오. 
-- 90점 이상 5% / 90점 미만 0%
select id,job,eng_score,current_sal,
	case
		when job = 'clerk' and eng_score >= 90 then round(current_sal * 1.07 * 1.05, 0)
        when job = 'clerk' and eng_score < 90 then round(current_sal * 1.07, 0)
		when job = 'officer' and eng_score >= 90 then round(current_sal * 1.05 * 1.05, 0)
        when job = 'officer' and eng_score < 90 then round(current_sal * 1.05, 0)
        when job = 'manager' and eng_score >= 90 then round(current_sal * 1.03 * 1.05, 0)
        when job = 'manager' and eng_score < 90 then round(current_sal * 1.03, 0)
	end as increase_sal
from staff_sal;

-- 4. 위와 같이 연봉이 인상된다면 추가되는 임금비용은 얼마인가?*/
select sum(current_sal), sum(
	case
		when job = 'clerk' and eng_score >= 90 then round(current_sal * 1.07 * 1.05, 0)
        when job = 'clerk' and eng_score < 90 then round(current_sal * 1.07, 0)
		when job = 'officer' and eng_score >= 90 then round(current_sal * 1.05 * 1.05, 0)
        when job = 'officer' and eng_score < 90 then round(current_sal * 1.05, 0)
        when job = 'manager' and eng_score >= 90 then round(current_sal * 1.03 * 1.05, 0)
        when job = 'manager' and eng_score < 90 then round(current_sal * 1.03, 0)
	end) as increase_sal
from staff_sal; -- 현재 급여 합계 / 인상 급여 합계

select abs(sum(current_sal) - sum(
	case
		when job = 'clerk' and eng_score >= 90 then round(current_sal * 1.07 * 1.05, 0)
        when job = 'clerk' and eng_score < 90 then round(current_sal * 1.07, 0)
		when job = 'officer' and eng_score >= 90 then round(current_sal * 1.05 * 1.05, 0)
        when job = 'officer' and eng_score < 90 then round(current_sal * 1.05, 0)
        when job = 'manager' and eng_score >= 90 then round(current_sal * 1.03 * 1.05, 0)
        when job = 'manager' and eng_score < 90 then round(current_sal * 1.03, 0)
	end)) as 추가_비용
from staff_sal;

