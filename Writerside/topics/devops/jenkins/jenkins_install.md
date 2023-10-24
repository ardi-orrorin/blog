# 01. Install

## 1. Docker Version

sdfsd
<tooltip term="jenkins-master">master</tooltip>
<tooltip term="jenkins-node">node</tooltip>
<tooltip term="jenkins-agent">agent</tooltip>

### 1-1. CLI

```
docker run -d --name jenkins --restart=on-failure \
-p 8080:8080 \
-v /var/jinks_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
-e TZ=Asia/Seoul \
-u root jenkins/jenkins
```


# 2. Init
### 2-1. [http://localhost:8080](http://localhost:8080/) 접속

### 2-2 초기 비밀번호 입력
![](jenkins_initAdminPassword.jpg)

초기 비밀번호 확인
```
vi /var/jenkins_home/secrets/initialAdminPassword
```

### 2-3. 플러그인 설치
![](jenkins_setPlugin.jpg)

### 2-4. init Setting
![](jenkins_initSetting.jpg)


### 2-5. 어드민 계정 생성
![](jenkins_firstAccount.jpg)

### 2-6. Jenkins URL 설정

접속할 Jenkins URL 주소 설정

![](jenkins_jekinsUrl.jpg)

### 2-7. 젠킨스 시작
![](jenkins_jenkinsStart.jpg)


