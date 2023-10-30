--그룹함수와 단일행함수
-- 함수(FUNCTION) : 컬럼 값을 읽어서 계산한 결과를 리턴한다.
-- 단일행(SINGLE ROW) 함수 : 컬럼에 기록된 N개의 값을 읽어서 N개의 결과를 리턴 
-- 그룹(GROUP)함수 : 컬럼에 기록된 N개의 값을 읽어서 한 개의 결과 리턴 

-- SELECT 절에 단일행 함수와 그룹함수를 함께 사용 못한다.
-- : 결과 행의 갯수가 다르기 때문이다.

-- 함수를 사용할 수 있는 위치 : SELECT, WHERE, GROUP BY, HAVING , ORDER BY

-- 구릅함수 : SUM, AVG, MAX, MIN, COUNT


-- SUM(숫자가 기록된 컬럼명) : 합계를 구하여 리턴
SELECT SUM(SALARY)
  FROM "C##EMPLOYEE".EMPLOYEE;


-- AVG(숫자가 기록된 컬럼명) : 평균을 구하여 리턴
SELECT AVG(SALARY)
  FROM "C##EMPLOYEE".EMPLOYEE;

-- 기본 평균, 중복제거 평균, NULL포함 평균
SELECT AVG(BONUS) AS 기본평균
	 , AVG(NVL(BONUS,0)) AS NULL포함평균
	 ,AVG(DISTINCT (BONUS)) AS 중복제거평균
  FROM "C##EMPLOYEE".EMPLOYEE;


-- MIN(컬럼명) : 컬럼에서 가장 작은 값 리턴
-- 취급하는 자료형은 ANY TYPE 이다.
SELECT MIN(EMAIL)
	 , MIN(HIRE_DATE)
	 , MIN(SALARY)
  FROM "C##EMPLOYEE".EMPLOYEE;

-- MAX(컬럼명) : 컬럼에서 가장 큰 값 리턴
-- 취급하는 자료형은 ANY TYPE 이다.
SELECT MAX(EMAIL)
	 , MAX(HIRE_DATE)
	 , MAX(SALARY)
  FROM "C##EMPLOYEE".EMPLOYEE;

-- COUNT (* | 컬럼) : 행의 갯수를 헤아려서 리턴
-- COUNT ([DISTINCT] 컬럼명) : 중복을 제거한 행 갯수 리턴
-- COUNT (*) : NULL을 포함한 전체 행 갯수 리턴
-- COUNT (컬럼명) : NULL를 제외한 실제 값이 기록된 행 갯 수 리턴
SELECT COUNT(*)
	 , COUNT(DEPT_CODE)
	 , COUNT(DISTINCT DEPT_CODE)
  FROM "C##EMPLOYEE".EMPLOYEE;


-- 단일행 함수
-- 문자 관련 함수
-- : LENGTH, LENGTHB, SUBSTR, UPPER, LOWER, INSTR ....
SELECT LENGTH('오라클')
	 , LENGTHB('오라클')
  FROM DUAL ;

SELECT LENGTH(EMAIL)
	 , LENGTHB (EMAIL)
  FROM "C##EMPLOYEE".EMPLOYEE;

--INSTR('문자열' | '컬럼명' | '문자', 찾을 위치의 시작값, [빈도])
SELECT EMAIL
	 , INSTR(EMAIL,'@',1) 위치
  FROM "C##EMPLOYEE".EMPLOYEE;

SELECT INSTR('AABAACAABBAA','B') FROM DUAL ;
SELECT INSTR('AABAACAABBAA','B',1) FROM DUAL ;
SELECT INSTR('AABAACAABBAA','B',-1) FROM DUAL ;
SELECT INSTR('AABAACAABBAA','B',-1,2) FROM DUAL ;
SELECT INSTR('AABAACAABBAA','B',1,2) FROM DUAL ;

