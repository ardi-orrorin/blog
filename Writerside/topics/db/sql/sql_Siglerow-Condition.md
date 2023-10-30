# 05. SingleRow-Condition

<show-structure for="procedure"/>

<procedure title="DECODE" id="decode" style="choices">
<step> 
    <p>DECODE(계산식 | 컬럼, con1, expr1, con2, expr2, con3, expr3, def)</p>
</step>
<step> 
    <p>선택함수로 계산및 컬럼의 값이 con 과 같으면 expr을 출력하고, 만족하는 con이 없을 경우 def 출력</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="510-514" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="527-540" lang="sql"/>
</procedure>

<procedure title="CASE" id="case" style="choices">
<step> 
<code-block lang="sql">
-- 기본 문법
CASE
    WHEN con THEN result
    WHEN con THEN result
    ELSE result
END
</code-block>
</step>
<step> 
    <p>con에 만족할 경우 result를 출력 아무것도 만족하지 않을 경우 else result 출력</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="549-558" lang="sql"/>
</procedure>