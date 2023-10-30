# 01. Select

<h3>테이블의 데이터를 조회하는 쿼리</h3>

<show-structure for="procedure" />

<procedure title="기본 구조" id="select" style="choices">
<code-block lang="sql">
-- 기본 구조
SELECT 열 FROM 테이블명

-- 조건에 맞는 행 조회
SELECT COLUMN FROM TABLE WHERE COLUMN CONDITION VALUE
</code-block>
</procedure>

<procedure title="전체 조회" id="all">
    <code-block src="/Language/dbms/sql/oracle_Select.sql" include-lines="4-6" lang="sql"/>
</procedure>

<procedure title="일부 열(Column) 조회" id="column">
    <code-block src="/Language/dbms/sql/oracle_Select.sql" include-lines="9-12" lang="sql"/>
</procedure>

<procedure title="일부 조건에 맞는 행(ROW) 조회" id="where">
    <code-block src="/Language/dbms/sql/oracle_Select.sql" include-lines="15-18" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_Select.sql" include-lines="26-33" lang="sql"/>
</procedure>

<procedure title="별칭(Alias)" id="alias">
    <code-block src="/Language/dbms/sql/oracle_Select.sql" include-lines="36-41" lang="sql"/>
</procedure>


<procedure title="중복제거(DISTINCT)" id="distinct">
    <code-block src="/Language/dbms/sql/oracle_Select.sql" include-lines="57-62" lang="sql"/>
</procedure>