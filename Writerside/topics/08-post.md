# 08. post

## Overview
1. 서브 섹션으로 파이프라인의 끝, state의 끝에서 작업의 끝난 후 실행할 작업을 정의한다.
2. 조건 종류 : always, changed, failure, success, unstable 등 있다.
3. **always** : 파이프라인의 모든 상태에서 실행
4. **changed** : 현재 빌드 상태가 이전 빌드의 상태와 달라진 경우에만 실행
5. **failure** : 파이프라인이 실패한 경우에만 실행
6. **success** : 파이프라인이 성공한 경우에만 실행
7. **unstable** : 파이프라인이 불안정한 경우에만 실행

```Groovy
```
{src="devops/jenkins/`p`ipeline/directive" include-lines="244-269"}