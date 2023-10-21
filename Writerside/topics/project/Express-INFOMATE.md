# Express-INFOMATE

INFORMATE Springboot to ExpressJs Migration

## 1. INTRODUCTION
INFOMATE 프로젝트에서 Springboot 서버를 ExpressJs(NodeJS)로 마이그레이션하는 프로젝트

## 2. 목적
1. ExpressJs 학습한 내용을 기반을 실제 프로젝트 경험
2. sequalize 연관관계 구현 경험
3. ExpressJs 미들웨어 경험
4. pm2 통한 무중단 배포 경험

## 3. TECH STACK

<tabs>
    <tab title="Image">
        <table>
            <tr>
                <td><img src="nodejs.jpg" /></td>
                <td><img src="express.jpg" /></td>
                <td><img src="sequalize.jpg" /></td>
            </tr>
            <tr>
                <td><img src="oracle.jpg" /></td>
                <td><img src="webstorm.jpg" /></td>
            </tr>
        </table>
    </tab>
    <tab title="Text">
        <p>
        1. Framework : nodeJs, ExpressJs, Sequelize <br />
        2. db: Oracle <br />
        3. Language : javascript <br />
        </p>
    </tab>
</tabs>

## 4. Code Review

### 4-1. 기본 api router 구조
![](middleware.jpg)

### 4-2. JWT토큰 검증
![](verifyToken.jpg)

### 4-3. 무중단 배포를 위한 pm2 모듈 이용
![](pm.jpg)

<seealso>
    <category ref="git">
        <a href="https://github.com/yoosc89/informate_back_nodeJs">Migration ExpressJs</a>
    </category>
</seealso>