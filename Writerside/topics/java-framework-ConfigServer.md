# ConfigServer

## Overview
Spring Cloud Config Server는 Spring Cloud Config Client가 접근할 수 있는 중앙 집중식 환경을 제공

### 장점
- 중앙 집중식 환경을 제공하여, 여러 서비스에서 공통으로 사용하는 설정을 관리할 수 있다.
- 설정을 외부에 노출시키지 않고, 암호화하여 사용할 수 있다.
- 설정을 변경하더라도, 서비스를 재시작하지 않고, 변경된 설정을 적용할 수 있다.
- 설정은 git을 통해 관리가능하며, 로컬을 통해서도 관리 가능하다.


## Start Init Config Server
[Spring initializr Page](https://start.spring.io/#!type=gradle-project&language=java&platformVersion=3.2.0&packaging=jar&jvmVersion=17&groupId=com.example&artifactId=demo&name=demo&description=Demo%20project%20for%20Spring%20Boot&packageName=com.example.demo&dependencies=cloud-config-server)

### Config Server Gradle 의존성 추가
```groovy
plugins {
  // 의존성 관리 플러그인 추가 
  id 'io.spring.dependency-management' version '1.1.4'
}

// 클라우드 버전 설정
ext {
  set('springCloudVersion', "2023.0.0-RC1")
}

// 의존성 추가
implementation 'org.springframework.cloud:spring-cloud-config-server'

// 의존성 관리 추가
dependencyManagement {
  imports {
    mavenBom "org.springframework.cloud:spring-cloud-dependencies:${springCloudVersion}"
  }
}
```

```yaml
spring:
  application:
    name: config-server # 서버 이름

  cloud:
    config:
      server:
        git:
          uri: #깃 레포지토리 주소
          username: github 계정
          password: github 계정 token 값
          clone-on-start: true # 서버 시작시 클론 여부
          search-paths: / # 레포지토리 내부 경로
          force-pull: true # 강제로 pull 하기
          timeout: 10 # 타임아웃 시간
          default-label: main # 브랜치 이름

server: # 서버 포트
  port: 8071
```

 ### 환경 설정 접근 방법
```text
/{application}/{profile}[/{label}]
/{application}-{profile}.yml
/{label}/{application}-{profile}.yml
/{application}-{profile}.properties
/{label}/{application}-{profile}.properties

application: application name, server name 
profile: profile name
label: git branch name


```

## Config Server 실행
```Java
@SpringBootApplication
@EnableConfigServer // Config Server 활성화
public class CloudConfigApplication {

    public static void main(String[] args) {
        SpringApplication.run(CloudConfigApplication.class, args);
    }

}

```



