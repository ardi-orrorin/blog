# 02. Tutorial-Project-build

<show-structure for="procedure" />
<procedure title="01. 프로젝트 생성" id="new" style="steps">
    <step>
        <p>새로운 Item 클릭</p>
        <img src="jenkins_new.jpg" />
    </step>
    <step>
        <p><b>아이템 이름 입력</b> > <b>Freestyle Project</b> 클릭</p>
        <img src="jenkins_newitem.jpg" />
    </step>
</procedure>

<procedure title="02. 프로젝트 설정" id="setting">
    <step>
        <p>프로젝트 설명</p>
        <img src="jenkins_general.jpg" alt=""/>
    </step>
    <step>
        <p>git 레포지토리 주소 추가</p>
        <img src="jenkins_gitsource.jpg" alt=""/>
        <tip>브렌치 설정은 */main으로 변경</tip>
    </step>
    <step>
        <p>Add build Step > Execute shell </p>
        <p>권한 설정 후 빌드 명령어 입력</p>
        <img src="jenkins_buildstep.jpg" alt=""/>
    </step>
    <step>
        <p>설정 저장</p>
    </step>
</procedure>

<procedure title="03. 빌드 실행">
    <step>
        <p>지금 빌드 > 클릭행</p>
        <img src="jenkins_buildstart.jpg" alt=""/>
    </step>
    <step>
        <p>작업공간 > 빌드 완료 확인</p>
        <img src="jenkins_buildcomplited.jpg" alt=""/>
    </step>
</procedure>

