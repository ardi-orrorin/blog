# ANSI 표준 구문

<show-structure for="procedure"/>

<procedure title="JOIN" id="standard">
<step>
<p>문법</p>
<code-block lang="sql">
SELECT * FROM TABLE1 JOIN TABLE2 ON TABLE1.ID = TABLE2.REF_ID;
</code-block>
</step>
<code-block lang="sql" src="/Language/dbms/sql/orcale_join.sql" include-lines="27-34" />
<code-block lang="sql" src="/Language/dbms/sql/orcale_join.sql" include-lines="36-42" />
<code-block lang="sql" src="/Language/dbms/sql/orcale_join.sql" include-lines="44-50" />
</procedure>


<procedure title="OUTER JOIN" id="outer_join">
<step>
<p>문법</p>
<code-block lang="sql">
SELECT * FROM TABLE1 LEFT JOIN TABLE2 ON TABLE1.ID = TABLE2.REF_ID;
SELECT * FROM TABLE1 RIGHT JOIN TABLE2 ON TABLE1.ID = TABLE2.REF_ID;
SELECT * FROM TABLE1 FULL JOIN TABLE2 ON TABLE1.ID = TABLE2.REF_ID;
</code-block>
</step>
<code-block lang="sql" src="/Language/dbms/sql/orcale_join.sql" include-lines="95-99" />
<code-block lang="sql" src="/Language/dbms/sql/orcale_join.sql" include-lines="111-114" />
<code-block lang="sql" src="/Language/dbms/sql/orcale_join.sql" include-lines="121-124" />
</procedure>

<procedure title="CROSS JOIN" id="cross_join">
<step>
<p>문법</p>
<code-block lang="sql">
SELECT * FROM TABLE1 CROSS JOIN TABLE2 ON TABLE1.ID = TABLE2.REF_ID;
</code-block>
</step>
<code-block lang="sql" src="/Language/dbms/sql/orcale_join.sql" include-lines="129-132" />
</procedure>

<procedure title="NON EQUAL JOIN" id="non_eqaul_join">
<step>
<p>문법</p>
<code-block lang="sql">
SELECT * FROM TABLE1 LEFT JOIN TABLE2 ON TABLE1.COL BETWEEN TABLE2.MIN AND TABLE2 MAX;
</code-block>
</step>
<code-block lang="sql" src="/Language/dbms/sql/orcale_join.sql" include-lines="147-152" />
</procedure>

<procedure title="SELFT JOIN" id="selft_join">
<step>
<p>문법</p>
<code-block lang="sql">
SELECT * FROM TABLE1 JOIN TABLE2 ON TABLE1.ID = TABLE2.REF_ID;
</code-block>
</step>
<code-block lang="sql" src="/Language/dbms/sql/orcale_join.sql" include-lines="168-174" />
</procedure>