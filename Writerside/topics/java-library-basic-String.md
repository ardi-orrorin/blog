# String


## Overview



## StringTokenizer
문자열을  " "(띄어쓰기) 및 구분자(delim) 한 가지만 설정하여 문자열을을 분리하는 클래스이다.
나눠진 문자열은 토큰(Token)이라고 부른다.

구분자를 지정하지 않으면 기본값으로 (" ", "\t", "\n", "\r")을 사용한다.

util 패키지에 있는 클래스이다.

```Java
// 구분자를 " "로 설정하여 문자열을 분리하는 예
String str = "1 2 3 4 5";
StringTokenizer st = new StringTokenizer(str); // " " 기준으로 토큰을 나눈다.

int count = st.countTokens(); // 토크의 개수
System.out.println(count);// 5

while (st.hasMoreTokens()) { // 토큰이 있는지 확인
    System.out.println(st.nextToken()); // 토큰 출력
}
```

```Java
// 구분자를 사용할 경우
String str2 = "1*2-3+4=5";
StringTokenizer st2 = new StringTokenizer(str2, "*-+=/");
while (st2.hasMoreTokens()) {
    System.out.println(st2.nextToken());
}
```
 

## split()
문자열을 정규식을 이용하여 분리하는 메소드이다.
String 클래스의 메소드 중 하나이다.


```Java
String str = "1 2 3 4 5";
String[] arr = str.split(" "); // 정규식을 이용한 문자열 나누기
for (int i = 0; i < arr.length; i++) {
    System.out.println(arr[i]);
}
// 1
// 2
// 3
// 4
// 5
```

```Java
String str3 = "010-1234-5678홍길동 테스트";
String[] arr2 = str3.split(" |-");
for (String s : arr2) {
    System.out.println(s);
}
// 010
// 1234
// 5678홍길동
// 테스트
```


## StringTokenizer vs split()
 - StringTokenizer는 구분자를 하나만 사용할 수 있고, split()은 정규식을 이용하여 구분자를 여러개 사용할 수 있다.
 - StringTokenizer는 util 패키지의 클래스 중 하나이고, split()은 String 클래스의 메소드이다.
 - StringTokenizer는 구분자가 중첩되어 있을 경우, 이를 구분하기 위해 n +1개의 반복문을 사용해서 토큰을 생성하므로, 구분자가 여러개일 경우 split()을 사용하는 것이 좋다.