-- LPAD / RPAD : 주어진 컬럼 문자열에 임의의 문자열을 덧붙여 길이 N의 문자열을 반환하는 함수
SELECT LPAD(EMAIL, 20, '#')
  FROM "C##EMPLOYEE".EMPLOYEE;

SELECT RPAD(LPAD(EMAIL,10), 20, '#')
  FROM "C##EMPLOYEE".EMPLOYEE;

SELECT LPAD(EMAIL, 10)
  FROM "C##EMPLOYEE".EMPLOYEE;

SELECT RPAD(EMAIL, 10)
  FROM "C##EMPLOYEE".EMPLOYEE;

--LTRIM / RTRIM : 주어진 컬럼이나 문자열 왼쪽 / 오른쪽에서 지정한 문자 혹은 문자열을 제거한 나머지를 반환하는 함수
SELECT LTRIM('    GREEDY')  FROM DUAL;
SELECT LTRIM('    GREEDY', ' ')  FROM DUAL;
SELECT LTRIM('000123456', '0')  FROM DUAL;
SELECT LTRIM('123123GREEDY', '123')  FROM DUAL;
SELECT LTRIM('123123GREEDY123', '123')  FROM DUAL;
SELECT LTRIM('ACABACCGREEDY', 'ABC')  FROM DUAL;
SELECT LTRIM('5289GREEDY', '0123456789')  FROM DUAL;

SELECT RTRIM('GREEDY     ') FROM  DUAL;
SELECT RTRIM('GREEDY     ',' ') FROM  DUAL;
SELECT RTRIM('1234500000','0') FROM  DUAL;
SELECT RTRIM('GREEDY123123','123') FROM  DUAL;
SELECT RTRIM('GREEDYBACBACACB','ABC') FROM  DUAL;
SELECT RTRIM('GREEDY5289','0123456789') FROM  DUAL;

SELECT  TRIM('    GREEDY    ') FROM DUAL;
SELECT  TRIM('Z' FROM 'ZZZGREEDYZZZ') FROM DUAL;
SELECT  TRIM(LEADING 'Z' FROM 'ZZZGREEDYZZZ') FROM DUAL ;
SELECT  TRIM(TRAILING  'Z' FROM 'ZZZGREEDYZZZ') FROM DUAL ;
SELECT  TRIM(BOTH  'Z' FROM 'ZZZGREEDYZZZ') FROM DUAL ;


--SUBSTR : 컬럼이나 문자열에서 지정한 위치로부터 지정한 갯수의 문자열을 잘라서 리턴하는 함수
SELECT  SUBSTR('SHOWMETHEMONEY',5,2) FROM DUAL ;
SELECT  SUBSTR('SHOWMETHEMONEY',7) FROM DUAL ;
SELECT  SUBSTR('SHOWMETHEMONEY',-8,3) FROM DUAL ;
SELECT  SUBSTR('쇼우 미 더 머니', 2,5) FROM dual;

SELECT EMP_NAME
	 , SUBSTR(EMP_NO,8,1)
  FROM "C##EMPLOYEE".EMPLOYEE;

--EMPLOYEE  테이블에서 직원들의 주민번호를 조회하여
-- 사원명, 생년, 생월 ,생일을 각각 분리하여 조회
-- 단, 컬럼의 별칭은 사원명, 생년, 생월, 생일로 한다.
SELECT EMP_NAME AS 사원명
	 , SUBSTR(EMP_NO, 1,2) AS 생년
	 , SUBSTR(EMP_NO, 3,2) AS 생월
	 , SUBSTR(EMP_NO, 5,2) AS 생일
  FROM "C##EMPLOYEE".EMPLOYEE;
                                                                                                                                                                                                                                                                                                                                                                                                      	

