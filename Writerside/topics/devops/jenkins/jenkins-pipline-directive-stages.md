# 07. stages

## Overview
### stage
1. 파이프라인의 단계를 정의한다.
2.  로컬레벨의 environment, options, parameters, stages, tools, when 디렉티브를 갖을 수 있다.

### steps
1. 스테이지의 필수 섹션이다.
2. 스테이지 내에서 실행할 명령어를 정의한다.
3. echo, archiveArtifacts, git, mail과 같은 DSL 문장을 사용할 수 있다.


## when
조건부 실행

```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="169-183"}

### allof
1. 키워드는 and와 같이 동작한다.
2. 모든 조건이 true일 때 실행한다.

```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="187-205"}

### anyof
1. 키워드는 or와 같이 동작한다.
2. 조건 중 하나라도 true일 때 실행한다.

```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="207-225"}

### not
1. 키워드는 !와 같이 동작한다.
2. 조건이 false일 때 실행한다.
    
```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="227-242"}