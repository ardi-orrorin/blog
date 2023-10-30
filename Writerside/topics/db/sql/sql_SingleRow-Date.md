# 04. SingleRow-Date

<show-structure for="procedure" />

<procedure title="SYSDATE" id="sysdate">
<step>
    <p>현재 날짜와 시간을 반환</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="252" lang="sql"/>
</procedure>

<procedure title="MONTH_BETWEEN" id="monthBetween">
<step>
    <p>두 날짜의 개월 수 차이를 숫자로 반환</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="257-260" lang="sql"/>
</procedure>

<procedure title="ADD_MONTHS" id="addMonths">
<step>
    <p>날짜에 숫자만큼 개월 수를 더해서 반환</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="265" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="268-272" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="274-278" lang="sql"/>
</procedure>

<procedure title="NEXT_DAY" id="nextDay">
<step>
    <p>NEXT_DAY(기준날짜, 요일(문자|숫자))</p>
</step>
<step>
    <p>기준 날자에서 구하려는 요일에 가장 가까운 날자 반환</p>
</step>
<step>
    <p>0 ~ 7까지 일 ~ 토</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="283" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="286-288" lang="sql"/>
</procedure>

<procedure title="LAST_DAY" id="lastDay">
<step>
    <p>LAST_DAY('날짜')</p>
</step>
<step>
    <p>해당 월의 마지막 날짜를 반환</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="293" lang="sql"/>
</procedure>


<procedure title="EXTRACT" id="extract">
<step>
    <p>EXTRACT(YEAR | MONTH | DAY FROM 날짜)</p>
</step>
<step>
    <p>날짜에서 년, 월, 일 정보를 출력</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="300-303" lang="sql"/>
</procedure>

<procedure title="TO_CHAR" id="toChar">
<step>
    <p>TO_CHAR(날짜 | 숫자, 포맷)</p>
</step>
<step>
    <p> 날짜 및 숫자를 문자형 데이터로 변환 포맷형식 지정</p>
</step>
<step>
    <p>RR과 YY의 차이</p>
    <p>RR은 두 자리 년도를 네자리로 바꿀 때</p>
    <p>바꿀 년도가 50면 미만이면 2000년 적용</p>
    <p>바꿀 년도가 50면 이상이면 1900년 적용</p>
    <p>YY는 현재 2000년이 적용</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="326-332" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="343-348" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="379-380" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="382-383" lang="sql"/>
</procedure>