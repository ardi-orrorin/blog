# 04. SingleRow-Date

<show-structure for="procedure" />

<procedure title="SYSDATE" id="sysdate" style="choices">
<step>
    <p>현재 날짜와 시간을 반환</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="252" lang="sql"/>
</procedure>

<procedure title="MONTH_BETWEEN" id="monthBetween" style="choices">
<step>
    <p>두 날짜의 개월 수 차이를 숫자로 반환</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="257-260" lang="sql"/>
</procedure>

<procedure title="ADD_MONTHS" id="addMonths" style="choices">
<step>
    <p>날짜에 숫자만큼 개월 수를 더해서 반환</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="265" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="268-272" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="274-278" lang="sql"/>
</procedure>

<procedure title="NEXT_DAY" id="nextDay" style="choices">
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

<procedure title="LAST_DAY" id="lastDay" style="choices">
<step>
    <p>LAST_DAY('날짜')</p>
</step>
<step>
    <p>해당 월의 마지막 날짜를 반환</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="293" lang="sql"/>
</procedure>


<procedure title="EXTRACT" id="extract" style="choices">
<step>
    <p>EXTRACT(YEAR | MONTH | DAY FROM 날짜)</p>
</step>
<step>
    <p>날짜에서 년, 월, 일 정보를 출력</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="300-303" lang="sql"/>
</procedure>

