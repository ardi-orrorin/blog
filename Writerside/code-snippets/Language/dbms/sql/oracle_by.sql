-- GROUP BY와 HAVING 그리고 ORDER BY 

-- ORDER BY절 : SELECT한 컬럼을 가지고 정렬을 할 때 사용한다.
-- ORDER BY 컬럼명 | 컬럼별칭 | 컬럼나열 순번 [ASC] | DESC 

-- ORDER BY 컬럼명 정렬방식, 컬럼명 정렬박식, 컬럼명 정렬방식...
--> 첫번째 기준으로 하는 컬럼에 대해 정렬하고 같은 값들에 대해서 두 번째 기준으로 하는 컬럼에 대해서 다시 정렬

-- SELECT 구문 맨 마지막에 위치한다.
-- 실행 순서도 맨 마지막에 실행된다.

/*
 * 수행순서
 * 5 > SELECT 컬럼명 AS 별칭, 계산식, 함수식
 * 1 > FROM 참조할 테이블명
 * 2 > WHERE 컬럼명 | 함수식 비교연산자 비교
 * 3 > GROUP BY 그룹을 묶을 컬럼명
 * 4 > HAVING 그룹함수식 비교연사자 비교값
 * 6 > ORDER BY 컬럼명 | 별칭 | 컬럼순번 정렬방식 [NULLS FIREST | LAST]
 * */

SELECT DEPT_CODE
 	 , COUNT(*) AS 사원수
  FROM "C##EMPLOYEE".EMPLOYEE
 GROUP BY DEPT_CODE;

SELECT DEPT_CODE
	 , JOB_CODE
	 , SUM(SALARY)
	 , COUNT(*)
  FROM "C##EMPLOYEE".EMPLOYEE
 GROUP BY DEPT_CODE
	 	, JOB_CODE;

-- 직원 테이블에서 부서 코드별 그룹을 지정하여
-- 부서코드, 그룹별 급여의 합계, 그룹별 급여의 평균(정수처리), 윈원수 조회하고
-- 부서코드순으로 오름차순 정렬하세요.
SELECT DEPT_CODE
	 , SUM(SALARY) AS 합계
	 , FLOOR(AVG(SALARY)) AS 평균
	 , COUNT(*) AS 인원수
  FROM "C##EMPLOYEE".EMPLOYEE
 GROUP BY DEPT_CODE
-- ORDER BY DEPT_CODE ASC;
-- ORDER BY DEPT_CODE NULLS FIRST ;
 ORDER BY DEPT_CODE NULLS FIRST;


-- 직원 테이블에서 직급코드, 보너스를 받는 사원 수를 조회하여
-- 직급코드 순으로 올므차순 정렬하세요.
SELECT JOB_CODE
	 , COUNT(*)
  FROM "C##EMPLOYEE".EMPLOYEE
 WHERE BONUS IS NOT NULL
 GROUP BY JOB_CODE
 ORDER BY JOB_CODE ASC;

-- 직원 테이블에서 주민번호의 8번째 자리를 조회하여 1이면 남, 2이면 여로 결과를 조회하고
-- 성별별 급여 평균(정수처리), 급여합계, 인원수를 조회한위 인원수로 내림차순

SELECT 
	DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여','사람아님') AS 성별
	, FLOOR(AVG(SALARY)) AS 평균
	, SUM(SALARY) AS 합계
	, COUNT(*) AS 인원수
FROM "C##EMPLOYEE".EMPLOYEE
GROUP BY DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여','사람아님')
-- ORDER BY 인원수 DESC;
ORDER BY 4 DESC;


-- HAVING 절 : 그룹함수로 구해올 그룹에 대해 조건을 설정할 때 사용
-- HAVING  컬럼명 | 함수식 비교연산자 비교값
SELECT DEPT_CODE
	 , FLOOR(AVG(SALARY)) AS 평균
  FROM "C##EMPLOYEE".EMPLOYEE
 WHERE  SALARY > 3000000
 GROUP BY DEPT_CODE
 ORDER BY DEPT_CODE ;

SELECT DEPT_CODE
	 , FLOOR(AVG(SALARY)) AS 평균
  FROM "C##EMPLOYEE".EMPLOYEE
--WHERE  SALARY > 3000000
 GROUP BY DEPT_CODE
HAVING FLOOR(AVG(SALARY)) > 3000000
 ORDER BY DEPT_CODE ;


-- 부서별 그룹의 급여 합계 중 9백만원을 초과하는 부서코드와 급여 합계 조회
SELECT DEPT_CODE
	 , SUM(SALARY)
  FROM "C##EMPLOYEE".EMPLOYEE
 GROUP BY DEPT_CODE
HAVING SUM(SALARY) > 9000000;

-- 급여 합계가 가장 많은 부서의 부서코드와 급여 합계를 구하세요
SELECT 
	MAX(SUM(SALARY))
FROM "C##EMPLOYEE".EMPLOYEE
GROUP BY DEPT_CODE;


SELECT DEPT_CODE
	 , SUM(SALARY)
  FROM "C##EMPLOYEE".EMPLOYEE
 GROUP BY DEPT_CODE
HAVING SUM(SALARY) = (SELECT MAX(SUM(SALARY)) -- subQuery
						FROM "C##EMPLOYEE".EMPLOYEE
					   GROUP BY DEPT_CODE
				     );


				   
