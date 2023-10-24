# 00. Glossary

<show-structure for="procedure" />

<procedure title="System" id="system" style="choices">
<step id="master">

**[Master]\(마스터)** 인스턴스 제어에 중심이 되는 역할,
젠킨스의 설정과 옵션, 잡에 대해 완전한 권한을 갖고 있다.
</step>

<step>

**[Node]\(노드)** 잡을 실행할 수 있는 시스템을 의미 도커의 컨테이너의 역할  
</step>

<step>

**[Agent]\(에이전트)** 구버전에서 슬레이브와 같다.  
마스터에 의해 관리되고 필요에 의해 할당되어 잡을 수행을 담당 ***노드*** 에서에서 실행된다.
</step>

<step>

**[Excutor]\(엑스큐터)** 노드나 에이전트에서 잡을 실행 시키는 장소, 
엑스큐터의 갯수에 따라 동시에 실행할 수 있는 잡의 갯수 결정한다.
</step>

[//]: # (<step>)

[//]: # ()
[//]: # (**[]\&#40;&#41;** 양식)
[//]: # (</step>)
</procedure>

<procedure title="DSL" id="dsl" style="choices">
<step>
<p>
DSL : Domain-Specific Language 정의 <br/>
파이프라인 생성을 위해 사용하는 프로그래밍 언어
</p>
</step>
<step>
    <p>스크립트 구조</p>
    <code-block lang="groovy">
        node ('worker1') {
            stage('Source') { // 화면 표시 목적
                // 깃 저장소에서 코드 가져오기
                git 'https://github.com/~~~/~~~' 
            }
        }
    </code-block>
</step>
</procedure>
