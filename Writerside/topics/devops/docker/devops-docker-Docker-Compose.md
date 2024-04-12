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
<p>container_name : 컨테이너 이름</p>
<p>build : 도커파일 빌드 처리 docker stack deploy에서는 적용 되지 않는다.</p>
<p>image : 컨테이너로 사용할 이미지 ex) imageName:Tag</p>
<p>ports : 컨테이너 외부와 연결할 포트 정의 외부:내부 8081:8080 or 8080-8087:8080 범위 지정 가능</p>
<p>networks : </p>
<p>environment : 환경 변수 내용 </p>
<p>screts : 시크릿 키</p>
<p>depends_on : 해당 서비스가 생성되기 위한 존속성 service 지정</p>
<p>file : </p>
<p>healthcheck: 헬스체크 Swarm에서 작동</p>
<p>restart: 여러 이유로 컨테이너가 종료기 될 때 재시작하는 조건 지정</p>
<code-block src="devops/docker/docker-compose.yml" include-lines="14-45"></code-block>
</procedure>

<procedure title="Services - Build">
<p>context : 도커파일이 위치한 상대 경로</p>
<p>dockerfile : 도커파일 이름</p>
<p>args : 도커파일에 arguments와 매치</p>
<code-block src="devops/docker/docker-compose.yml" include-lines="57-64"></code-block>
</procedure>

<procedure title="Services - Deploy">
<p>mode : global, replicated</p>
<p>replicas : 복제할 서비스의 수</p>
<p>placement : 서비스를 배치할 노드를 지정</p>
<p>resources : 서비스가 사용할 리소스 제한</p>
<p>update_config : 서비스 업데이트 전략</p>
<p>rollback_config : 업데이트 실패시 롤백 전략</p>
<p>restart : 컨테이너 재시작 조건</p>
<code-block src="devops/docker/docker-compose.yml" include-lines="66-87"></code-block>

</procedure>



<procedure title="Networks">
<p>serivces - networks : 컨테이너에서 사용할 NIC 정의</p>
<p>networks : NIC 정의</p>
<code-block src="devops/docker/docker-compose.yml" include-lines="47-55"></code-block>
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