-- 날짜 데이터에서 사용할 수 있다,
-- 직원들의 입사년도, 입사월, 입사날짜를 분리 조
SELECT EMP_NAME AS 사원명
	 , HIRE_DATE
	 , SUBSTR(HIRE_DATE, 1,2) AS 입사년도
	 , SUBSTR(HIRE_DATE, 4,2) AS 입사월
	 , SUBSTR(HIRE_DATE, 7,2) AS 입사날짜
  FROM "C##EMPLOYEE".EMPLOYEE;

-- WHERE 절에서 함수 사용도 가능함
-- 여직원들의 모든 컬럼 정보를 조회

SELECT *
  FROM "C##EMPLOYEE".EMPLOYEE
 WHERE SUBSTR(EMP_NO,8,1) IN  ('2','4');

-- WHERE 절에는 단일행 함수만 사용하다.
SELECT *
  FROM "C##EMPLOYEE".EMPLOYEE
 WHERE SALARY  > AVG(SALARY); -- 그룹함수 사용하면 에러

-- 함수 중첩 사용가능 : 함수안에서 함수를 사용할 수 있다.
-- EMPLOYEE 테이블에서 사원명, 주민번호 조회
-- 단, 주민번호는 생년월일만 보이게하고, '-' 다음의 값은 '*'로 바꿔서 출력

SELECT
	EMP_NAME AS 사원명
	, RPAD(SUBSTR(EMP_NO,1,7),14,'*') AS 주민번호
FROM "C##EMPLOYEE".EMPLOYEE;


-- EMPLOYEE 테이블에서 사원명, 이메일, @이후를 제외한 아이디 조회
SELECT 
	EMP_NAME 
	, EMAIL 
	, SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1) AS ID
FROM "C##EMPLOYEE".EMPLOYEE;

-- SUBSTRB : 바이트 단위로 추출하는 함수
SELECT SUBSTR('ORACLE',3,2)
	  ,SUBSTRB('ORACLE',3,2)
  FROM DUAL;

SELECT 
	SUBSTR('오라클',2,2)
	,SUBSTRB('오라클',4,6)
FROM DUAL;

-- LOWER / UPPER / INITCAP : 대소문자 변경해 주는 함수

-- LOWER(문자열 | 컬럼) : 소문자로 변경해주는 함수
SELECT LOWER('Welcome To My World')
  FROM dual;

-- UPPER(문자열 | 컬럼) : 문자로 변경해주는 함수
SELECT UPPER('Welcome To My World')
  FROM dual;

-- INITCAP : 앞글자만 대문자로 변경해주는 함
SELECT INITCAP('welcome to my world')
  FROM dual;

-- CONCAT : 문자열 혹은 컬럼 두개를 입력 받아서 하나로 합친 후 리턴
SELECT CONCAT('가나다라','ABCD')
	 , '가나다라' || 'ABCD'
  FROM dual ;


-- REPLACE : 컬럼 혹은 문자열을 입력받아 변경하고자 하는 문자열을 변경하려고 하는 문자열로 바꾼 후 리턴
SELECT REPLACE('서울시 강남구 역삼동','역삼동','삼성동')
  FROM dual ;

-- 숫자처리 함수 : ABS, MOD, ROUND, FLOOR, TRUNC, CELL
--ABS(숫자 | 숫자로된 컬럼명) : 절대값 구하는 함수
SELECT ABS(-10)
	 , ABS(10)
  FROM dual;


-- MOD(숫자 | 숫자로된 컬럼명, 숫자 | 숫자로된 컬럼명)
-- 두 수를 나누어서 나머지를 구하는 함수
-- 처음 인자는 나누어지는 수, 두번째 인자는 나눌 수
SELECT MOD(10,5)
     , MOD(10,3)
  FROM dual;

-- ROUND(숫자 | 숫자로된 컬러명, [위치])
-- 반올림해서 리턴하는 함수
SELECT ROUND(123.456) FROM dual ; 
SELECT ROUND(123.456,0) FROM dual ; 
SELECT ROUND(123.456,1) FROM dual ; 
SELECT ROUND(123.456,2) FROM dual ; 
SELECT ROUND(123.456,-1) FROM dual ; 

