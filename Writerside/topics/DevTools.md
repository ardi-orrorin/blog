# DevTools


## HotSwap {id="hotswap_1"}
Java에서 HotSwap이란  JPDA(Java Platform Debugger Architecture)의 JDK 1.4부터 JPDA Enhancements를 통해 지원 되는 기능으로 디버거가 동일한 클래스 ID에 대해 빌드로 생성되는 클래스 바이트 코드를 제자리에서 업데이트할 수 있는 기능이다.


## HotReload
변경 사항을 사항이 감지되면 애플리케이션을 자동으로 로드하는 기능, JVM를 통해 HotSwap된 프로그램을 재시작없이 적용하는데 중점을 둔다.


## HotDeploy
자동 배포와 관련된 기능으로, 시작 시 애플리케이셤을 자동으로 배포하는 애플리케이션 컨터이너 기능이다.  

HotDeploy는 IDE 또는  JVM 기능이 아닌 애플리케이션 컨터에너 기능이므로 HotSwap과는 전혀 다른 기능이다.


## Spring Boot DevTools
```Groovy
// 의존성 추가
developmentOnly 'org.springframework.boot:spring-boot-devtools'
```

## IntelliJ HotSwap 설정 방법
![](springboot-hotSwap.jpg)


## HotSwap되지 않는 경우
- 클래스의 구조가 변경된 경우
- 클래스의 멤버 변수가 변경된 경우
- 클래스의 상속 구조가 변경된 경우
- 메소드의 파라미터 변경된 경우