# 08. TypeGuard

<show-structure for="procedure" />

<procedure title="Overview">
<ul>
    <li> 여러 개의 타입으로 지정된 값을 특정 위치에서 원하는 타입으로 구분하는 것</li>
    <li>타입 시스템 관점에서는 넓은 타입에서 좁은 타입으로 범위를 좁힌다고 생각해도 된다</li>
</ul>
</procedure>

<procedure title="typeof 연산자를 이용한 타입 가드">
<code-block src="/Language/typescript/Core/10_type_guard/01_type_guard.ts" lang="typescript" include-lines="7-19"/>
</procedure>


<procedure title="instanceof 연산자를 이용한 타입 가드">
<code-block src="/Language/typescript/Core/10_type_guard/01_type_guard.ts" lang="typescript" include-lines="38-75"/>
</procedure>

<procedure title="typeof 연산자를 이용한 타입 가드">
<code-block src="/Language/typescript/Core/10_type_guard/01_type_guard.ts" lang="typescript" include-lines="7-19"/>
</procedure>

<procedure title="in 연산자를 이용한 타입 가드">
<code-block src="/Language/typescript/Core/10_type_guard/01_type_guard.ts" lang="typescript" include-lines="79-100"/>
</procedure>


<procedure title="function 이용한 타입 가드">
<code-block src="/Language/typescript/Core/10_type_guard/01_type_guard.ts" lang="typescript" include-lines="104-120"/>
</procedure>


<procedure title="switch 연산자를 이용한 타입 가드">
<code-block src="/Language/typescript/Core/10_type_guard/01_type_guard.ts" lang="typescript" include-lines="127-155"/>
</procedure>