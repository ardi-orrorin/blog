# Resilience4j

## Overview

Hystrix에서 영감을 받은 내결함성 라이브러리로 네트워크 문제나 서비스의 고장으로 발생하는 결함 내성을 높이기 위한 몇가지 패턴을 제공한다. 

## Features
- 회로차단기(Circuit Breaker) : 요청받은 서빟스가 실패할 때 요청을 중단
- 폴백(Fallback) : 실패하는 요청에 대해 대체 경로를 설정한다.
- 재시도(Retry) : 요청이 실패할 때 재시도
- 벌크헤드(Bulkhead) : 과부하를 피하고자 동시 호출하는 서비스 요청 수를 제한한다.
- 속도 제한(Rate Limiter) : 서비스가 한 번에 수신하는 호출 수를 제한


## Dependency

```Groovy
plugins {
    id 'org.springframework.boot' version '3.1.5'
}

ext {
    set('springCloudVersion', "2022.0.4")
}

dependencies {
    implementation 'org.springframework.cloud:spring-cloud-starter-circuitbreaker-resilience4j'
}

dependencyManagement {
    imports {
        mavenBom "org.springframework.cloud:spring-cloud-dependencies:${springCloudVersion}"
    }
}
```

## Example

## Circuit Breaker (회로 차단기) 

```yaml
# application.yml
resilience4j:
  circuitbreaker: # 회로 차단, 서비스가 실채할 때 요청 중단
    instances:
      diaryAll: # 회로 차단기의 이름, @CircuitBreaker 어노테이션에 사용될 이름
        register-health-indicator: true # endpoint에 상태 정보 구성 정보 노출 여부 설정
        event-consumer-buffer-size: 10 # 이벤트 버퍼 크기 설정
        wait-duration-in-open-state: 5s  # 열린 상태의 대기 시간 설정
        failure-rate-threshold: 50 # 심패율 임계치(%) 설정
        record-exceptions: ## 특정 예외를 기록할지 여부 설정
          - java.lang.RuntimeException
          - java.io.IOException
          - java.util.concurrent.TimeoutException
          - org.springframework.web.client.HttpServerErrorException
          - org.springframework.web.client.ResourceAccessException
```


```Java
// Services.java

private void randomException() throws TimeoutException {
    Random rand = new Random();
    int randomNum = rand.nextInt(3) + 1;
    if(randomNum == 3) randomSleep();
}

private void randomSleep() throws TimeoutException {
    try {
        Thread.sleep((long) (Math.random() * 3000));
        throw new TimeoutException("TimeoutException");
    } catch (InterruptedException e) {
        e.printStackTrace();
    }
}


// 회로 차단기 설정
// name : 회로 차단기 이름
// @CircuitBreaker(name = "diaryAll") 
public List<Diary> findAll() {
    try {
        randomException();
    } catch (TimeoutException e) {
        throw new RuntimeException("RuntimeException"); // 에러 발생시키기
    }

    return diaryRepository.findAll();
}

```

## FallBack (폴백)

회로 차단기 패턴중 하나로 서비스와 소비자 사이에 위치하여 서비스 실패시 대체로 사용할 수 있는 메소드를 제공한다.

**주의사항**
- 자원이 타임아웃되거 실패했을 때 동작 가이드를 제공하지만, 에러를 기록하는 외에 아무것도 하지 않는다면, try-catch 블록을 사용하여 에러를 처리해야 한다.
- 폴백 서비스가 다른 분산 서비스를 호출할 경우, 그 서비스 또한 폴백으로 래핑해야 할 수 있다. 이를 고려해서 방어적 코딩을 해야한다.

```Java
// Services.java

private void randomException() throws TimeoutException {
    Random rand = new Random();
    int randomNum = rand.nextInt(3) + 1;
    if(randomNum == 3) randomSleep();
}

private void randomSleep() throws TimeoutException {
    try {
        Thread.sleep((long) (Math.random() * 3000));
        throw new TimeoutException("TimeoutException");
    } catch (InterruptedException e) {
        e.printStackTrace();
    }
}


// fallbackMethod : 메소드가 실패할 때 호출할 메소드
@CircuitBreaker(name = "diaryAll", fallbackMethod = "findAllFallback")
public List<Diary> findAll() {
    try {
        randomException();
    } catch (TimeoutException e) {
        throw new RuntimeException("RuntimeException"); // 에러 발생시키기
    }

    return diaryRepository.findAll();
}

// fallback 메소드
public List<Diary> findAllFallback(Exception e) {
    return List.of(new Diary(0L, "fallback", "fallback", null, null, null));
}
```

## Bulkhead (벌크헤드)
- Semaphore Bulkhead(세마포어 벌크헤드) : 서비스에 대한 동시 요청 수를 제한한다. 한계에 도달하면 요청한다.
- Thread Pool Bulkhead(스레드 풀 벌크헤더) : 제한된 큐와 고정 스레드 풀을 사용, 풀과 큐가 가득 차면 요청을 거부한다.

