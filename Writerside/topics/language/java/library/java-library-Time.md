# Time

## Overview
Duration은 시간의 길이를 나타내는 클래스이다.




## 1. Duration

### 1-1. import
```Java
import java.time.Duration;
```

### 1-2. Duration 생성

```Java
```
{src="Language/java/library/time/App001.java" include-lines="8-14"}

### 1-3. getXXX() 메소드
```Java
```
{src="Language/java/library/time/App001.java" include-lines="16-26"}

## 1-2. plusXXX() 메소드
```Java
```
{src="Language/java/library/time/App001.java" include-lines="32-39"}


## 1-4. minusXXX() 메소드
```Java
```
{src="Language/java/library/time/App001.java" include-lines="42-43"}


## 2. Between 날짜 차이 구하기

### 2-1. import
```Java
```
{src="Language/java/library/time/App002.java" include-lines="1-5"}

```Java
```
{src="Language/java/library/time/App002.java" include-lines="14-15"}

### 2-2. Duration.between()
두 날짜를 시간 기준으로, 나노초로 계산하여 초 단위로 변환한다.
```Java
```
{src="Language/java/library/time/App002.java" include-lines="16-17"}


### 2-3. Period.between()
두 날짜를 날짜 기준으로 년, 월 ,일로 계산한다.

```Java
```
{src="Language/java/library/time/App002.java" include-lines="22-23"}


### 2-4. ChronoUnit.between()
두 날짜를 원하는 단위로 계산한다.

```Java
```
{src="Language/java/library/time/App002.java" include-lines="28-35"}