-- 집계함수
-- ROLLUP 함수 : 그룹별로 중갑 집계 처리하는 함수
-- 그룹별로 묶여진 값에 대한 중간 집계와 총 집계를 구할 때 사용한다.
-- 그룹별로 계산된 결과값들에 대한 총 집계가 자동으로 추가된다.

SELECT JOB_CODE
	 , SUM(SALARY)
  FROM "C##EMPLOYEE".EMPLOYEE
 GROUP BY ROLLUP(JOB_CODE)
 ORDER BY JOB_CODE ;
				   
				   
-- CUBE 함수 : 그룹별 산출한 결과를 집계하는 함수

SELECT JOB_CODE
	 , SUM(SALARY)
  FROM "C##EMPLOYEE".EMPLOYEE
 GROUP BY CUBE(JOB_CODE)
 ORDER BY JOB_CODE ;

-- 인자로 전달한 그룹중에서 가장 먼저 지정한 그룹별 합계와 총 합계를 구하는 함수


SELECT 
	DEPT_CODE 
	,JOB_CODE 
	, SUM(SALARY)
FROM "C##EMPLOYEE".EMPLOYEE
GROUP BY ROLLUP(DEPT_CODE , JOB_CODE)
ORDER BY JOB_CODE ;


-- 그룹으로 지정된 모든 그룹에 대한 잡계와총 계를 구하는 함

SELECT 
	DEPT_CODE 
	,JOB_CODE 
	, SUM(SALARY)
FROM "C##EMPLOYEE".EMPLOYEE
GROUP BY CUBE(DEPT_CODE , JOB_CODE)
ORDER BY JOB_CODE ;


-- GROUPPING 함수 : ROLLUP 이나 CUBE에 의한 산출물이 인자로
-- 				   전달받은 컬럼의 집합 산출물이면 0반환하고,
--				   아니면 1을 반환하는 함수

SELECT 
	DEPT_CODE 
	, JOB_CODE 
	, SUM(SALARY)
	, CASE
		WHEN GROUPING(DEPT_CODE) = 0 AND GROUPING(JOB_CODE) = 1 THEN '부서별합계'
		WHEN GROUPING(DEPT_CODE) = 1 AND GROUPING(JOB_CODE) = 0 THEN '직급별합계'
		WHEN GROUPING(DEPT_CODE) = 0 AND GROUPING(JOB_CODE) = 0 THEN '그룹별합계'
		ELSE '총합계'
	END AS 구분
FROM "C##EMPLOYEE".EMPLOYEE
GROUP BY CUBE(DEPT_CODE,JOB_CODE)
ORDER BY DEPT_CODE ;


--SET OPERATION(잡합연산)
-- UINION : 여러 개의 쿼리 결과를 하나로 합치는 연산자.
--          중복된 영역을 제외하여 하나로 합친다.

SELECT 
	EMP_ID
	, EMP_NAME
	, DEPT_CODE 
	, SALARY 
FROM "C##EMPLOYEE".EMPLOYEE
WHERE DEPT_CODE  = 'D5'
UNION 
SELECT 
	EMP_ID
	, EMP_NAME
	, DEPT_CODE 
	, SALARY 
FROM "C##EMPLOYEE".EMPLOYEE
WHERE SALARY  > 3000000;



-- UINION ALL : 여러 개의 쿼리 결과를 하나로 합치는 연산자.
--              중복된 영역을 포함하여 하나로 합친다.

SELECT 
	EMP_ID
	, EMP_NAME
	, DEPT_CODE 
	, SALARY 
FROM "C##EMPLOYEE".EMPLOYEE
WHERE DEPT_CODE  = 'D5'
UNION ALL
SELECT 
	EMP_ID
	, EMP_NAME
	, DEPT_CODE 
	, SALARY 
FROM "C##EMPLOYEE".EMPLOYEE
WHERE SALARY  > 3000000;

SELECT 
	DEPT_CODE 
	, JOB_CODE 
	, SUM(SALARY)
FROM "C##EMPLOYEE".EMPLOYEE
GROUP BY ROLLUP (DEPT_CODE, JOB_CODE)
UNION 
SELECT 
	''
	, JOB_CODE 
	, SUM(SALARY)
FROM "C##EMPLOYEE".EMPLOYEE
GROUP BY ROLLUP (DEPT_CODE, JOB_CODE)

-- INTERSECT  : 여러 개의 SELECT한 결과에서 공통부분만 결과로 추출(수학에서 교집합과 비슷)

SELECT 
	EMP_ID
	, EMP_NAME
	, DEPT_CODE 
	, SALARY 
FROM "C##EMPLOYEE".EMPLOYEE
WHERE DEPT_CODE  = 'D5'
INTERSECT  
SELECT 
	EMP_ID
	, EMP_NAME
	, DEPT_CODE 
	, SALARY 
FROM "C##EMPLOYEE".EMPLOYEE
WHERE SALARY  > 3000000;

-- MINUS : 선행 SELECT결과에서 당므 SELECT 결가오ㅘ 겹치는 부분을 제외한 나머지 부분만 추출(수학에서 차집합과 비슷)

SELECT 
	EMP_ID
	, EMP_NAME
	, DEPT_CODE 
	, SALARY 
FROM "C##EMPLOYEE".EMPLOYEE
WHERE DEPT_CODE  = 'D5'
MINUS 
SELECT 
	EMP_ID
	, EMP_NAME
	, DEPT_CODE 
	, SALARY 
FROM "C##EMPLOYEE".EMPLOYEE
WHERE SALARY  > 3000000;