```yaml
resilience4j:
  bulkhead: # 과부하 방지. 동시 호출 서비스 요청 수 제한 
    instances:
      bulkedDiaryAll: # 벌크헤드의 이름, @Bulkhead 어노테이션에 사용될 이름
        max-concurrent-calls: 10 # 최대 동시 호출 수 기본값 25 (동시 호출 수가 초과하면 BulkheadFullException 발생)
        max-wait-duration: 10ms # 스레드를 차단할 최대 시간
        writable-stack-trace-enabled: true

  thread-pool-bulkhead: # 스레드 풀을 사용하여 동시 호출 서비스 요청 수 제한
    instances:
      bulkedDiaryAll: # 벌크헤드의 이름, @Bulkhead 어노테이션에 사용될 이름
        max-thread-pool-size: 10 # 최대 스레드 풀 크기 기본값은 Runtime.getRuntime().availableProcessors()이다.
        core-thread-pool-size: 10 # 코어 스레드 풀 크기 기본값은 Runtime.getRuntime().availableProcessors()이다.
        queue-capacity: 10 # 큐 용량을 설정, 기본값 100이다.
        keep-alive-duration: 10ms # 유후 스레드가 종료되기 전에 새 작업을 기다리는 최대 시간, 이 시간은 스레드 수가 코어 스레드 수보다 많을 때 발생. 기본값은 20ms이다.
        writable-stack-trace-enabled: true
```


```Java
// Services.java

private void randomException() throws TimeoutException {
    Random rand = new Random();
    int randomNum = rand.nextInt(3) + 1;
    if(randomNum == 3) randomSleep();
}

private void randomSleep() throws TimeoutException {
    try {
        Thread.sleep((long) (Math.random() * 3000));
        throw new TimeoutException("TimeoutException");
    } catch (InterruptedException e) {
        e.printStackTrace();
    }
}

//  Bulkhead Type : THREADPOOL, SEMAPHORE
@Bulkhead(name = "bulkedDiaryAll", type = Bulkhead.Type.THREADPOOL, fallbackMethod = "findAllFallback")
public List<Diary> findAll() {
    try {
        randomException();
    } catch (TimeoutException e) {
        throw new RuntimeException("RuntimeException"); // 에러 발생시키기
    }

    return diaryRepository.findAll();
}

public List<Diary> findAllFallback(Exception e) {
    return List.of(new Diary(0L, "fallback", "fallback", null, null, null));
}
```

## Retry (재시도)

```yaml
resilience4j:
  retry: # 서비스가 일시적으로 실패할 때 재시도
    instances:
      retryDiaryAll: # 재시도의 이름, @Retry 어노테이션에 사용될 이름
        max-attempts: 5 # 최대 재시도 횟수 기본값 3
        wait-duration: 5s # 재시도 사이의 대기 시간 기본값 500ms
        retry-exceptions: # 재시도할 예외 목록
          - java.lang.Exception
          - java.lang.RuntimeException
          - java.lang.IllegalArgumentException
          - java.util.concurrent.TimeoutException
        ignore-exceptions: # 재시도하지 않을 예외 목록
          - java.lang.Throwable
          - java.lang.IllegalStateException
          - java.lang.IllegalArgumentException
          - java.lang.RuntimeException
```

```Java
// Services.java

private void randomException() throws TimeoutException {
    Random rand = new Random();
    int randomNum = rand.nextInt(3) + 1;
    if(randomNum == 3) randomSleep();
}

private void randomSleep() throws TimeoutException {
    try {
        Thread.sleep((long) (Math.random() * 3000));
        throw new TimeoutException("TimeoutException");
    } catch (InterruptedException e) {
        e.printStackTrace();
    }
}

@Retry(name = "retryDiaryAll", fallbackMethod = "findAllFallback")
public List<Diary> findAll() {
    try {
        randomException();
    } catch (TimeoutException e) {
        throw new RuntimeException("RuntimeException"); // 에러 발생시키기
    }

    return diaryRepository.findAll();
}

public List<Diary> findAllFallback(Exception e) {
    return List.of(new Diary(0L, "fallback", "fallback", null, null, null));
}
```

## Rate Limiter (속도 제한)

```yaml
resilience4j:
  ratelimiter: # 한 번에 수신하는 호출 수 제한
    instances:
        rateLimitDiaryAll: # 속도 제한의 이름, @RateLimiter 어노테이션에 사용될 이름
            limit-for-period: 5 # 갱신 제한 기간 동안 가용한 허용 수
            limit-refresh-period: 10s # 갱신 제한 시간
            timeout-duration: 10s # 타임아웃 기본값 5s
            writable-stack-trace-enabled: true
```

```Java
// Services.java
private void randomException() throws TimeoutException {
    Random rand = new Random();
    int randomNum = rand.nextInt(3) + 1;
    if(randomNum == 3) randomSleep();
}

private void randomSleep() throws TimeoutException {
    try {
        Thread.sleep((long) (Math.random() * 3000));
        throw new TimeoutException("TimeoutException");
    } catch (InterruptedException e) {
        e.printStackTrace();
    }
}

@RateLimiter(name = "rateLimiterDiaryAll", fallbackMethod = "findAllFallback")
public List<Diary> findAll() {
    try {
        randomException();
    } catch (TimeoutException e) {
        throw new RuntimeException("RuntimeException"); // 에러 발생시키기
    }

    return diaryRepository.findAll();
}

// 회로 차단시 사용될 메소드
public List<Diary> findAllFallback(Exception e) {
    return List.of(new Diary(0L, "fallback", "fallback", null, null, null));
}
```


