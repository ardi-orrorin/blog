-- SELECT 기본 문법 및 연산자

-- 모든 행 모든 컬럼 조회
-- EMPLOYEE 테이블에서 모든 정보 조회
SELECT *
  FROM "C##EMPLOYEE".EMPLOYEE;
  
-- 원하는 컬럼 조회
-- EMPLOYEE 테이블의 사번, 이름 조회
SELECT EMP_ID,
       EMP_NAME
  FROM "C##EMPLOYEE".EMPLOYEE;

-- 원하는 행 조회
-- EMPLOYEE 테이블에서 부서코드가 D9인 사원 조회
SELECT *
  FROM "C##EMPLOYEE".EMPLOYEE
 WHERE DEPT_CODE  = 'D9';

-- EMPLOYEE 테이블에서 직급코드가 J1인 사원 조회
SELECT *
  FROM "C##EMPLOYEE".EMPLOYEE
 WHERE JOB_CODE  = 'J1';

-- 원하는 행과 컬럼 조회
-- EMPLOYEE  테이블에서 급여가 300만원 이상인 사원의 사번(EMP_ID), 이름(EMP_NAME), 부서코드(DEPT_CODE), 급여(SALARY)를 조회하세요
SELECT EMP_ID
	 , EMP_NAME
  	 , DEPT_CODE
	 , SALARY
  FROM "C##EMPLOYEE".EMPLOYEE
 WHERE SALARY >= 3000000;


-- 컬럼에 별칭 짓기
-- AS 별칭
SELECT 
	   emp_name AS 이름
	 , SALARY * 12 "1년급여"
	 , (SALARY + (SALARY * NVL(BONUS, 0))) * 12 "총소득(원)"
  FROM "C##EMPLOYEE".EMPLOYEE;
 
 
-- 임이르ㅗ 지정한 무자영을 SELECT 절에서 사용할 수 있다.

SELECT
	   emp_id
 	 , EMP_NAME 
 	 , SALARY 
	 , '원' AS 단위
  FROM "C##EMPLOYEE".EMPLOYEE ;

SELECT
	 DISTINCT DEPT_CODE  -- 중복 제거
FROM "C##EMPLOYEE".EMPLOYEE ;

-- DISTINCT 키워드는 SELECT 절에서 딱 한 번마 사용이 가능하다
-- DISTINCT 키워드는 첫줄에 와야한다.
-- , 를 이용하면 여러개의 컬럼을 묶어서 중복을 제외시킨다.
SELECT DISTINCT JOB_CODE
	 , DEPT_CODE
  FROM "C##EMPLOYEE".EMPLOYEE;


-- WHERE 절
-- 테이블에서 조건을 만족하는 값을 가진 행을 골라낸다.
-- 여러개의 조건을 만족하는 행을 골라 낼 때 AND 혹은 OR를 사용할 수 있다.

-- 부서코드가 D6이고 급여를 200만원보다 많이 받는 직원의 이름, 부서코드 ,급여 조회
SELECT 
	EMP_NAME 
	, DEPT_CODE 
	, SALARY 
 FROM "C##EMPLOYEE".EMPLOYEE
WHERE DEPT_CODE = 'D6'
  AND SALARY >=2000000;
 
 
-- NULL값 조회
-- 보너스를 지급받지 않는 사원의 사번, 이름, 급여, 보너스를 조회하세요.
SELECT
	EMP_ID 
	, EMP_NAME
	, SALARY 
	, BONUS 
FROM "C##EMPLOYEE".EMPLOYEE
WHERE BONUS IS NULL;

-- NULL 아닌 값 조회
-- 보너스를 지급받는 사원의 사번, 이름, 급여, 보너스를 조회하세요.
SELECT
	EMP_ID 
	, EMP_NAME
	, SALARY 
	, BONUS 
FROM "C##EMPLOYEE".EMPLOYEE
WHERE BONUS IS NOT NULL;

