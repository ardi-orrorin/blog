# 01. Install

<show-structure for="procedure" depth="2" />

<procedure title="1. Docker Version" id="DockerVersion" style="steps">
    <step id="1">
        <p>터미널(terminal) 및 명령프롬프트(cmd) 실행</p>
    </step>
    <step>
        <code-block>
        docker run -d --name jenkins --restart=on-failure \
        -p 8080:8080 \
        -v /var/jinks_home:/var/jenkins_home \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -e TZ=Asia/Seoul \
        -u root jenkins/jenkins
        </code-block>
    </step>
</procedure>

<procedure title="2. Init" id="init" style="steps">
    <step>
        <a href="http://localhost:8080">http://localhost:8080</a> 접속
    </step>
    <step>
        <p>초기 비밀번호 입력</p>
        <img src="jenkins_initAdminPassword.jpg" alt=""/>
    </step>
    <step>
        <p>초기 비밀번호 확인</p>
        <code-block>
            vi /var/jenkins_home/secrets/initialAdminPassword
        </code-block>
    </step>
    <step>
        <p>플러그인 설치</p>
        <img src="jenkins_setPlugin.jpg" alt=""/>
    </step>
    <step>
        <p>초기 세팅</p>
        <img src="jenkins_initSetting.jpg" alt=""/>
    </step>
    <step>
        <p>어드민 계정 생성</p>
        <img src="jenkins_firstAccount.jpg" alt=""/>
    </step>
    <step>
        <p>접속할 Jenkins URL 주소 설정</p>
        <img src="jenkins_jekinsUrl.jpg" alt=""/>
    </step>
    <step>
        <p>젠킨스 시작</p>
        <img src="jenkins_jenkinsStart.jpg" alt=""/>
    </step>
</procedure>
