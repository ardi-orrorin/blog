# NodeJS

<show-structure for="procedure" />

<procedure title="Intall NodeJS " style="steps">
    <step>
        <p>Jenkins관리 > Plugins >  Available plugins</p>
    </step>
    <step>
        <img src="jenkins_nodeplugin.jpg" alt="" thumbnail="true"/>
    </step>
    <step>
        <p>NodeJS install</p>
    </step>
</procedure>

<procedure title="ADD Node ENV" style="steps">
    <step>
        <p>Jenkins 관리 > tools > NodeJs installations </p>
    </step>
    <step>
        <p>Add nodeJS > name &amp; version 선택 후 저장 </p>
    </step>
    <step>
        <img src="jenkins_addnode.jpg" alt="" thumbnail="true"/>
    </step>
</procedure>


<procedure title="Job Setting" style="steps">
    <step>
        <p>프로젝트 Job 생성 &amp; 수정에서 node 환경변수 설정 후 스크립트 작성</p>
    </step>
    <step>
        <p>Node &amp; npm bin/folder to PATH 체크</p>
        <img src="jenkins_nodebuildenv.jpg" alt=""  thumbnail="true"/>
    </step>
    <step>
        <p>npm 명령어 스크립트 작성</p>
        <img src="jenkins_nodebuildstep.jpg" alt="" thumbnail="true" />
    </step>
</procedure>