-- FLOOR(숫자 | 숫자로된 컬럼명) : 내림처리하는 함수
SELECT  FLOOR(123.456) FROM  DUAL ;
SELECT  FLOOR(123.654) FROM  DUAL ;

--TRUNC (숫자 | 숙자로된 컬럼명, [위치]) : 내림처리(절삭) 함수
SELECT TRUNC(123.456) FROM DUAL ;
SELECT TRUNC(123.654) FROM DUAL ;
SELECT TRUNC(123.456) FROM DUAL ;
SELECT TRUNC(123.456,-1) FROM DUAL ;


-- CEIL(수샂 | 숫자로된 컬럼명) : 올림처리 함수
SELECT CEIL(123.456) FROM dual ;
SELECT CEIL(123.656) FROM dual ;

SELECT 
	ROUND(123.456) AS 반올림
	, FLOOR(123.456) AS 내림처리
	, TRUNC(123.456) AS "내림처리(절삭)"
	, CEIL (123.456) AS 올림
FROM dual;


-- 날짜 처리 함수 : SYSDATE, MONTH_BETWEEN, ADD_MONTHS, NEXT_DAY, LAST_DAY, EXTRACT
-- SYSDATE : 시스템에 저장되어 있는 날짜를 반환하는 함수

SELECT SYSDATE FROM DUAL ;

-- MONTH_BETWEEN (날짜, 날짜)
-- 두 날짜의 개월 수 차이를 숫자로 리턴하는 함수

SELECT EMP_NAME
	 , HIRE_DATE
	 , CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))
  FROM "C##EMPLOYEE".EMPLOYEE ;


-- ADD_MONTHS(날짜, 숫자)
-- 날짜에 숫자만큼 개월 수 더해서 리턴
SELECT ADD_MONTHS(SYSDATE,5) FROM DUAL ;


-- EMPLOYEEM 테이블에서 사원의 이름, 입사일, 입사후 6개월이 되는 날짜 조회
SELECT EMP_NAME
 	 , HIRE_DATE 
 	 , ADD_MONTHS(HIRE_DATE, 6)
  FROM "C##EMPLOYEE".EMPLOYEE;

--EMPLOYEE 테이블에서 근무 년수가 20년이상인 직원 조회
 SELECT *
   FROM "C##EMPLOYEE".EMPLOYEE
--WHERE MONTHS_BETWEEN(SYSDATE,HIRE_DATE)>= 240;
  WHERE ADD_MONTHS(HIRE_DATE,240) <= SYSDATE ;