-- || : 연결 연산자를 이용하여 여러 컬럼을 하나의 컬럼인 것처럼 연결할 수 있다.

-- 컬럼과 컬럼 연결 
SELECT emp_id || emp_name || SALARY 
FROM "C##EMPLOYEE".EMPLOYEE ;

-- 컬럼과 리터럴 연결
SELECT  emp_name  || '의 월급은 ' || salary || '원 입니다.'
FROM  "C##EMPLOYEE".EMPLOYEE;

-- 비교 연산자
/*
 *  = : 같다
 *  > : 초과
 *  < : 미만
 *  >= : 이상
 *  <= : 이하
 *  != , ^= , <> : 같지 않다.   
 */

 SELECT EMP_ID
 	  , EMP_NAME
 	  , EMP_NAME
 	  , DEPT_CODE
   FROM "C##EMPLOYEE".EMPLOYEE
 --WHERE DEPT_CODE  != 'D9';
 --WHERE DEPT_CODE  ^= 'D9';
  WHERE DEPT_CODE <> 'D9';
 

-- EMPLOYEE 테이블에서 퇴사여부가 N인 직원을 조회하고
-- 근무여부를 별칭을 화여 재직중이라는 문자영을 결과집합에 포함하여 조회
-- 사번, 이름, 입사일, 근무여부 조회하세요.
SELECT EMP_ID
 	 , EMP_NAME
	 , HIRE_DATE
	 , '재직중' AS 근무여부
  FROM "C##EMPLOYEE".EMPLOYEE
 WHERE ENT_YN = 'N';

-- EMPLOYEE  테이블에서 급여를 350만원 이상
-- 550만원 이하를 받는 직원의 사번, 이름, 급여, 부서코드, 직급코드를 조회하세요
SELECT EMP_ID
	 , EMP_NAME
	 , SALARY
	 , DEPT_CODE
	 , JOB_CODE
  FROM "C##EMPLOYEE".EMPLOYEE
 WHERE SALARY >= 3500000
   AND SALARY <= 5500000;

-- BETWEEN AND 사용
-- 컬럼명 BETWEEN  하한값 AND 상한값
-- : 하한값 이상, 상한값 이하의 값
 SELECT EMP_ID
	  , EMP_NAME
	  , SALARY
	  , DEPT_CODE
 	  , JOB_CODE
   FROM "C##EMPLOYEE".EMPLOYEE
  WHERE SALARY
BETWEEN 3500000 AND 5500000;

-- 반대로 급여를 350만원 미만, 또는 550만원 초과하는 직원의 사번, 이름, 부서코드, 급여를 조회하세요.
SELECT 
	EMP_ID 
	, EMP_NAME 
	, DEPT_CODE 
	, SALARY 
FROM "C##EMPLOYEE".EMPLOYEE
-- WHERE SALARY < 3500000
-- OR SALARY > 5500000;
-- WHERE SALARY NOT BETWEEN 3500000 AND 5500000;
WHERE NOT SALARY BETWEEN 3500000 AND 5500000;


-- LIKE 연산자 : 문자패턴이 일치하는 값을 조회할 때 사용
-- 컬럼명 LIKE '문자패'
-- > 조회할때 특정 문자패턴이 있는 것을 조회해온다.
-- 문자 패턴 : '글자%' 글자로 시작하는 
--          '%글자%' 글자가 포함된 
--           '%글자' 글자로 끝나는
-- EMPLOYEE 테이블에서 성이 김씨인 직원의 사번, 이름, 입사일 조회
SELECT EMP_ID
	 , EMP_NAME
	 , HIRE_DATE
  FROM "C##EMPLOYEE".EMPLOYEE
 WHERE EMP_NAME LIKE '김%';

-- EMPLOYEE 테이블에서 성이 김씨가 아닌 직원의 사번, 이름, 입사일 조회
SELECT EMP_ID
	 , EMP_NAME
	 , HIRE_DATE
  FROM "C##EMPLOYEE".EMPLOYEE
 WHERE EMP_NAME NOT LIKE '김%';

