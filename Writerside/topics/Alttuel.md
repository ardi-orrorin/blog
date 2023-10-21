# Alttuel
알뜰 구매 관련 커뮤니티의 게시판을 크롤링 하여 표시해주는 사이트

## 1. 목적
1. 토이 프로젝트로 파이썬을 이용한 크롤링을 통해 이미 등록해 놓은 사이트(클리앙, 루리웹, 뽐뿌 등)의 알뜰게시판의 타이틀과 같은 축약된 정보를 DB에 적재하여 보여주는 정보 취합 사이트를 구축

2. Docker Replicas를 이용한 Nginx, Spring Boot 각 서버의 무중단 배포

## 2. Tech Stack
<tabs>
    <tab title="Image">
        <table>
           <tr>
              <td><img src="mysql.jpg" /></td>
              <td><img src="python.jpg" /></td>
              <td><img src="java.jpg" /></td>
              <td><img src="springboot.jpg" /></td>
           </tr>
           <tr>
              <td><img src="html.jpg" /></td>
              <td><img src="css.jpg" /></td>
              <td><img src="svetle.jpg" /></td>
              <td><img src="nginx.jpg" /></td>
           </tr>
           <tr>
              <td><img src="vscode.jpg" /></td>
              <td><img src="docker.jpg" /></td>
           </tr>
        </table>
    </tab>
    <tab title="Text">
        <p>
            DB : Mysql(MariaDB) <br />
            Backend : Java, Python <br />  
            Backend Framwork : SpringBoot, FASTAPI <br />  
            Frontend : HTML, Javascript, CSS <br />
            Frontend WebFramework : Svelte, Bootstrap <br />  
            Server : Nginx <br />
            Other : Docker <br />
            IDE : VScode <br />
        </p>
    </tab>
</tabs>

## 3. 구현 스크린샷
### 3-1. 메인 화면
![](01alttuel.jpg)

### 3-2. 주요 코드(크롤링) - 비동기 크롤링
![](02alttuel.jpg)

<seealso>
    <category ref="git">
        <a href="https://github.com/yoosc89/web-svlete-alttuel">Alttuel</a>
    </category>
    <category ref="code">
        <a href="https://github.com/yoosc89/web-svlete-alttuel/blob/master/crawlling/start.py">4-2. 주요 코드(크롤링) - 비동기 크롤링</a>
    </category>
</seealso>
