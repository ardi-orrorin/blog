# 02. Micehub

## 재직 기간 : 2023.12.01 ~ 2024.04.05

## 회사 소개
- MICE 사업 중 Conventions, Exhibitions/Events 서비스를 제공하는 업체로써 Saas를 지향
- 사용자(Mice 사업의 주체)로 하여금 행사 및 컨벤션을 쉽게 관리활 수 있도록 웹 서비스를 제공하고 있다.

## 참여 프로젝트

### 1. IGC2024
- 소개 : IGC2024는 MICE 사업의 일환으로 개최되는 국제 학술대회
- 기술 스텍 : 
  - Server : Spring, Struts, MyBatis, MySql, 
  - 관리자 Front : JSP, Jquery, Vuejs, 
  - 사이트 Front : React, Typescript
- 기간 : 2024.01.08 ~ 2024.03.08
- 담당 : Frontend
- 내용 : 해당 행사의 논문 발표를 위한 논문 심사 프로세스 개발
- 개발 내용 : 
  - IGC행사의 기능 중 논문 심사 기능 개발
  - 참여 인원 2명, 신입, 신입
  - 개발 언어 내부 시스템 페이지 Vue+ JSP, 관리자 페이지 Vue, 일반 사용자 이용 사이트 React
- 어려움 :
  - 관리자 페이지 
    - 시스템이 Jsp에서 vue를 라이브러리로 import하는 형태의 베이스로 구축이 되었고, 
    - Component 파일을 script로 import 하여 화면을 구성하는 형태의 프로젝트로 구성
    - vue의 전용 함수 및 작업물이 ide에 제대로 인식되지 않아 import 다른 컴포넌트에서 활용할 경우 휴먼 에러가 자주 발생
    - 이로 인한 랜더링 오류시 콘솔 내용도 devtool에서 확인이 불가능하여 디버깅에 어려움을 겪음
    - 단위 테스트의 환경을 구축할 수 없어 컴포넌트의 메소드 제작시 항시 검증식의 작성을 통해 최대한 오류를 줄이도록 노력
  - 카테고리
    - 논문의 카테고리가 존재하여 n개의 깊이를 가질 수 있도록 설계됨(DB는 Flat한 구조로 되어있음)
    - 최대 1~n개까지의 깊이를 선택 후 검색이 가능해야 하며, 선택된 카테고리의 하위 카테고리를 선택할 수 있어야 함
    - 심사자가 논문을 심사할 수 있는 카테고리의 범위가 있어, 중복값 제거 및 선택된 값에 대한 카테고리의 역 추척 필요
    - 해결(DFS이용)
      - v-for의 특성상 미리 최대 크기를 지정할 필요가 있어, DFS를 이용하요 최대 깊이를 구하여 미리 최대 공간 확보
      - computed를 통해 현재 깊이까지의 데이터를 메모라이징 하여 최대한 불필요한 랜더링을 줄임
  - 상수값
    - 논문의 심사 상태에 따른 표시되는 값들이 여러 컴포넌트에 걸쳐 사용되어 클래스를 이용하여 상수값을 관리
    - 이를 해당 클래스의 메소드를 통해 검색하여 찾는 방식으로 객체지향적인 방법으로 상수값을 관리
    - Typescript의 Enum 타입도 존재하나 Type만으로는 정의 할 수 있는 형태가 제한적이여서, 사이트는 enum Type과 클래스 같이 이용

### 2. 삼성라이온즈
- 소개 : 야구 경기의 영상을 업로드하여 선수의 전력을 분석하는 서비스
- 기술 스텍 : 
  - Server : Springboot, Webflux, Oracle 
  - Front : Nextjs, Typescript
- 기간 : 2023.03.11 ~ 2024.03.29
- 담당 : Backend
- 내용 : 영상 업로드 및 조회 리마스터링 - 분절 영상 조회 기능
- 개발 내용 : 
  - 선수 영상 조회 및 업로드 관련 기능 개발
  - 참여 인원 3명, 고급(10년이상), 초급(3년미만), 본인
  - nextJs를 이용한 SSR 렌더링, Webflux를 이용한 논 블로킹 방식의 서버 구축
- 담당 내용 :
  - Webflux를 이용한 NonBlocking 처리
  - 조회 쿼리 최적화(실행계획의 내용을 통한 쿼리 최적화)
    - 불필요한 Left join, column, 제거
    - join 순서 변경 index 위주 및 row 수가 적은 테이블 우선 join
    - index scan 위주의 join 조건 page 처리 시 order by 분리
  - 원본 영상을 분절화 하기 위한 메타데이터 xml 생성
- 어려움 :
  - Webflux
    - Webflux의 논블로킹 방식의 처리로 인해, 기존의 서버와 다르게 동작하는 부분이 많아 이해가 필요
    - 파일 업로드 또한 블로킹 방식과는 다른 방식으로 처리되어야 하며, 해당 내용의 자료가 부족
  - 해결 :
    - Test 코드를 통해 log를 확인하여 버블 다이어그램과 일치하는지 매칭 시키며 이해
    - postman을 통해 고정 유저 스트레스 테스트를 통해 자원 효율 테스트 진행