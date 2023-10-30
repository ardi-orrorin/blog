# 01. Group

<show-structure for="procedure" />

<procedure title="SUM 합계" id="sum" style="choices">
    <step>
        <p>SUM(num Column)</p>
    </step>
    <step>
        <p>컬럼들의 합계를 구하여 반환</p>
    </step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="15-16" lang="sql"/>
</procedure>

<procedure title="AVG 평균" id="avg" style="choices">
    <step>
        <p>AVG(num Column)</p>
    </step>
    <step>
        <p>컬럼들의 평균를 구하여 반환</p>
    </step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="20-21" lang="sql"/>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="24-27" lang="sql"/>
</procedure>

<procedure title="MIN 최소" id="min" style="choices">
    <step>
        <p>MIN(any Column)</p>
    </step>
    <step>
        <p>컬럼들 중 가장 낮은 값을 구하여 반환</p>
    </step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="32-35" lang="sql"/>
</procedure>

<procedure title="MAX 최대" id="max" style="choices">
    <step>
        <p>MAX(any Column)</p>
    </step>
    <step>
        <p>컬럼들 중 가장 큰 값을 구하여 반환</p>
    </step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="39-42" lang="sql"/>
</procedure>

<procedure title="COUNT 개수" id="count" style="choices">
    <step>
        <p>COUNT(any Column)</p>
        <p>COUNT(DISTINCT any Column)</p>
    </step>
    <step>
        <p>컬럼의 개수를 구하여 반환</p>
        <p>중복 제거도 가능하다</p>
    </step>
    <code-block src="/Language/dbms/sql/oracle_function.sql" include-lines="44-51" lang="sql"/>
</procedure>