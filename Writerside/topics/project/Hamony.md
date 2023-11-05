# Hamony(진행중)
익명 일기 공유 사이트 프로젝트

## 1. 목적
1. scss 사용 경험
2. vueJs 사용 경험
3. Typescript 사용 경험
4. Kotlin 사용경험

## 2. Tech Stack
<tabs>
    <tab title="Image">
        <table>
           <tr>
              <td><img src="mariadb.jpg" /></td>
              <td><img src="kotlin.jpg" /></td>
              <td><img src="springboot.jpg" /></td>
           </tr>
           <tr>
              <td><img src="sass.jpg" /></td>
              <td><img src="vue.jpg" /></td>
              <td><img src="typescript.jpg" /></td>
           </tr>
           <tr>
              <td><img src="intelij.jpg" /></td>
           </tr>
        </table>
    </tab>
    <tab title="text">
        <list>
            <li>DB: MariaDB</li>
            <li>Language: Kotlin, Typescript</li>
            <li>Framwork : Springboot, Sass, Vue</li>
            <li>IDE: IntelliJ</li>
        </list>
    </tab>
</tabs>

## 3. 프로젝트 기획

### 3-1. 모델링
<img src="hamonyERD.jpg" thumbnail="true"/>


## 4. 구현 화면
<table>
<tr>
<td colspan="2">1. 글쓰기 페이지</td>
</tr>
<tr>
<td><img src="hamonywrite1.jpg" thumbnail="true" /></td>
<td><img src="hamonywrite2.jpg" thumbnail="true" /></td>
</tr>
</table>

## 5. 코드 리뷰
### 5-1. 이미지 썸네일 처리

리사이즈를 할 이미지의와 썸네일 스케일을 확인하기 위한 속성 추가

<code-block lang="kotlin" src="/hamony/ResizeImage.kt" include-lines="3-7"/>

리사이즈를 할 이미지 파일 로드

<code-block lang="kotlin" src="/hamony/ResizeImage.kt" include-lines="9-12"/>

가로 세로 비율을 유지 하기 위해 줄일 스케일 계산

<code-block lang="kotlin" src="/hamony/ResizeImage.kt" include-lines="17-45"/>

축소할 기준이 될 enum 객체

<code-block lang="kotlin" src="/hamony/Resize.kt"/>

바이트 배열로 리턴

<code-block lang="kotlin" src="/hamony/ResizeImage.kt" include-lines="47-54"/>

썸네일 이미지를 만드는 코드  
버퍼에 썸네일로할 빈 이미지 생성 -> 원본 이미지를 리사이즈 -> 썸네일 이미지를 버퍼에 쓰기

<code-block lang="kotlin" src="/hamony/ResizeImage.kt" include-lines="67-91"/>


컨트롤러

<code-block lang="kotlin" src="/hamony/FileController.kt" include-lines="66-97"/>





<seealso>
    <category ref="erdcloud">
        <a href="https://www.erdcloud.com/d/FBcpwDQxviNr93FA4">ERD Cloud</a>
    </category>
    <category ref="git">
        <a href="https://github.com/yoosc89/hamony">Hamony</a>
    </category>
</seealso>