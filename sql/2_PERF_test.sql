create database quiz;
use quiz;

CREATE TABLE PERF
(
	CUST_ID CHAR(5) PRIMARY KEY NOT NULL,
	CUST_NM CHAR(10) NOT NULL,
	CUST_BIRTH DATE,
	VISIT_CNT DECIMAL(15,0), -- 방문 횟수
	SALES_AMT DECIMAL(15,0), -- 총 구매금액
	SALES_CNT DECIMAL(15,0) -- 구입 상품 수
);

INSERT INTO PERF VALUES ('56456', '모형건', '1982-01-24', 123, 3700000, 24);
INSERT INTO PERF VALUES ('65412', '이상훈', '1984-05-10', 23, 467200, 14);
INSERT INTO PERF VALUES ('23472', '이상희', '1978-02-27', 117, 2237065, 23);
INSERT INTO PERF VALUES ('27896', '모영길', '1982-05-11', 37, 123721, 2);
INSERT INTO PERF VALUES ('35478', '강주혁', '1983-09-10', 86, 830000, 30);
INSERT INTO PERF VALUES ('78693', '이선우', '1977-07-07', 103, 1789023, 7);


-- 1. 고객 구매금액을 기준으로 내림차순으로 정렬해서 이름, 아이디, 생년월일, 총구매금액을 출력하시오
select cust_nm, cust_id, cust_birth, sales_amt
from perf
order by sales_amt desc;

-- 2. 고객 연령과 방문횟수를 비교하시오
select cust_birth, visit_cnt from perf;

-- 3. 방문횟수가 가장 많은 고객의 이름을 출력하시오
select cust_nm
from perf
order by visit_cnt desc limit 1;

-- 4. 1980년 이전 출생한 고객을 출력하시오.
select cust_nm
from perf
where cust_birth < '1980';

-- 5. 평균 방문횟수, 평균구입금액, 평균 구입상품 수를 구하시오
select avg(visit_cnt), avg(sales_amt), avg(sales_cnt)
from perf;

-- 6. 방문 당 구매금액이 가장 큰 고객의 이름을 구하시오
select cust_nm, round(sales_amt/visit_cnt, 2) as '방문 당 구매금액'
from perf
order by sales_amt/visit_cnt desc limit 1;



