# 01_OSMAS
Other Size, Main Size (기타 사이즈, 우린에겐 메인사이즈)

## 1. 프로젝트 소개

신체 구조가 매우 왜소하거나 매우 크거나, 또는 장애를 가진 사람들은 일반적인 시중 의류에서 자신에게 맞는 크기의 옷을 찾는 데 어려움을 겪을 수 있습니다.

이러한 고객들을 대상으로 한 크라우드 펀딩 프로젝트를 통해, 그 어려움을 해소하고, 모든 사람들이 자신을 표현하고 자신감을 갖을 수 있는 기회를 제공하여

사이즈에 구애받지 않고 다양한 사람들이 자신의 스타일을 표현할 수 있는 비주류 의상을 제공하고자 합니다 !

다양한 크기의 의상이 시장에 나타나게 함으로써 타깃 고객층의 불편함을 해소해주는 동시에 사회적 다양성을 존중하고 포용하는 메시지를 전달합니다.


## 2. Tech Stack
<tabs>
   <tab title="Image">
      <table>
   <tr>
      <td><img src="oracle.jpg" /></td>
      <td><img src="java.jpg" /></td>
      <td><img src="mybatis.jpg" /></td>
      <td><img src="springboot.jpg" /></td>
   </tr>
   <tr>
      <td><img src="html.jpg" /></td>
      <td><img src="css.jpg" /></td>
      <td><img src="jqeury.jpg" /></td>
      <td><img src="Thyemleaf.jpg" /></td>
   </tr>
   <tr>
      <td><img src="intelij.jpg" /></td>
      <td><img src="vscode.jpg" /></td>
      <td><img src="figma.jpg" /></td>
      <td><img src="notion.jpg" /></td>
   </tr>
</table>
   </tab>
   <tab title="Text">
    <list>
        <li>DB : Oracle</li>
        <li>Language : JAVA, JavaScript</li>
        <li>Markup Language : HTML, CSS</li>
        <li>Backend FrameWork : Spring Boot, MyBatis</li>
        <li>Frontend Library : jQeury, Thyemleaf, Sunediter</li>
        <li>IDE : IntelliJ, VScode, DA#5</li>
    </list>
   </tab>
</tabs>

## 3. 참여 및 담당

### 3-1. 프로젝트 참여 인원(6명)

1. 사용자 페이지 2명 - 허**, 홍**
2. 판매자 페이지 2명 - 유**, 여**
3. ADMIN 페이지 2명 - 김**, 정**

### 3-2. 담당 내용(판매자 영역)
<chapter title="1. 펀딩 등록 및 수정" collapsible="true">

1. 펀딩 정보 등록
2. 상세 정도 등록
3. FAQ 등록
4. 새소식 등록


</chapter>

<chapter title="펀딩 관리 페이지" collapsible="true">

1. 펀딩 취소
2. 펀딩 통계
3. 등록된 펀딩 리스트 조회 및 검색
4. Q/A 리스트 조회 및 답변

</chapter>

<chapter title="몌인 페이지 펀딩 리스트 출력" collapsible="true">

1. 카테고리별 조회
2. 오픈예정 조회
3. 오늘오픈 조회

</chapter>

## 4. 프로젝트 기획

### 4-1. 요구 사항 멩세서 Notion (일부)
![](reSpecification.jpg)


### 4-2. 회의록 -Notion (일부)
![](proceedings.jpg)

### 4-3. 프론트 스케치 - FIGMA

### 4-3-1. 판매자 파트
![](my_fimga.jpg)


### 4-3-2. 전체 내용

![](figma_full.jpg)

### 4-4. DB 모델링
![](DB.jpg)

## 5. 구현 화면

### 5-1. 판매 등록
![](01expressinfomate.jpg)

### 5-2. 판매 관리 페이지
![](02.jpg)

## 6. 인상깊은 혹은 주요 코드들

### 6-1. SQL 프로젝트 조회 쿼리문
![](code3.jpg)

### 6-2 Controller
![](code1.jpg)

![](code2.jpg)

### 6-3 Front - Javascript
![](code04.jpg)

### 6-4 프로젝트 삭제 쿼리문
![](code06.jpg)

### 6-5 Controller
![](code05.jpg)


### 6-6 프로젝트 상품 등록 쿼리문
![](code07.jpg)

### 6-7 Controller
![](code08.jpg)

![](code09.jpg)


<seealso>
   <category ref="git">
      <a href="https://github.com/i-DLE1/OSMASbySpringBoot">OSMAS</a>
   </category>
   <category ref="code">
      <a href="https://github.com/i-DLE1/OSMASbySpringBoot/blob/6addba45050a01c39bc37c697712c0121bf0f36c/src/main/resources/mybatis/mapper/seller/ProjectMapper.xml#L142-L207"> 6-1. SQL 프로젝트 조회 쿼리문</a>
      <a href="https://github.com/i-DLE1/OSMASbySpringBoot/blob/6addba45050a01c39bc37c697712c0121bf0f36c/src/main/java/com/idle/osmas/seller/controller/SaleListController.java#L54-L144">6-2. Controller</a>
      <a href="https://github.com/i-DLE1/OSMASbySpringBoot/blob/6addba45050a01c39bc37c697712c0121bf0f36c/src/main/resources/static/js/seller/projectListView.js#L139-L172">6-3. Front - Javascript</a>
      <a href="https://github.com/i-DLE1/OSMASbySpringBoot/blob/6addba45050a01c39bc37c697712c0121bf0f36c/src/main/resources/mybatis/mapper/seller/ProjectMapper.xml#L337-L352">6-4. 프로젝트 삭제 쿼리문</a>
      <a href="https://github.com/i-DLE1/OSMASbySpringBoot/blob/6addba45050a01c39bc37c697712c0121bf0f36c/src/main/java/com/idle/osmas/seller/controller/SellerController.java#L289-L318">6-5. Controller</a>
      <a href="https://github.com/i-DLE1/OSMASbySpringBoot/blob/6addba45050a01c39bc37c697712c0121bf0f36c/src/main/resources/mybatis/mapper/seller/ProductMapper.xml#L109-L129">6-6. 프로젝트 상품 등록 쿼리문</a>
      <a href="https://github.com/i-DLE1/OSMASbySpringBoot/blob/6addba45050a01c39bc37c697712c0121bf0f36c/src/main/java/com/idle/osmas/seller/controller/RegistProjectController.java#L335-L409">6-7. Controller</a>
   </category>
</seealso>
