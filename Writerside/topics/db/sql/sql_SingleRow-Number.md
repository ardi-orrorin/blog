# 03. SingleRow-Number

<show-structure for="procedure" />

<procedure title="ABS 절대값" id="abs" style="choices">
<step>
    <p>ABS(num)</p>
</step>
<step>
    <p>절대값 구하는 함수</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="206-208" lang="sql"/>
</procedure>

<procedure title="MOD 나머지값" id="mod" style="choices">
<step>
    <p>MOD(num1, num2)</p>
</step>
<step>
    <p>num1/num2의  나머지값을 구하는 함수</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="214-216" lang="sql"/>
</procedure>

<procedure title="ROUND 반올림" id="round" style="choices">
<step>
    <p>ROUND(num, position)</p>
</step>
<step>
    <p>num 값의 position에서 반올림값 리턴</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="220-224" lang="sql"/>
</procedure>

<procedure title="FLOOR 내림" id="floor" style="choices">
<step>
    <p>FLOOR(num, position)</p>
</step>
<step>
    <p>num 값의 position에서 내림값 리턴</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="227-228" lang="sql"/>
</procedure>

<procedure title="TRUNC 내림" id="trunc" style="choices">
<step>
    <p>TRUNC(num, position)</p>
</step>
<step>
    <p>num 값의 position에서 내림처리 후 절삭</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="231-234" lang="sql"/>
</procedure>

<procedure title="CEIL 올림" id="ceil" style="choices"> 
<step>
    <p>CEIL(num, position)</p>
</step>
<step>
    <p>num 값의 position에서 올림값 리턴</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="238-239" lang="sql"/>
</procedure>