-- NEXT_DAY(기준날짜, 요일(문자 | 숫자)
-- 기준 날짜에서 구하려는 요일에 가장 가까운 날짜 리턴

SELECT SYSDATE, NEXT_DAY(SYSDATE,'토요일') FROM dual;

-- 일월화수목금토
SELECT SYSDATE, NEXT_DAY(SYSDATE, 7) FROM dual;
SELECT SYSDATE, NEXT_DAY(SYSDATE,'토') FROM dual;
SELECT SYSDATE, NEXT_DAY(SYSDATE,'FRIDAY') FROM dual;

-- ALTER SESSION SET nls_language = korean;

-- LAST_DAY(날짜) : 해당 월의 마지막 날짜를 구하여 리턴
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM dual ;

--EXTRACT : 년, 월, 일 정보를 추출하여 리턴하는 함수
-- EXTRACT (YEAR FROM 날짜) : 년도만 추출
-- EXTRACT  ( MONTH FROM 날짜) : 월만 추출
-- EXTRACT  ( DAY FROM 날짜) : 날짜만 추출

SELECT EXTRACT(YEAR FROM SYSDATE) AS 년도
	 , EXTRACT(MONTH FROM SYSDATE) AS 월
	 , EXTRACT(DAY FROM SYSDATE) AS 일
  FROM DUAL ;

-- EMPLOYEE 테이블에서 사원이름, 입사년, 입사월, 입사일 조회
SELECT 
	EMP_NAME 사원이름
	, EXTRACT (YEAR FROM HIRE_DATE) 입사년
	, EXTRACT (MONTH  FROM HIRE_DATE) 입사월
	, EXTRACT (DAY FROM HIRE_DATE) 입사일
FROM "C##EMPLOYEE".EMPLOYEE;
	
-- EMPLOYEE 테이블에서 직원의 이름, 입사일, 근무년수를 조회
-- 단, 근무년수는 현재년도 - 입사년도로 조회
SELECT 
	EMP_NAME 
	, HIRE_DATE 
	, EXTRACT (YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE )
FROM "C##EMPLOYEE".EMPLOYEE;


-- 형변환 함수
-- TO_CHAR(날짜, [포멧]) : 날짜형 데이터를 문자형 데이터로 변경
-- TO_CHAR(숫자, [포멧]) : 숫자형 데이터를 문자형 데이터로 변경

SELECT TO_CHAR(1234) FROM DUAL;             -- 1234
SELECT TO_CHAR(1234,'9999999') FROM DUAL;   -- 1234
SELECT TO_CHAR(1234,'0000000') FROM DUAL;   -- 0001234
SELECT TO_CHAR(1234,'L999999') FROM DUAL;   --   ₩1234
SELECT TO_CHAR(1234,'$999,999') FROM DUAL;  --  $1,234
SELECT TO_CHAR(1234,'000,000') FROM DUAL;   -- 001,234
SELECT TO_CHAR(1234,'999') FROM DUAL;       -- ###

SELECT 
	EMP_NAME 
	, TO_CHAR(SALARY, 'L99,999,999')
FROM "C##EMPLOYEE".EMPLOYEE;


-- 날짜 데이터 포멧 적용시에도 TO_CHAR 함수 사용
SELECT TO_CHAR(SYSDATE, '') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'PM HH24:MI:SS') FROM DUAL;     -- 오전 07:58:41
SELECT TO_CHAR(SYSDATE, 'AM HH24:MI:SS') FROM DUAL;     -- 오전 07:58:41
SELECT TO_CHAR(SYSDATE, 'MON DY, YYYY') FROM DUAL;      -- 10월 월, 2023
SELECT TO_CHAR(SYSDATE, 'YYYY-fmMM-DD DAY') FROM DUAL;  -- 2023-10-30 월요일
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY') FROM DUAL;    -- 2023-10-30 월요일
SELECT TO_CHAR(SYSDATE, 'YEAR, Q') FROM DUAL;           -- TWENTY TWENTY-THREE, 4

SELECT 
	EMP_NAME 
	, TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') AS 입사월
FROM "C##EMPLOYEE".EMPLOYEE;

SELECT 
	EMP_NAME 
	, TO_CHAR(HIRE_DATE, 'YYYY/MM/DD/ HH24:MI:SS') AS 입사월
FROM "C##EMPLOYEE".EMPLOYEE;

-- 오늘날짜에 대해 년도 4자리, 년도 2자리
SELECT 
	TO_CHAR(SYSDATE, 'YYYY')
	,TO_CHAR(SYSDATE, 'RRRR')
	,TO_CHAR(SYSDATE, 'YY')
	,TO_CHAR(SYSDATE, 'RR')
FROM dual;

-- RR과 YY의 차이
-- RR은 두자리 년도를 네자리로 바꿀때
-- 바꿀 년도가 50년미만 2000년 적용
-- 50년 이상이면 1900년 적용

-- 년도를 바꿀 때(TO_DATE 사용시) Y를 적용하면
-- 현재 세기(2000년) 가 적용된다.

-- R은 50년 이상이면 이전 세기 (1900년)
-- 50년 미만이면 현재세기(2000년) 적용

SELECT TO_CHAR(TO_DATE('980623','YYMMDD'),'YYYY-MM-DD')
  FROM DUAL; -- 2098-06-23

