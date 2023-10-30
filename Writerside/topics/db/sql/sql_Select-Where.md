# 01. Select-Where

테이블 조회시 조건에 맞는 행만 표시하는 조건 쿼리문

<show-structure for="procedure" />

<procedure title="기본 문법" id="basic">
<code-block lang="sql">
SELECT * FROM WHERE 컬럼 연산자 값
</code-block>
</procedure>

<procedure title="연산자" id="operator">
<table>
<tr>
<td>비교연산자</td><td>설명</td>
</tr>
<tr>
<td>=</td><td>같다</td>
</tr>
<tr>
<td>&gt;</td><td>초과</td>
</tr>
<tr>
<td>&gE;</td><td>이상</td>
</tr>
<tr>
<td>&lt;</td><td>미만</td>
</tr>
<tr>
<td>&lE;</td><td>이하</td>
</tr>
<tr>
<td>!=, ^=, &lt;&gt;</td><td>같지 않다</td>
</tr>
<tr>
<td>AND</td><td>그리고, 둘다 참일 때 참  1*1 개념 </td>
</tr>
<tr>
<td>OR</td><td>또는, 하나만 참이여도 참 1+1의 개념</td>
</tr>
<tr>
<td>NOT</td><td>부정</td>
</tr>
<tr>
<td>LIKE</td><td>문자열 조회</td>
</tr>
<tr>
<td>IN(var1, var2)</td><td>var1, var2 두 값을 포함</td>
</tr>
<tr>
<td>BETWEEN var1 AND var2</td><td>var1 과 var2 사이값 조회</td>
</tr>
</table>

<table>
<tr>
<td>기타 연산자</td>
<td>설명</td>
</tr>
<tr>
<td>||</td>
<td>연결 연산자</td>
</tr>
</table>
</procedure>

<procedure title="연산자 우선순위" id="order" style="steps">
<step>
    <p>산술연산자</p>
</step>
<step>
    <p>연결연산자</p>
</step>
<step>
    <p>비교연산자</p>
</step>
<step>
    <p>IS NULL / IS NOT NULL, LIKE / NOT LIKE / IN / NOT IN</p>
</step>
<step>
    <p>BETWEEN AND / NOT BETWEEN AND</p>
</step>
<step>
    <p>NOT(논리연산자)</p>
</step>
<step>
    <p>AND</p>
</step>
<step>
    <p>OR</p>
</step>
</procedure>

<procedure title="=" id="equal">
    <code-block src="/Language/dbms/sql/oracle_Select.sql" include-lines="20-23" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_Select.sql" include-lines="129-137" lang="sql"/>
</procedure>

<procedure title=">, >=, <. <=" id="oper">
    <code-block src="/Language/dbms/sql/oracle_Select.sql" include-lines="139-148" lang="sql"/>
</procedure>

<procedure title="BETWEEN" id="between">
    <code-block src="/Language/dbms/sql/oracle_Select.sql" include-lines="150-160" lang="sql"/>
</procedure>

<procedure title="LIKE" id="like">
    <code-block src="/Language/dbms/sql/oracle_Select.sql" include-lines="175-186" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_Select.sql" include-lines="188-193" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_Select.sql" include-lines="195-200" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_Select.sql" include-lines="203-222" lang="sql"/>
</procedure>

<procedure title="IN" id="in">
    <code-block src="/Language/dbms/sql/oracle_Select.sql" include-lines="235-243" lang="sql"/>
</procedure>