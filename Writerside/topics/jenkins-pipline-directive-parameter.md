# 05. parameter
## Overvie
w
1. 파이프라인에서 프로젝트 매개 변수를 지정하게 해준다.
2. 웹 폼에서 This build is parameterized 옵션과 같다.
3. input 스텝을 선택해서 원하는 매개 변수를 입력 받을 수도 있다.

### 1. booleanParam
1. true/false 값을 입력 받는다.
2. 하위 매개 변수로 name description defaultValue가 있다.

```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="94-96"}

### 2. choice
1. 목록에서 값을 선택할 수 있다.
2. 하위 매개 변수로 name description choices defaultValue가 있다.

```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="98-100"}

### 3. file
1. 파이프라인에서 파일을 선택할 수 있다.
2. 하위 매개 변수로 fileLocation description이 있다.
3. 저장할 위치의 디렉토리 root는 workspace이다.

```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="102-104"}

### 4. string
1. 문자열을 입력받는다.
2. 하위 매개 변수로 name description defaultValue가 있다.

```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="106-108"}

### 5. text
1. 다중 라인의 문자열을 입력 받는다.
2. 하위 매개 변수로 name description defaultValue가 있다.
    
```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="110-112"}

### 6. password
1. 텍스트를 입력 받는데, 입력한 값이 보이지 않는다.
2. 하위 매개 변수로 name description defaultValue가 있다.
    
```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="114-116"}

### 7. run
1. 사용자가 job에서 특정한 선을 선택할 수 있게 한다.
2. 하위 매개 변수로 name description filter project가 있다.
3. Filter의 종류
4. All Builds: 진행중인 빌드 포함
5. Completed Builds
6. Successful Builds : 안정, 불안정 빌드를 포함
7. Stable Builds Only

```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="118-125"}

### 8. params
1. 파이프라인에서 매개 변수 사용하기
2. params 객체를 사용해서 매개 변수를 사용할 수 있다.
3. params.NAME 형태로 사용한다.

```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="127-139"}
