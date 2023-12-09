# 01. Variable

## 1. 변수의 선언
- 변수명=값 의 형식을 갖는다.
- 대입 연산자는 =를 사용한다.
- 대입 연산자 사이에 띄어쓰기를 사용할 수 없다.
- 타입 형식은 존재 하지 않는다.
- 변수명 대소문자를 구분한다.

```Shell
```
{src="/Language/shellScript/var.sh" include-lines="5-8"}

```Shell
```
{src="/Language/shellScript/var.sh" include-lines="10-11"}


### 변수 사용 방법
- $변수명을 통해 사용가능
- ${변수명} 사용가능

```Shell
```
{src="/Language/shellScript/var.sh" include-lines="13-17"}

### 변수 배열

```Shell
```
{src="/Language/shellScript/var.sh" include-lines="20"}

- 사용시 ${변수} 으로 사용해야 한다.
```Shell
```
{src="/Language/shellScript/var.sh" include-lines="22-28"}

### 변수의값과 text을 같이 표시할 경우

```Shell
```
{src="/Language/shellScript/var.sh" include-lines="32-33"}


### 명령의 실행 결과를 변수에 담을 때 \`명령어` 감싼다.
```Shell
```
{src="/Language/shellScript/var.sh" include-lines="37-40"}

### 명령의 실행 결과는 $(명령어)로도 사용가능
```Shell
```
{src="/Language/shellScript/var.sh" include-lines="44-47"}

## 2. 특수 변수 참조

- null 값 이란 var="" or var=빈값 상태를 의미한다.
- $\{var=text} : 변수 var의 사용하지 않은 경우만 text라는 문자열을 대입 후 반환한다.
```Shell
```
{src="/Language/shellScript/var.sh" include-lines="54-58"}

- $\{var:=text} var 미사용 혹은 null의 경우에만 text를 대입 후 반환한다.
```Shell
```
{src="/Language/shellScript/var.sh" include-lines="61-66"}
- =와 차이점은 -는 대입하지 않고 대체 값을 반환한다는 것이다.

- $\{var-text} var 사용하지 않은 경우만 text라는 문자열을 반환한다.
```Shell
```
{src="/Language/shellScript/var.sh" include-lines="70-75"}

- $\{var:-text} var 사용하거나 null 경우만 text라는 문자열을 반환한다.
```Shell
```
{src="/Language/shellScript/var.sh" include-lines="79-83"}

- $\{var+text} var null값도 포함해서 이미 사용된 경우만 text라는 문자열을 반환한다.
```Shell
```
{src="/Language/shellScript/var.sh" include-lines="87-91"}

- $\{var:+text} var null값이외에 이미 사용된 경우만 text라는 문자열을 반환한다.
```Shell
```
{src="/Language/shellScript/var.sh" include-lines="94-99"}

- eval 변수의 값을 변수의 이름으로 하는 키워드로 치환한다.
```Shell
```
{src="/Language/shellScript/var.sh" include-lines="103-107"}

- unset var 변수 제거 키워드
```Shell
```
{src="/Language/shellScript/var.sh" include-lines="112-114"}

- readonly 변수를 읽기 전용으로 설정
```Shell
```
{src="/Language/shellScript/var.sh" include-lines="117-119"}