-- EMPLOYEE 테이블에서 '하'가 이름에 포함된 직원의 이름, 주민번호 ,부서코드 조회
SELECT EMP_NAME
	 , EMP_NO
	 , DEPT_CODE
  FROM "C##EMPLOYEE".EMPLOYEE
 WHERE EMP_NAME LIKE '%하%';


-- EMPLOYEE 테이블에서 전화번호 국번이 9로 시작하는 직원의 사번, 이름, 전화번호를 조회하세요.
-- 와일드 카드 사용 : _(글자 한자), %(0개 이상의 글)
SELECT EMP_ID
	 , EMP_NAME
	 , PHONE
  FROM "C##EMPLOYEE".EMPLOYEE
 WHERE PHONE LIKE '___9%';

-- EMPLOYEE 테이블에서 _앞글자가 3자리인 이메일주소를 가진 사원의 사번 , 이름, 이메일주소 조회
SELECT EMP_ID
	 , EMP_NAME
	 , EMAIL
  FROM "C##EMPLOYEE".EMPLOYEE
 WHERE EMAIL LIKE '___@_%' ESCAPE '@';

SELECT EMP_ID
	 , EMP_NAME
	 , EMP_NO
  FROM "C##EMPLOYEE".EMPLOYEE
 WHERE EMP_NO  LIKE '_______@_%' ESCAPE '@';



-- 이씨성이 아닌 직원의 사번, 이름, 이메일주소 조회
SELECT 
	EMP_ID 
	, EMP_NAME 
	, EMAIL 
FROM "C##EMPLOYEE".EMPLOYEE
WHERE EMP_NAME NOT LIKE '이%';


-- 부서코드가 'D6' 이거나 'D8 '인 직원인
-- 이름, 부서, 급여를 조회하세요
-- IN 연산자 : 비교하려는 값 목록에 일치하는 값이 있는지 확인
SELECT EMP_NAME
	 , DEPT_CODE
	 , SALARY
  FROM "C##EMPLOYEE".EMPLOYEE
--WHERE DEPT_CODE  = 'D6' OR DEPT_CODE = 'D8';
 WHERE DEPT_CODE  IN ('D6','D8');



--부서코드가 'D6'이거나 'D8'인 직원을 제외한 나머지 직원의 이름, 부서, 급여를 조회하세요.
SELECT 
	EMP_NAME 
	, DEPT_CODE
	, SALARY 
FROM "C##EMPLOYEE".EMPLOYEE
WHERE DEPT_CODE NOT IN ('D6','D8')
OR DEPT_CODE IS NULL;


/*
 * 연산자 우선순위
 * 1. 산술연산자
 * 2. 연결연산자 ( || )
 * 3. 비교연산자
 * 4. IS NULL / IS NOT NULL, LIKE / NOT LIKE / IN / NOT IN
 * 5. BETWEEN AND / NOT BETWEEN AND
 * 6. NOT (논리연산자)
 * 7. AND
 * 8. OR
 * */

-- J2 직급의 급여 200만원 이상 받는 직원이거나
-- J7 직급인 직원의 이름, 급여, 직급코드 조회

SELECT 
	EMP_NAME 
	, SALARY 
	,JOB_CODE  
FROM "C##EMPLOYEE".EMPLOYEE
WHERE JOB_CODE = 'J2' AND SALARY  >= 2000000 OR JOB_CODE ='J7';


-- J7직급이거나 J2직급인 직원들 중 급여가 200만원 이상인
-- 직원의 이름, 급여, 직급코드를 조회

SELECT 
	EMP_NAME 
	, SALARY 
	, JOB_CODE 
FROM "C##EMPLOYEE".EMPLOYEE
WHERE JOB_CODE IN ('J2','J7') AND SALARY >= 2000000;




