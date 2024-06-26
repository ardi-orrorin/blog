# Anamensis(작업중...)

## Introduce
nextJs + Springboot + SpringBatch + SpringQuartz를 사용한 개인 프로젝트입니다.

## Tech Skills

### Client
- Language : Typescript
- PackageManager : NPM
- Build : TurboPack
- Framework : NextJS
- Libraries
    - Date : momentJs
    - fetchAPI : axios
    - 스타일 : tailwind
    - 문법 및 오류 체크 : ESLint
- Test
    - 미정

### Server-Common Info
- Language : Java 17
- PackageManager & Build : Gradle
- Framework : Springboot
- Libraries
  - Webflux
  - SpringSecurity
  - Mybatis
  - SpringValidation
  - Lombok
  - SpringActuator
  - SpringMail
  - AwsSES

### Resource-Server
- Libraries

- Test
  - Junit      

### Batch-Server
- Libraries
  - SpringBatch
  - SpringQuartz


## ERD
![](anamensis-erd.jpg){thumbnail="true"}


## CodeReview

### 1. 사용자 api 호출 로그 저장 필터

[GitHub Source Link](https://github.com/ardi-orrorin/anamensis/blob/main/server/src/main/java/com/anamensis/server/config/LogHistoryFilter.java)

![](anamensis-codereview-filter-01.jpg){thumbnail="true"  style="block"}

![](anamensis-codereview-filter-02.jpg){thumbnail="true"  style="block"}

![](anamensis-codereview-filter-03.jpg){thumbnail="true"  style="block"}

<seealso>
    <category ref="erdcloud">
        <a href="https://www.erdcloud.com/d/kaLkfNKiwKcPe85k4">ERD Cloud</a>
    </category>
    <category ref="git">
        <a href="https://github.com/ardi-orrorin/anamensis">Anamensis</a>
    </category>
</seealso>