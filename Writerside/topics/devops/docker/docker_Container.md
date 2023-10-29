# Container

<show-structure for="procedure" />

<procedure title="Run" style="choices" id="run">
    <p>컨테이너 실행 명령어</p>
    <step><b>[--name]</b> 컨테이너의 이름 명명 </step>
    <step><b>[--interactive]</b> 컨테이너에 접속된 상태로 실행 </step>
    <step><b>[--tty]</b> 컨테이너에 접속후 터미널을 통해 조작 </step>
    <step><b>[--detach, -d]</b> 컨테이너를 백그라운드에서 실행 </step>
    <step><b>[--publish, -p]</b> 컨테이너의 포트를 호스트 컴퓨터에 [공개 호스트 포트:컨테이너 포트, 80:8080]</step>
    <step><b>[--env]</b> 환경변수를 제공하는 변수</step>
    <p>Example</p>
    <code-block lang="bash">
        docker container run --interactive dir/image
    </code-block>
    <code-block lang="bash">
        docker container run -d -p 80:8080 dir/image
    </code-block>
    <code-block lang="bash">
        docker container run -d --name web --env TARGET=google.com dir/image
    </code-block>
</procedure>

<procedure title="Ls" style="choices" id="ls">
    <p>현재 실행 중인 모든 컨테이너를 정보를 출력</p>
    <step><b>[--all]</b> 실행 상태와 상관없이 모든 컨테이너를 출력</step>
    <p>Example</p>
    <code-block lang="bash">
        docker container ls
    </code-block>
</procedure>    


<procedure title="Top" style="choices" id="top">
    <p>대상 컨테이너에서 실행중인 프로세서의 목록을 출력</p>
    <step>
    </step>
    <p>Example</p>
    <code-block lang="bash">
        docker container top container명 
    </code-block>
</procedure>

<procedure title="Logs" style="choices" id="logs">
    <p>대상 컨테이너에서 수집된 로그를 출력</p>
    <p>Example</p>
    <code-block lang="bash">
        docker container log container명
    </code-block>
</procedure>

<procedure title="Inspect" style="choices" id="inspect">
<p>대상 컨테이너의 상세한 정보를 출력</p>
<p>Example</p>
<code-block lang="bash">
    docker container inspect container명
</code-block>
</procedure>