SELECT TO_CHAR(TO_DATE('980623','RRMMDD'),'YYYY-MM-DD')
  FROM DUAL; -- 1998-06-23

-- 오늘 날짜에서 월만 출력
SELECT 
	TO_CHAR(SYSDATE, 'MM')
	, TO_CHAR(SYSDATE, 'MONTH')
	, TO_CHAR(SYSDATE, 'MON')
	, TO_CHAR(SYSDATE, 'RM')
FROM dual;

SELECT 
	TO_CHAR(SYSDATE, '"1년 기준" DDD "일 째"') 
	, TO_CHAR(SYSDATE, '"달 기준" DD "일 째"') 
	, TO_CHAR(SYSDATE, '"주 기준" D "일 째"')
FROM dual;

-- 직원 테이블에서 이름, 입사일 조회
-- 입사일에 포멧 적용함
-- '2023년 4월 21일 (금)' 형식으로 출력 처리 하세요

SELECT 
	EMP_NAME 
	, TO_CHAR(HIRE_DATE, 'RRRR"년" fmMM"월" DD"일" "("DY")"') AS 입사일
FROM "C##EMPLOYEE".EMPLOYEE;

-- TO_DATE  : 문자 혹은 숫자형 데이터를 날짜형 데이터로 변환하여 리턴
-- TO_DATE(문자형데이터, [포맷])
-- 문자형 데이터를 날짜로 변경한다.

-- TO_DATE(숫자, [포맷])

SELECT 
	TO_DATE('20200101','RRRRMMDD')
FROM DUAL;

SELECT 
	TO_CHAR(TO_DATE('20200101','RRRRMMDD'),'RRRR, MON') 	
FROM DUAL;

SELECT
	TO_DATE('041030 143000', 'RRMMDD HH24MISS')
	FROM DUAL;

SELECT
	TO_CHAR(TO_DATE('041030 143000', 'RRMMDD HH24MISS'),'DD-MON-RR HH:MI:SS PM') 
	FROM DUAL;


-- 직원 테이블에서 2000년도 이후에 입사한 사원의 사번, 이름, 입사일을 조회하세요.
SELECT 
	EMP_ID
	, EMP_NAME 
	, HIRE_DATE 
	FROM "C##EMPLOYEE".EMPLOYEE
-- WHERE  HIRE_DATE > '20000101'; --자동형변환된다(문자열은 날짜로 자동 형변환 된다.)
-- WHERE  HIRE_DATE  > 20000101; -- 자동형 변횐 안된다(숫자는 날짜로 자동 형변환 안됨)
WHERE HIRE_DATE < TO_DATE(20000101,'RRRRMMDDD'); 

-- TO_NUMBER(문자데이터,[포맷]) : 문자데이터를 숫자로 리턴
SELECT TO_NUMBER('123456789') FROM DUAL;

-- 자동형변환
SELECT '123'+'456' FROM dual;

-- 숫자로된 문자열만 자동형변환
SELECT '123'+'456A' FROM dual;

SELECT 
	EMP_NAME
	, HIRE_DATE 
	FROM  "C##EMPLOYEE".EMPLOYEE
	WHERE HIRE_DATE = '90/02/06';

-- EMPLOYEE 테이블에서 사번이 홀수인 직원들의 정보를 조회
SELECT
	*
FROM "C##EMPLOYEE".EMPLOYEE 
--WHERE  MOD(EMP_ID,2) =1; --자동형변환
WHERE  MOD(TO_NUMBER(EMP_ID),2) = 1;


SELECT
	'1,000,000' + '5,000,0000'
FROM DUAL ;

SELECT
	TO_NUMBER('1,000,000','99,999,999') + TO_NUMBER('5,000,000','99,999,999')
FROM DUAL ;


