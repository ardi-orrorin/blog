# 02. Dockerfile

<show-structure for="procedure" />

<procedure title="Basic">
<p>도커파일은 도커이미지를 생성하기 위한 스크립트 파일이다.</p>
<p>도커 파일은 확장자가 따로 없고 Dockerfile로 명명한다.</p>
</procedure>

<procedure title="FROM">
<p>도커의 이미지는 다른 이미지에서 시작한다.</p>
<p>생성할 도커의 이미지의 베이스가 될 이미지를 지정한다.</p>
</procedure>

<procedure title="ENV">
<p>환경 변수 값을 지정하기 위한 인스트럭션</p>
</procedure>

<procedure title="ADD">
<p>새 파일, 디렉터리 또는 원격 파일 URL을 복사하여 경로에 있는 이미지의 파일 시스템에 추가합니다</p>
</procedure>

<procedure title="WORKDIR">
<p>컨테이너의 이미지 파일 시스템을 지정하고 작업 디렉토리로 지정하는 인스트럭션</p>
</procedure>

<procedure title="COPY">
<p>로컬 파일을 컨테이터 이미지 파일로 복사하는 인스트럭션</p>
</procedure>

<procedure title="CMD">
<p>도커가 이미지로부터 컨테이너를 실행했을 때 자동으로 실핼할 명령 스크립트</p>
</procedure>

<procedure title="ENTRYPOINT">
<p>컨터이너가 실행시 자동으로 실핼할 명령 스크립트 </p>
<p>고정으로 시작될 명령어가 적합, cmd 파라미터가 추가되거 변동있을 명령어는 cmd 추천</p>
</procedure>

<procedure title="Example">
<code-block lang="docker">
FROM tomcat/latest 
// 톰캣 이미지를 기반으로 생성
ENV TARGET="env_test"
// 환경변수의 TARGET의 값으로 env_test으로 대체
WORKER /test
// 작업 폴더를 test으로 생성하고 기본으로 함
COPY app.jar .
// 로컬의 app.jar 파일을 작업폴더 /test으로 복사
CMD ["java", "-jar", "app.jar"]
// 컨테이터 실행시 실행할 명령어 'ENTRYPOINT' 사용
</code-block>
</procedure>


<procedure title="Build" id="build">
<p>도커 파일을 통해 도커 이미지를 생성한다.</p>
<code-block lang="shell">
    docker image build -t Image_Name:Tag_Name Dockerfile_Path[생략가능]
</code-block>
<p>Example</p>
<code-block lang="shell">
    docker image build -t repo/text:latest
</code-block>
</procedure>


<seealso>
<category ref="ref">
<a href="https://docs.docker.com/engine/reference/builder/">Docker-Homepage</a>
</category>
</seealso>