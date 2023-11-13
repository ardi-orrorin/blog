# 03. option

## Overview
웹 폼 프로젝ㅌ트의 General 탭에 정의될 만한 내용들을 정의할 수 있다.

## OPTIONS

1. **buildDiscarder** : 지정된 파이프라인의 실행 수만큼 콘솔 결과와 아티팩트를 보관한다.
2. **logRotator** : 과거 이력 보관 정책을 설정한다.
3. **disableConcurrentBuilds** : 같은 파이프라인을 동시에 수행하지 못하게 막는다.
4. **retry** : 파이프라인의 수행이 실패했을 때 지정된 숫자만큼 전체 파이프라인을 재 실행
5. **skipDefaultCheckout** : 체크아웃을 수행하지 않는다.
6. **skipStagesAfterUnstable** : 스테이지 중 하나가 파이프라인을 불안정 상태로 만들 때 나머지 스테이지의 실행을 막는다.
7. **Timeou** : 실행의 타임아웃을 지정한다. (초 단위) 보다 클 경우 파이프라인을 멈춘다. 
8. **timestamps** : 콘솔 출력에 타임스탬프를 추가한다.

## Example
```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="57-61"}

```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="63-67"}

```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="69-73"}