-- 직원 테이블에서 사원번호가 201인 사원의 이름, 주민번호 앞자리, 주민번호 뒷자리,
-- 주민번호 앞자리와 뒷자리를 합을 조회하세요.
-- 단, 자동형볌환 사용하지 않고 조회

SELECT 
	EMP_NAME 
	, EMP_NO 
	, SUBSTR(EMP_NO, 1,6) AS 앞부분
	,SUBSTR(EMP_NO, 8) AS 뒷부분
	, TO_NUMBER(SUBSTR(EMP_NO, 1,6)) + TO_NUMBER(SUBSTR(EMP_NO, 8)) AS 결과
FROM "C##EMPLOYEE".EMPLOYEE
WHERE EMP_ID = TO_CHAR(201);

-- NULL처리 함수
-- NVL(컬럼명, 컬럼값이 NULL일때 바꿀값)

SELECT EMP_NAME
	 , BONUS
	 , NVL(BONUS,0)
  FROM "C##EMPLOYEE".EMPLOYEE;


-- NVL2(컬럼명, 바꿀값1, 바꿀값2)
-- 해당 컬럼이 값이 있으면 바꿀값1로 변경,
-- 해당 컬럼이 NULL이면 바꿀값2로 변경

-- 직원정보에서 보너스포인트가 NULL인 직원은 0.5로
-- 보너스 포인트가 NULL이 아닌 경우 0.7로 변경하여 조회
SELECT EMP_NAME
	 , BONUS
	 , NVL2(BONUS,0.7,0.5)
  FROM "C##EMPLOYEE".EMPLOYEE;

-- 선택함수
-- 여러 가지 경우에 선택할 수 있는 기능을 제공한다.
-- DECODE(계산식 | 컬림명, 조건값1, 선택값1, 조건값2, 선택값2,,,,)

SELECT EMP_ID
	 , EMP_NAME
	 , EMP_NO
	 , DECODE(SUBSTR(EMP_NO ,8,1),'1','남','2','여','사람아님') AS 성별
  FROM "C##EMPLOYEE".EMPLOYEE;


-- 마지막 인자로 조건값 없이 선택값을 작성하면
-- 아무것도 해당하지 않을 때는 마지막에 작성한 선택값을 무조건 선택한다.

SELECT 
	EMP_ID 
	, EMP_NAME 
	, EMP_NO
	, DECODE(SUBSTR(EMP_NO ,8,1),'1','남','여') AS 성별  
FROM "C##EMPLOYEE".EMPLOYEE;

-- 직원의 급여를 인상하고자 한다.
-- 직급코드가 j7인 직원은 급여의 10%를 인상하고,
-- 직급코드가 j6인 직원은 급여의 15%를 인상하고,
-- 직급코드가 j5인 직원은 급여의 20%를 인상하고,
-- 그 외 직급의 직원은 5%만 인상한다.
SELECT EMP_NAME
	 , JOB_CODE
	 , SALARY
	 , DECODE(JOB_CODE,'J7',SALARY * 1.1
	 				  ,'J6',SALARY * 1.15
 					  ,'J5',SALARY * 1.2
					  ,SALARY * 1.05
             ) AS 인상급여
  FROM "C##EMPLOYEE".EMPLOYEE;


-- CASE
--   WHEN 조건식 THEN 결과값
--   WHEN 조건식 THEN 결과값 
--   ELSE 결과
-- END

SELECT EMP_NAME
	 , JOB_CODE
	 , SALARY
	 , CASE
	 	 WHEN JOB_CODE = 'J7' THEN SALARY * 1.1
		 WHEN JOB_CODE = 'J6' THEN SALARY * 1.15
		 WHEN JOB_CODE = 'J5' THEN SALARY * 1.20
		 ELSE SALARY * 1.05
	   END AS 인상급여
  FROM "C##EMPLOYEE".EMPLOYEE;


-- 사버, 사원명, 급여를 EMPLOYEE 테이블에서 조회하고,
-- 급여가 500만원 초과이면 '고급'
-- 급여가 300~500만원이면 '중급'
-- 그 이하는 '초급'으로 출력하고 별칭은 '구분'으로 한다.

