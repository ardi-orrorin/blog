# 02. SingleRow-Char

<show-structure for="procedure" />

<procedure title="LENGTH, LENGTHB" id="length" style="choices">
    <step>
        <p>char의 길이를 반환한다.</p>
    </step>
    <step>
        <p>length는 글자수, lengthb 바이트 수</p>
    </step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="57-63" lang="sql"/>
</procedure>

<procedure title="INSTR" id="instr" style="choices">
    <step>
        <p>INSTR('문자열' | '컬럼명' | '문자', 찾을 위치의 시작값, [빈도])</p>
    </step>
    <step>
        <p>위치 시작값이 문자열보다 큰 경우 0을 반환</p>
    </step>
    <step>
        <p>위치 시작값이 음수인 경우 좌측에서 검색 한다.</p>
    </step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="66-74" lang="sql"/>
</procedure>

<procedure title="LPAD, RPAD" id="pad" style="choices">
    <step>
        <p>LPAD('문자열',expr1, expr2) expr1 총 길이, expr2 채울 문자열 </p>
    </step>
    <step>
        <p>LPAD 문자열의 총 길이(expr1)를 좌측으로 n만큼 늘린 후, 늘어난 좌측 빈공간을 expr2로 채운다</p>
    </step>
    <step>
        <p>RPAD 문자열의 총 길이(expr1)를 우측으로 n만큼 늘린 후, 늘어난 우측 빈공간을 expr2로 채운다</p>
    </step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="77-87" lang="sql"/>
</procedure>

<procedure title="TRIM, RTRIM, LTRIM" id="trim" style="choices">
    <step>
        <p>LTRIM('문자열',expr1), RTRIM('문자열',expr1) </p>
    </step>
    <step>
        <p>LTRIM, RTRIM 주어진 문자열에 좌우끝을 기준으로 expr1와 같은 문자열 제거</p>
    </step>
    <step>
        <p>TRIM = LTRIM + RTRIM 좌우 expr1 문자열 제거</p>
    </step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="90-96" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="98-103" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="105-109" lang="sql"/>
</procedure>


<procedure title="SUBSTR, SUBSTRB" id="substr" style="choices">
<step>
    <p>SUBSTR('문자열', start, end)</p>
</step>
<step>
    <p>문자열 중 start ~ end 사이의 글자를 리턴</p>
</step>
<step>
    <p>SUBSTRB 바이트 단위로 계산</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="113-120" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="122-129" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="132-139" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="171-173" lang="sql"/>
</procedure>


<procedure title="LOWER, UPPER, INITCAP" id="lower" style="choices">
    <step>
        <p>LOWER('문자열'), UPPER('문자열') </p>
    </step>
    <step>
        <p>문자를 대소문자로 변경</p>
    </step>
    <step>
        <p>INITCAP 앞문자만 대문자로 변경</p>
    </step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="183-184" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="187-188" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="191-192" lang="sql"/>
</procedure>


<procedure title="CONCAT" id="concat" style="choices">
<step>
    <p>CONCAT('문자열1','문자열2')</p>
</step>
<step>
    <p>문자열 두개를 입력 받아 하나로 합친 후 반환</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="195-197" lang="sql"/>
</procedure>

<procedure title="REPLACE" id="replace" style="choices">
<step>
    <p>REPLACE('문자열',old, new)</p>
</step>
<step>
    <p>문자열 중 old를 찾아 new로 변환 후 반환</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="201-202" lang="sql"/>
</procedure>

<procedure title="TO_CHAR" id="toChar" style="choices">
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

<procedure title="TO_NUMBERR" id="toNumber" style="choices">
<step> 
    <p>TO_NUMBER('문자열', 포맷)</p>
</step>
<step> 
    <p>문자열을 숫자로 변환</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="442" lang="sql"/>
</procedure>

<procedure title="NULL, NVL, NVL2" id="nvl" style="choices">
<step> 
    <p>NULL : "" 와 같은 빈 문자열을 의미</p>
</step>
<step> 
    <p>NVL(col, expr) : col의 값이 null일 경우 expr 값으로 대체</p>
</step>
<step> 
    <p>NVL2(col, expr1, expr2) : col의 값이 있으면 expr1, null이면 expr2로 변경</p>
</step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="499-504" lang="sql"/>
</procedure>

