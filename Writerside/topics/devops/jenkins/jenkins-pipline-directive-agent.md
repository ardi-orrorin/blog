# 01. agent

## Overview
agent란? pipeline을 실행할 노드를 지정한다.

## Any
모든 노드에서 실행할 수 있다는 의미
```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="1-3"}

## None
어떤 노드에서도 실핼 하지 않겠다는 의미

```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="5-7"}


## Label
파이프라인이나 스테이지에서  \<label>이라는 레이블을 가진 에이전트에서 모두 실행하겠다는 의미

```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="9-16"}

## Docker
도커 컨테이너에서 파이프라인을 실행하겠다는 의미

```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="18-26"}

## Dockerfile
도커 파일을 이용하여 도커 컨테이너에서 파이프라인을 실행하겠다는 의미

```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="28-36"}

## Stage
스테이지에서 파이프라인을 실행하겠다는 의미

```Groovy
```
{src="devops/jenkins/pipeline/directive" include-lines="38-46"}