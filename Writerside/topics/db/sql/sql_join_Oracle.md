# Oracle 전용 구문
오라클은 FROM절에 , 구분하여 합칠 테이블명들을 기술하고,  
WHERE 절에 합치기 위해 사용될 컬럼명을 명시한다.


<procedure title="전용 구문" id="oracle">

<code-block lang="sql" src="/Language/dbms/sql/orcale_join.sql" include-lines="9-15" />
<code-block lang="sql" src="/Language/dbms/sql/orcale_join.sql" include-lines="17-23" />
<tip>
컬럼명이 같을 경우 테이블에 별칭 사용
</tip>
</procedure>

<procedure title="OUTER JOIN" id="outer_join">
<step>
<p>문법</p>
<p>FULL OUTER JOIN의 오라클 전용 구문은 존재하지 않는다.</p>
<code-block lang="sql">
SELECT * FROM TABLE1, TABLE2 WHERE TABLE1.ID = TABLE2.REF_ID(+);
SELECT * FROM TABLE1, TABLE2 WHERE TABLE1.ID(+) = TABLE2.REF_ID;
</code-block>
</step>
<code-block lang="sql" src="/Language/dbms/sql/orcale_join.sql" include-lines="88-92" />
<code-block lang="sql" src="/Language/dbms/sql/orcale_join.sql" include-lines="104-108" />
</procedure>

<procedure title="NON EQUAL JOIN" id="non_eqaul_join">
<step>
<p>문법</p>
<code-block lang="sql">
SELECT * FROM TABLE1, TABLE2 WHERE TABLE1.COL BETWEEN TABLE2.MIN AND TABLE2 MAX;
</code-block>
</step>
<code-block lang="sql" src="/Language/dbms/sql/orcale_join.sql" include-lines="147-152" />
</procedure>

<procedure title="SELFT JOIN" id="selft_join">
<step>
<p>문법</p>
<code-block lang="sql">
SELECT * FROM TABLE1, TABLE2 WHERE TABLE1.ID = TABLE2.REF_ID;
</code-block>
</step>
<code-block lang="sql" src="/Language/dbms/sql/orcale_join.sql" include-lines="157-164" />
</procedure>