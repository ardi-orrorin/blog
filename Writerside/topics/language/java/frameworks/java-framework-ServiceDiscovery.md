# ServiceDiscovery


## 1. 디스커버리 아키텍처
1. 서비스등록 : 서비스가 디스커버리 agent에 자신의 정보를 등록
2. 클라이언트의 서비스 주소 검색 : 서비스 클라이언트가 서비스 정보를 검색하는 방법
3. 정보 공유 : 노드 간 서비스 정보를 공유하는 방법
4. 상태 모니터링 : 서비스가 서빗 디스커버리에 상태를 전달하는 방법


## 2. Eureka-server
- Netflix OSS의 일부로 개발된 서비스 디스커버리 서버
- Spring Cloud에서는 Eureka를 기본으로 사용

### 2-1 의존성
````Groovy

plugins {
 as   id 'io.spring.dependency-management' version '1.1.3'
}
ext {
    set('springCloudVersion', "2022.0.4")
}

dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-web' // 웹 애플리케이션 api
    implementation 'org.springframework.boot:spring-boot-starter-actuator' // 애플리케이션 모니터링
    implementation 'org.springframework.cloud:spring-cloud-starter-config' // config server
    implementation 'org.springframework.cloud:spring-cloud-starter-netflix-eureka-server' // eureka server
}

dependencyManagement {
    imports {
        mavenBom "org.springframework.cloud:spring-cloud-dependencies:${springCloudVersion}"
    }
}

````


### 2-2 application.yml
```yaml
eureka:
  instance:
    hostname: localhost # eureka 서버의 호스트 이름
  client:
    register-with-eureka: false # config server가 eureka 서버에 등록할지 여부
    fetch-registry: false # eureka config server가 캐시 레지스트리 정보를 로컬에 캐시하지 않도록 지시
    service-url:
      defaultZone: http://${eureka.instance.hostname}:${server.port}/eureka/ # eureka 서버의 주소
  server:
    wait-time-in-ms-when-sync-empty: 10 # eureka 서버가 비어있을 때 클라이언트가 다시 등록하기 전까지 기다리는 시간
```

### 2-3 Application.java

```java
@SpringBootApplication
@EnableEurekaServer //  eureka 서버로 사용할 수 있도록 지정
public class EurekaClientApplication {
    public static void main(String[] args) {
        SpringApplication.run(EurekaClientApplication.class, args);
    }
}
```

## 3. Eureka-client

### 3-1 의존성
```groovy
plugins {
    id 'io.spring.dependency-management' version '1.1.3'
}

ext {
    set('springCloudVersion', "2022.0.4")
}

dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-web' // 웹 애플리케이션 api
    implementation 'org.springframework.cloud:spring-cloud-starter-config' // config server
    implementation 'org.springframework.cloud:spring-cloud-starter-netflix-eureka-client' // eureka client
    implementation 'org.springframework.cloud:spring-cloud-starter-openfeign' // feign client 
}

dependencyManagement {
    imports {
        mavenBom "org.springframework.cloud:spring-cloud-dependencies:${springCloudVersion}"
    }
}
```

### 3-2 application.yml

```yaml
# application.yml
eureka:
  instance:
    prefer-ip-address: true # 서비스 이름 대신 서비스 ip 주소로 접근
  client:
    register-with-eureka: true # 유레카 서비스 등록 여부
    fetch-registry: true # 레지스트리 사본을 로컬에 다운 받기
    service-url:
      defaultZone: http://localhost:8090/eureka/ # 유레카 서비스의 위치 설정
```

### 3-3 Application.java

```java
@SpringBootApplication
@RefreshScope // config server의 변경된 설정을 적용
@EnableDiscoveryClient
public class DiscoveryClientApplication {
    public static void main(String[] args) {
        SpringApplication.run(DiscoveryClientApplication.class, args);
    }
}
```

## 4. Discovery Service

### 4-1. 전략 패턴
- Spring Cloud Discovery Client
  - RestTemplate을 사용하여 서비스 디스커버리를 구현
- RestTemplate 사용한 Spring Discovery Client  
  - RestTemplate으로 로드밸런서를 사용하여 구현
- Spring Cloud Netflix Feign
  - NexflixFeignClient를 사용하여 구현


### 4-2. Spring Cloud Discovery Client

```Java
// Application.java
@SpringBootApplication
@RefreshScope // config server의 변경된 설정을 적용
@EnableDiscoveryClient
public class DiscoveryClientApplication {
    public static void main(String[] args) {
        SpringApplication.run(DiscoveryClientApplication.class, args);
    }
}
```

```Java
// DiscoveryClientService.java
@Service
@RequiredArgsConstructor
public class Dairy {

    private final DiscoveryClient discoveryClient;

    public List<DiaryDTO> getList(String param) {
        List<ServiceInstance> instances = discoveryClient.getInstances("hamony"); // 서비스 이름으로 서비스 인스턴스 목록 조회
        RestTemplate restTemplate = new RestTemplate();

        String url = String.format("%s/diary/%s", instances.get(0).getUri().toString(), param); // 첫번째 서비스 인스턴스의 uri를 사용하여 url 생성
        ResponseEntity<List<DiaryDTO>> responseEntity = // url로 요청
                restTemplate.exchange(url, HttpMethod.GET, null, new ParameterizedTypeReference<List<DiaryDTO>>() {
                }, param);

        return responseEntity.getBody(); // 결과 반환
    }
}
```


### 4-3. RestTemplate 로드밸런서 사용한 Spring Discovery Client
```Java
// BeanConfig.java
@Configuration
public class BeanConfig {

    @Bean
    @LoadBalanced
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
}

```

```Java
// DiscoveryClientService.java
@Service
@RequiredArgsConstructor
public class Dairy {

    private final RestTemplate restTemplate;

    public List<DiaryDTO> loadbalanceRestEmplate(String param) {
        ResponseEntity<List<DiaryDTO>> response =
                restTemplate.exchange(
                "http://hamony/diary/{param}", // 프로토롤://서비스이름/경로 형식으로 url 생성
                HttpMethod.GET, null,
                new ParameterizedTypeReference<List<DiaryDTO>>(){},
                param
        );
        return response.getBody();
    }
}
```

### 4-4. Spring Cloud Netflix Feign
```Java
// DiaryFeignClient.java
@FeignClient(name = "hamony") // 서비스 명
public interface DiaryFeignClient {

//    @RequestMapping(
//            method = RequestMethod.GET,
//            value = "/diary/{param}",
//            consumes = "application/json"
//    )
    @GetMapping("/diary/{param}")
    List<DiaryDTO> getDiaris(@PathVariable("param") String param);
}
```

```Java
// Controller.java

@RequiredArgsConstructor
@RestController
public class TestController {
    
    private final Dairy dairy;

    private final DiaryFeignClient diaryFeignClient;

    @GetMapping("/test2/{param}")
    public ResponseEntity<List<DiaryDTO>> test2(
            @PathVariable String param
    ) {
        return ResponseEntity.ok(diaryFeignClient.getDiaris(param)); // feign client 사용
    }
}
```