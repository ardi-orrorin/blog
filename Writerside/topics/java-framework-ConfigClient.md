# ConfigClient

## Overview
Spring Cloud Config Client는 Spring Cloud Config Server에서 설정을 가져올 수 있는 클라이언트이다.

### 장점
- Config Server에서 제공되는 환경 설정 값이 바뀌면 자동으로 변경된다.
- 또한 변경된 내용이 로그에 남는다.

## Start Init Config Client
[Spring initializr Page](https://start.spring.io/#!type=gradle-project&language=java&platformVersion=3.2.0&packaging=jar&jvmVersion=17&groupId=com.example&artifactId=demo&name=demo&description=Demo%20project%20for%20Spring%20Boot&packageName=com.example.demo&dependencies=cloud-config-client)

### Config Client Gradle 의존성 추가
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
implementation 'org.springframework.cloud:spring-cloud-starter-config'

// 의존성 관리 추가
dependencyManagement {
  imports {
    mavenBom "org.springframework.cloud:spring-cloud-dependencies:${springCloudVersion}"
  }
}
```

### 환경 설정 접근 방법
```yaml
spring:
  application:
    name: config-client  # client-server 이름
  profiles:
    active: dev # 활성화할 프로파일
  config:
    import: optional:configserver:http://localhost:8888 // config server 주소

# ex)위 설정값이면 config-server에서 config-client-dev.yml을 사용하게 된다.  
```

### Client 설정
```java
@SpringBootApplication
@RefreshScope // 환경 설정 변경시 자동으로 변경
public class CloudHamonyApplication {
    public static void main(String[] args) {
        SpringApplication.run(CloudHamonyApplication.class, args);
    }
}
```java