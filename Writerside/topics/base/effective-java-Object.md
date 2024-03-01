# 객체 메서드 재정의

## 1. equals는 일반 규약을 지켜 재정의 하라
- equals 메서드를 재정의할 때는 반드시 일반 규약을 따라야 한다.
- 반사성, 대칭성, 추이성, 일관성, null-아님을 지켜야 한다.
    - 반사성(reflexivity) : null이 아닌 모드 참조 값 x에 대해, x.equals(x)는 true이다.
    - 대칭성(symmetric) : null이 아닌 모든 참조 값 x, y에 대해, x.equals(y)가 true이면 y.equals(x)
    - 추이성(transitivity) : null이 아닌 모든 참조 값 x, y, z에 대해, x.equals(y)가 true이고 y.equals(z)가 true이면 x.equals(z)가 true이다.
    - 일관성(consistency) : null이 아닌 모든 참조 값 x, y에 대해, x.equals(y)를 반복해서 호출하면 항상 true이거나 항상 false이다.
    - null-아님(non-nullity) : null이 아닌 모든 참조 값 x에 대해, x.equals(null)은 false이다.
- 클래스가 private이거나 package-private이고 equals 메서드를 호출할 일이 없다면rh equals 메서드를 호출할 일이 없다면,

```Java
// equals를 사용하면 강제로 오류를 내서 사용하지 못하도록 한다.
@Override public boolean equals(Object o) {
  throw new AssertionError(); // 호출되면 안됨
}
```
- equals 구현 방법
    - == 연산자를 사용해 입력이 자기 자신의 참조인지 확인한다.
    - instanceof 연산자를 사용해 입력이 올바른 타입인지 확인한다.
    - 입력을 올바른 타입으로 형변환한다. (instanceof 연산자를 통해 확인 했으니 안전하다.)
    - 입력 개체와 자기 자신의 대응되는 '핵심' 필드들이 모두 일치하는지 하나씩 검사한다. (모두 같아야 하머 하나라도 다르면 false를 반환한다.)
    - 다만, == 연산자로 비교시 double이나 float는 Float.compare나 Double.compare를 사용하기 때문에 유의해서 비교해야 한다.
    - double이나 float을 특별 취급하는 이유는 Float.NaN, -0.0f, 특수한 부동소수값을 다뤄야 하기 때문이다.
    - 때론 null도 정상 값으로 취급하는 참조 타입 필드도 존재하니 Object.equals(Object, Object)로 비교해 NullPointerException을 방지한다.
    - equals 메서드를 재정의할 때는 hashCode 메서드도 반드시 재정의 해야 한다. (중요!)
    - Object외의 타입을 매개변수로 사용하지 않는다.
    - Google의 AutoValue 프레임워크를 사용하면 equals, hashCode 메서드를 자동으로 생성할 수 있다.


## 2. equals를 재정의하려거든 hasCode도 재정의하라
- Object 규약 명세서
    - equals 비교에 사용되는 정보가 변경되지 않았다면, hasCode 메서드를 몇 번을 호출해도 일관관계를 반환해야 한다.
    - equals(Object)가 두 객체를 같다고 판단했다면, 두 객체의 hasCode는 같아야 한다.
    - equals(Object)가 두 객체를 다르다고 판단했더라도, 두 객체의 hashCode가 서로 다른 값을 반환할 필요는 없다.
    - 단, 다른 객체에 대해서는 다른 값을 반환해야 해시테이블의 성능이 좋아진다.

- hasCode 잘 못 구현할 경우
  example
```Java
Map<PhoneNumber, String> m = new HashMap<>();
m.put(new PhoneNumber(707, 867, 5309), "제니");

m.get(new PhoneNumber(707, 867, 5309)); // null
```

- hasCode를 작성하는 요령
    - 가급적 범위는 32비트 정수 범위에서 균일하게 분배되어야 한다.
      example
```Java
// 잘못된 예
@Override public int hashCode() { return 32; }

// 올바른 예
@Override public int hashCode() {
  int result = Short.hashCode(areaCode);
  result = 31 * result + Short.hashCode(prefix);
  result = 31 * result + Short.hashCode(lineNum);
  return result;
}

// Objects.hash를 사용한 예
@Override public int hashCode() {
  return Objects.hash(lineNum, prefix, areaCode);
}

// 지연 초기화를 이용
private int hashCode; // 자동으로 0으로 초기화 된다.
@Override public int hashCode() {
  int result = hashCode;
  if (result == 0) {
    result = Short.hashCode(areaCode);
    result = 31 * result + Short.hashCode(prefix);
    result = 31 * result + Short.hashCode(lineNum);
    hashCode = result;
  }
  return result;
}
```
- hashCode가 반환하는 값의 생성 규칙을 API사용장게 자세히 공표하지 말아야한다.
- 그래야 클라이언트가 이 값에 의지 하지않게 되고, 추후에 계산 방식을 바꿀 수 도 있다.

