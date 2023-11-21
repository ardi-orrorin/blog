# 03. Docker-Compose

<show-structure for="procedure" />

<procedure title="Overview">
<p>dockerfile 자동화 시행 파일</p>
<p>docker-compose.yml 파일을 통해 여러개의 컨테이너를 한번에 실행할 수 있다.</p>
<p>컨터에너 실행시 다양한 환경변수 네트워크 설정 포트 volume등을 지정할 수 있다.</p>
</procedure>

<procedure title="Base">
<p>Version : 작성 파일이 사용된 도커 컴포즈의 파일 형식 버전</p>
<p>services : 애플리케이션을 구성하는 모든 컴포넌트를 열거하는 부분으로, 컴포즈에서는 컨테이너라고 하지않고 서비스 단위라고 부른다.</p>
<p>networks : 서비스 컨테이너가 연결된 모든 도커 네트워크를 열거하는 부분</p>
<code-block src="devops/docker/docker-compose.yml" include-lines="1-12"></code-block>

</procedure>


<procedure title="Services">
<p>container_name : </p>
<p>image : </p>
<p>ports : </p>
<p>networks : </p>
<p>environment : </p>
<p>screts : </p>
<p>depends_on : </p>
<p>file : </p>
<p>healthcheck: </p>
<p>restart: </p>
<code-block src="devops/docker/docker-compose.yml" include-lines="1-12"></code-block>
</procedure>


<procedure title="Networks">
<p>container_name : </p>
<code-block src="devops/docker/docker-compose.yml" include-lines="1-12"></code-block>
</procedure>

<procedure title="Volumes">
<p>container_name : </p>
<code-block src="devops/docker/docker-compose.yml" include-lines="1-12"></code-block>
</procedure>


<seealso>
<category ref="ref">
<a href="https://docs.docker.com/compose/compose-file/05-services/">Docker-homepgae</a>
</category>
</seealso>