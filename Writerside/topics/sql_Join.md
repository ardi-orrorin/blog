# 03. Join

<show-structure for="procedure"/>

두 개의 테이블을 하나로 합쳐서 결과를 조회하는 쿼리 명령어

<procedure title="Inner Join" id="inner_join" style="choices">
    <step>조인의 기본은 Inner Join, Equal join 이라고 한다.</step>
    <step>연결되는 컬럼의 값이 일치하는 행들만 조회</step>
</procedure>

<procedure title="Outer Join" id="outer_join" style="choices">
    <step>두 테이블 중 지정하는 컬럼 값이 일치하지 않는 행도 조회한다.</step>
    <step>같이 않아도 될 테이블의 위치에 따라 LEFT OUTER JOIN, RIGHT OUT JOIN, FULL OUTER JOIN 세 가지로 구분한다.</step>
    <step><b>LEFT OUTER JOIN :</b> JOIN구문 사용시 왼쪽에 사용되는 테이블의 행을 기준으로 조회</step>
    <step><b>RIGHT OUTER JOIN :</b> JOIN구문 사용시 오른쪽에 사용되는 테이블의 행을 기준으로 조회</step>
    <step><b>FULL OUTER JOIN :</b> JOIN구문 사용시 양쪽 모두를 기준으로 조회, 즉 두 테이블 행 조회</step>
</procedure>

<procedure title="Non Equal Join" id="non_equal_join" style="choices">
    <step>지정한 컬럼의 값이 일치하는 경우가 아닌, 값의 범위에 포함되는 행들을 연결하는 방식</step>
</procedure>

<procedure title="SELF JOIN" id="self_join" style="choices">
    <step>같은 테이블을 조인하는 경우</step>
    <step>자기 자신의 조인을 맺는 구문</step>
</procedure>

<procedure title="CROSS JOIN" id="cross_join" style="choices">
    <step>카이션곱이라 부른다.</step>
    <step>조인되는 테이블의 각 행들이 모두 매핑된 데이터가 검색되는 방법</step>
</procedure>

