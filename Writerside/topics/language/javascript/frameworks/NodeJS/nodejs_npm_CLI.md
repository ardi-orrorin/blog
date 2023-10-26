# 01. CLI

<show-structure for="procedure" />

<procedure title="NPM Install">
    <step>
        <code-block lang="bash">
        npm i 명령어
        <br />
        // 예제 expresJs 설치  
        <br />
        npm i express
        </code-block>
    </step>
    <step>
        <p><b>vulnerability</b></p>
        <p>
            npm은 패키지를 설치활 때 패키지에 있을 수 있는 취약점을 자동으로 검사한다. <br/><br/>
            npm audit은 패키지의 알려진 취약점을 검사할 수 있는 명령어로, 패키지를 설치시 악성코드가 설치되었는지 확인 할 수 있다.<br/>
            npm audit fix 스스로 수정할 수 있는 취약점 코드를 알아서 수정해준다. (주기적으로 하는 것 추천)<br/>
        </p>
    </step>
    <step>
        <p><b>--save</b></p>
        <p>패키지를 설치 할 때 dependencies에 패키지 이름을 추가하는 옵션으로
            npm@5부터 기본값으로 설정되어 있어 따로 입력하지 않아도 된다.
        </p>
        <br />
        <code-block lang="bash">npm i --save express</code-block>
    </step>
    <step>
        <p><b>--save-dev</b></p>
        <p>개발용 패키지 의존성 추가</p>
        <br />
        <code-block lang="bash">npm i --save-dev express</code-block>
    </step>
</procedure>