# Github-Polling-Build

<show-structure for="procedure" />

<procedure title="Generate Github Access Token" style="steps">
    <step>
        <ui-path>Profile > Settings > Developer settings</ui-path>
    </step>
    <step>
        <ui-path>Personal access tokens > Tokens > generate Token </ui-path>
    </step>
    <step>
        <p>repo 선택 후 토큰 생성</p>
        <img src="jenkins_githubaddtoken.jpg" thumbnail="true"/>
        <tip>
            <p>Expiration</p>
            <p>토큰 유효기간</p>
        </tip>
    </step>
    <step>
        <p></p>
    </step>
</procedure>

<procedure title="Add Github Access Token To Jenkins" style="steps">
    <step>
        <ui-path>Jenkins 관리 > credentials > System > Global credentials > Add Credentials</ui-path>
    </step>
    <step>
        <p>username에 Github 계정 아이디</p>
    </step>
    <step>
        <p>password에 Github access token 코드 붙여넣기</p>
    </step>
    <step>
        <p>id에 Github access token 코드 붙여넣기</p>
    </step>
    <step>
        <p>id에 Github access token 코드 붙여넣기</p>
    </step>
    <step>
        <img src="jenkins_addcredentials.jpg" thumbnail="true"/>
    </step>
</procedure>

<procedure title="Job Setting Polling" style="steps">
    <step>
        <p>General > Github Project URl 주소에 깃 레포지토리 주소 입력</p>
        <img src="jenkins_githuburl.jpg" thumbnail="true" />
    </step>
    <step>
        <p>소스관리 > Git > Repositories > Credentials 에 등록한 토큰 계정 선택</p>
        <img src="jenkins_gitCredentials.jpg" alt="" />
    </step>
    <step>
        <p>빌드유발 > GitHub hook trigger for GITScm polling 선택</p>
        <img src="jenkins_githubjhookpolling.jpg" thumbnail="true"/>
    </step>
</procedure>

<procedure title="Polling Test">

<step>
<p>main 브런치 commit 진행</p>
<img src="jenkins_test.jpg" alt="" thumbnail="true" />
</step>
</procedure>