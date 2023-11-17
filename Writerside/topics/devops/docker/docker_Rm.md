# Rm(Remove)

<show-structure for="procedure" />

<procedure title="Overview" id="overview">
    <p>Docker 컨테이너 및 이미지를 삭제한다.</p>
    <code-block lang="bash">
        docker container rm Container_ID
    </code-block>
    <code-block lang="bash">
        docker container rm Container_Name
    </code-block>
    <code-block lang="bash">
        docker container rm Image_ID
    </code-block>
    <code-block lang="bash">
        docker container rm Image_Name
    </code-block>
    <p>Example Container Remove</p>
    <code-block lang="bash" src="devops/docker/docker-container-ls-a.txt" include-lines="1-18">
    </code-block>
    <code-block lang="bash" src="devops/docker/docker-container-ls-a.txt" include-lines="22-37">
    </code-block>
    <p>Example Image Remove</p>
    <code-block lang="bash" src="devops/docker/docker-container-ls-a.txt" include-lines="40-63">
    </code-block>
    <code-block lang="bash" src="devops/docker/docker-container-ls-a.txt" include-lines="66-68">
    </code-block>
    <code-block lang="bash" src="devops/docker/docker-container-ls-a.txt" include-lines="70-92">
    </code-block>

    
</procedure>

<procedure title="-f" id="force">
    <p>Docker Container || Image 실행 여부와 상관없이 강제로 삭제할 수 있다.</p>
    <code-block lang="bash">
        docker container rm -f Container_ID || Container_Name
    </code-block>
    <p>Example</p>
    <code-block lang="bash" src="devops/docker/docker-container-ls-a.txt" include-lines="95-96"></code-block>
    <code-block lang="bash" src="devops/docker/docker-container-ls-a.txt" include-lines="98-111"></code-block>
</procedure>