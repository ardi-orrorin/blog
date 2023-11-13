# 04. trigger 

## Overview
조건에 따라 지정한 pipeline을 실행하게 한다.  
종류로는 crom, pllSCM, upstream, githubPush가 있다.


### 1. cron
지정한 주기를 참조해 파이프라인을 실행

```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="77-80"}

### 2. pollSCM
SCM을 주기적으로 폴링하여 변경사항이 있을 경우 파이프라인을 실행



### 3. upstream
다른 파이프라인이 성공적으로 실행되었을 때 파이프라인을 실행

```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="82-88"}

### 4. githubPush
1. github에 push가 발생하면 해당 파이프라인 실행
2. Github hook trigger for GitSCM polling와 같은 방식으로 작동한다.
3. 잡에서 지정된 SCM polling을 참조해서 변경 사항을 내려 받는다.

```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="90-92"}