SELECT
	EMP_ID 
	,EMP_NAME 
	, SALARY 
	,CASE 
		WHEN SALARY > 5000000 THEN '고급'
		WHEN SALARY >= 3000000 THEN '중급'
		ELSE '초급'
	END AS 구분
FROM "C##EMPLOYEE".EMPLOYEE;
	

-- *******************************************************************
-- 함수 연습 문제 
--1. 직원명과 주민번호를 조회함
--  단, 주민번호 9번째 자리부터 끝까지는 '*'문자로 채운다.
--  예 : 홍길동 771120-1******
SELECT 
	EMP_NAME 
	, RPAD(SUBSTR(EMP_NO,1,8),14,'*')
FROM EMPLOYEE;

--2. 직원명, 직급코드, 연봉(원) 조회
--  단, 연봉은 ￦57,000,000 으로 표시되게 함
--     연봉은 보너스포인트가 적용된 1년치 급여이다

SELECT 
	EMP_NAME 직원명 
	, JOB_CODE 직급코드
	, TO_CHAR(TO_NUMBER(SALARY *12 * (NVL(BONUS,0)+1)),'L999,999,999') "연봉(원)"
FROM EMPLOYEE; 

--3. 부서코드가 D5, D9인 직원들 중에서 2004년도에 입사한 직원의 직원수를 조회
SELECT 
	COUNT(*) 
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5','D9') AND TO_CHAR(HIRE_DATE,'yyyy') = '2004';  I

--4. 직원명, 입사일, 입사한 달의 근무일수 조회
--  단, 주말도 포함함

SELECT 
       EMP_NAME 직원
     , HIRE_DATE 입사일
     , TO_CHAR(TO_NUMBER(SYSDATE - HIRE_DATE),'999,999,999') 근무일
  FROM EMPLOYEE; 

--5. 직원명, 부서코드, 생년월일, 나이(만) 조회
--  단, 생년월일은 주민번호에서 추출해서, 
--     ㅇㅇ년 ㅇㅇ월 ㅇㅇ일로 출력되게 함.
--  나이는 주민번호에서 추출해서 날짜데이터로 변환한 다음, 계산함
 
SELECT
       EMP_NAME 
     , DEPT_CODE 
     , CONCAT(SUBSTR(EMP_NO,1,2),'년',SUBSTR(EMP_NO,3,2),'월',SUBSTR(EMP_NO,5,2),'일') as 생년월일
     --, 나이(만)
  FROM EMPLOYEE;

--6. 직원들의 입사일로 부터 년도만 가지고, 각 년도별 입사인원수를 구하시오.
--  아래의 년도에 입사한 인원수를 조회하시오.
--  => to_char, decode, COUNT 사용
--
--	-------------------------------------------------------------
--	전체직원수   2001년   2002년   2003년   2004년
--	-------------------------------------------------------------

 
-- pass
SELECT
       TO_DATE(HIRE_DATE,) 
--	 , DECODE(TO_CHAR(HIRE_DATE,'RRRR'),'2001',COUNT(*))
	 , COUNT(*) as 전체직원수
  FROM EMPLOYEE
 GROUP BY HIRE_DATE; 
 

--7.  부서코드가 D5이면 총무부, D6이면 기획부, D9이면 영업부로 처리하시오.
--   단, 부서코드가 D5, D6, D9 인 직원의 정보만 조회함
--  => case 사용

SELECT
       EMP_ID
     , EMP_NAME  
     , CASE
     	WHEN DEPT_CODE ='D5' THEN '총무부'
     	WHEN DEPT_CODE ='D6' THEN '기획부'
     	WHEN DEPT_CODE ='D9' THEN '영업부'
       END AS 부서
  FROM EMPLOYEE
 WHERE DEPT_CODE IN ('D5','D6','D9');





















