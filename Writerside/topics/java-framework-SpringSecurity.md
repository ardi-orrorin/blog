# SpringSecurity

## Version
시큐리티는 버전에 따라 Deprecated 되는 기능이 많아 설정 방법이 달라 질 수 있습니다.   
**current version**: spring-boot-starter-security:3.1.5



## Overview
스프링 보완과 관련된 설정을 하기 위한 라이브러리

## Init Configuration
@Configration를 통해 환경설정을 알리고  
@EnableWebSecurity를 통해 웹 보안을 활성화 시킨다.

```Kotlin
```
{src="Language/java/framework/springSecurity.kt" include-lines="1-3"}


## Resource Security
리소스에 대한 보안 설정을 한다.
```Kotlin
```
{src="Language/java/framework/springSecurity.kt" include-lines="6-16"}

## securityFilterChain
각종 보안과 관련된 내용을 체인 형식으로 연결하여 처리하는 메소드

```Kotlin
```
{src="Language/java/framework/springSecurity.kt" include-lines="19-22"}

## CSRF
1. 사이트 간 요청 위조(Cross-site request forgery, CSRF, XSRF) 공격
2. 사용자가 자신의 의지와는 무관하게 공격자가 의도한 행위(데이터 수정, 삭제, 등록 등) 을 특정 웹사이트에 요청하게 하는 공격
3. 주로 POST, PUT 같은 정보를 전달받는 메소드에서 XSRF-TOKEN 사용하여 토큰 검증 후 데이터를 처리한다.

```Kotlin
```
{src="Language/java/framework/springSecurity.kt" include-lines="58-65"}

## CORS
1. 교차 출처 리소스 공유 (Cross-origin resource sharing, CORS)
2. 리소스를 공유할 수 있는 출처를 제한하는 곳, 여기서 출처란 웹상에서 도메인을 의미한다.
3. Origin은 프로토콜, 호스트, 포트를 포함하여서 설정한다. ex) http://localhost:8080
4. Header에 Access-Control-Allow-Origin의 값을 설정하여 허용할 출처을 설정할 수 있다.
5. Method는 GET, POST, PUT, OPTION, DELETE 등 허용할 메소드를 설정할 수 있다.

```Kotlin
```
{src="Language/java/framework/springSecurity.kt" include-lines="24-36"}


```Kotlin
```
{src="Language/java/framework/springSecurity.kt" include-lines="38-56"}



<seealso>
    <category ref="ref">
        <a href="https://ko.wikipedia.org/wiki/%EA%B5%90%EC%B0%A8_%EC%B6%9C%EC%B2%98_%EB%A6%AC%EC%86%8C%EC%8A%A4_%EA%B3%B5%EC%9C%A0">위키백과 CORS</a>
        <a href="https://ko.wikipedia.org/wiki/%EC%82%AC%EC%9D%B4%ED%8A%B8_%EA%B0%84_%EC%9A%94%EC%B2%AD_%EC%9C%84%EC%A1%B0">위키백과 CSRF</a>
    </category>
</seealso>