# 06. By

<show-structure for="procedure" />

## 쿼리문 수행 순서
| 순서 | 키워드                                           |
|----|-----------------------------------------------|
| 5  | SELECT 컬럼명 AS 별칭, 계산식, 함수식                    |
| 1  | FROM 테이블명                                     |
| 2  | WHERE 컬럼명 함수식 비교연산자 비교                        |
| 3  | GROUP BY 그룹을 묶을 컬럼명                           |
| 4  | HAVING 그룹함수식 비교연산자 비교값                        |
| 6  | ORDER BY 컬럼명 별칭 컬럼순서 정렬방식 [NULLS, FIRST,LAST] |

<procedure title="GROUP BY" id="group_by" style="choices">
    <step>
        <p>그룹 함수의 묶을 조건 열 기준</p>
    </step>
    <code-block src="/Language/dbms/sql/oracle_by.sql" include-lines="22-25" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_by.sql" include-lines="27-33" lang="sql"/>
</procedure>

<procedure title="ORDER BY" id="order_by" style="choices">
    <step>
        <p>FIRST : 오름차순</p>
    </step>
    <step>
        <p>LAST : 내림차순</p>
    </step>
    <step>
        <p>NULLS : null값 우선 여부</p>
    </step>
    <code-block src="/Language/dbms/sql/oracle_by.sql" include-lines="35-46" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_by.sql" include-lines="49-56" lang="sql"/>
</procedure>

<procedure title="HAVING" id="having" style="choices">
    <step>
        <p>그룹함수로 구해올 그룹에 대해 조건을 설정할 때 사용</p>
    </step>
    <code-block src="/Language/dbms/sql/oracle_by.sql" include-lines="81-87" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_by.sql" include-lines="90-95" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_by.sql" include-lines="104-111" lang="sql"/>
</procedure>

<procedure title="집계함수" id="func" style="choices">
    <step>
        <p>
            ROLLUP : 그룹별로 중갑 집계 처리하는 함수 <br/>
            그룹별로 묶여진 값에 대한 중갑 집계와 총 집계를 출력
        </p>
        <code-block src="/Language/dbms/sql/oracle_by.sql" include-lines="120-124" lang="sql"/>
    </step>
    <step>
        <p>
            CUBE: 그룹별 산출한 결과를 집계하는 함수
        </p>
        <code-block src="/Language/dbms/sql/oracle_by.sql" include-lines="129-133" lang="sql"/>
    </step>
    <step>
        <p>
            CUBE: 그룹별 산출한 결과를 집계하는 함수
        </p>
        <code-block src="/Language/dbms/sql/oracle_by.sql" include-lines="129-133" lang="sql"/>
    </step>
    
</procedure>