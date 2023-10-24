# 01. Install

<show-structure for="procedure" depth="2" />

<procedure title="1. Docker Version" id="DockerVersion" style="steps">
    <step id="1">
        <p>터미널(terminal) 및 명령프롬프트(cmd) 실행</p>
    </step>
    <step>
        <code-block lang="shell">
        docker run -d --name jenkins --restart=on-failure \
        -p 8080:8080 \ 
        -v /var/jinks_home:/var/jenkins_home \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -e TZ=Asia/Seoul \ 
        -u root jenkins/jenkins
        </code-block>
        <tabs>
            <tab title="-d">
                컨테이너가 실행 후 종료가 되지 않고 백그라운드에서 계속 돌아가게 한다.
            </tab>
            <tab title="--name">
                컨테이너의 이름
            </tab>
            <tab title="--restart=on-failure">
                비정상적인 종료 되는 경우, 컨테이너가 자동으로 재시작되도록 하는 명령어
            </tab>
            <tab title="-p">
                컨테이너 내부와 외부의 연결할 포트 번호
            </tab>
            <tab title="-v">
                컨테이너 저장소
            </tab>
            <tab title="-e">
                환경설정 명령어로, TZ 시간대 설정을 나타낸다.
            </tab>
            <tab title="-u">
                컨테이너의 사용할 계정
            </tab>
            <tab title="jenkins/jenkins">
                젠킨스 docker 이미지명
            </tab>
        </tabs>
    </step>
</procedure>

<procedure title="2. Init" id="init" style="steps">
    <step>
        <a href="http://localhost:8080">http://localhost:8080</a> 접속
    </step>
    <step>
        <p>초기 비밀번호 입력</p>
        <img src="jenkins_initAdminPassword.jpg" alt="" thumbnail="true"/>
    </step>
    <step>
        <p>초기 비밀번호 확인</p>
        <code-block>
            vi /var/jenkins_home/secrets/initialAdminPassword
        </code-block>
    </step>
    <step>
        <p>플러그인 설치</p>
        <img src="jenkins_setPlugin.jpg" alt="" thumbnail="true"/>
    </step>
    <step>
        <p>초기 세팅</p>
        <img src="jenkins_initSetting.jpg" alt="" thumbnail="true"/>
    </step>
    <step>
        <p>어드민 계정 생성</p>
        <img src="jenkins_firstAccount.jpg" alt="" thumbnail="true"/>
    </step>
    <step>
        <p>접속할 Jenkins URL 주소 설정</p>
        <img src="jenkins_jekinsUrl.jpg" alt="" thumbnail="true"/>
    </step>
    <step>
        <p>젠킨스 시작</p>
        <img src="jenkins_jenkinsStart.jpg" alt="" thumbnail="true"/>
    </step>
</procedure>
