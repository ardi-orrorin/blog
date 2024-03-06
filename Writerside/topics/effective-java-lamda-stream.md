# 람다와스트림

## 1. 익명 클래스보다 람다를 사용하라.
- 타입을 명시해야 코드가 더 명확할 때문 제외하고는, 람다의 모든 매개변수 타입은 생략하자.
- 람다는 이름이 없고 문서화도 못 한다. 따라서 코드 자체로 동작이 명확히 설명되지 않거나 코드 줄 수가 많아지면 람다를 쓰지 말아야 한다.
- 람다를 직렬화하는 일은 삼가야 한다.(익명 클래스도 마찬가지)

```Java
// 익명 클래스
Collection.sort(words, new Comparator<String>() {
    public int compare(String s1, String s2) {
        return Integer.compare(s1.length(), s2.length());
    }
});

// 람다 사용
Collections.sort(words, (s1, s2) -> Integer.compare(s1.length(), s2.length()));

// 축약
Collections.sort(words, comparingInt(String::length));

// 자바 8 List인터페이스에 추가된 sort 이용
words.sort(comparingInt(String::length));

// 열거형 상수
public enum Operation {
    PLUS("+", (x, y) -> x + y),
    MINUS("-", (x, y) -> x - y),
    TIMES("*", (x, y) -> x * y),
    DIVIDE("/", (x, y) -> x / y);
}
```

## 2. 람다보다는 메서드 참조를 사용하라.
- 메서드 참조는 람다보다 간결하고 명확하다.
- 메서드 참조는 재사용성이 높고 가독성이 좋다.
- 무조건 메서드 참조가 좋다고는 할 수 없다.
- 람다로 할 수 없는 일이라면 메서드 참조를 사용할 수 없다.(예외 존재)
- 람다로는 불가능하지만 메서드 참조로는 가능한 유일한 예는 제네릭 함수 타입 구현이다.


```Java
// 람다
map.merge(key, 1, (count, incr) -> count + incr);

// 메서드 참조
map.merge(key, 1, Integer::sum);

// 메서드 참조
service.execute(GoshThisClassNameIsHumongous::action);

// 람다
service.execute(() -> action());

// 제네릭 함수 구현
Function<String, Integer> stringToInteger = Integer::parseInt;

```

- Example Table

| 메서드 참조 유형 | 예 | 람다 |
| --- | --- | --- |
| 정적 | Integer::parseInt | str -> Integer.parseInt(str) |
| 한정적(인스턴스) | Instant.now()::isAfter | Instant then = Instant.now(); t -> then.isAfter(t) |
| 비한정적(인스턴스) | String::toLowerCase | str -> str.toLowerCase() |
| 클래스 생성자 | TreeMap<K,V>::new | () -> new TreeMap<K,V>() |
| 배열 생성자 | int[]::new | len -> new int\[len] |


