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

## 3. toString을 항상 재정의하라.
- 실전에서는 toString은 그 객체가 가진 주요 정보를 모두 반환하는 것이 좋다.
- 포맷을 명시하든 아니든 의도를 명확히 밝혀야 한다.
- 포맷 명시 여부와 상관없이 toString 반환한 값에 포함된 정보를 얻어올 수 있는 API를 제공하는 것이 좋다.

## 4. clone 재정의는 주의해서 진행하라.
- Cloneable은 복제해도 되는 클래스임을 명시하는 용도의 믹스인 인터페이스이다.

> Mixin : 클래스가 다른 클래스의 부분을 재사용하는 방법 중 하나로, 다중 상속을 지원하지 않는 언어에서 클래스에 다른 클래스의 기능을 추가하기 위한 방법이다.

- Clone 메서드의 규약사항
  - x.clone() != x
  - x.clone().getClass() == x.getClass() // 항상 만족해야 하는 조건은 아니다.
  - x.clone().equals(x)
  - 관례상 반환된 객체와 원본 객체는 독립적이어야한다. super.clone을 오더은 객체의 필드 중 하나 이상의을 반환하기 전에 수정해야 할 수도 있다.

```Java
@Override public PhoneNumber clone() {
  try {
    return (PhoneNumber) super.clone();
  } catch (CloneNotSupportedException e) {
    throw new AssertionError(); // 일어날 수 없는 일이다.
  }
}
```

Example
```Java
public class Stack {
  private Object[] elements;
  private int size = 0;
  private static final int DEFAULT_INITIAL_CAPACITY = 16;

  public Stack() {
    elements = new Object[DEFAULT_INITIAL_CAPACITY];
  }

  public void push(Object e) {
    ensureCapacity();
    elements[size++] = e;
  }

  public Object pop() {
    if (size == 0) {
      throw new EmptyStackException();
    }
    Object result = elements[--size];
    elements[size] = null; // 다 쓴 참조 해제
    return result;
  }

  // 원소를 위한 공간을 적어도 하나 이상 확보한다.
  private void ensureCapacity() {
    if (elements.length == size) {
      elements = Arrays.copyOf(elements, 2 * size + 1);
    }
  }

  // clone 메서드를 사용하여 복제한다.
  @Override public Stack clone() {
    try {
      Stack result = (Stack) super.clone();
      result.elements = elements.clone();
      return result;
    } catch (CloneNotSupportedException e) {
      throw new AssertionError();
    }
  }
}
```

- clone 메서드는 생성자와 같은 효과를 낸다.
- 그러므로 본 객체에 아무런 영향이 없어야 하는 불변식을 보장해야 한다.

## 5. Comparable을 구현할지 고려하라.
- compareTo 메서드 규약사항
  - 주어진 객체보다 작으면 음의 정수, 크면 양의 정수를 반환한다.
  - 비교할 수 없는 타입의 객체가 주입되면 ClassCastException을 던진다.
  - sgn(x.compareTo(y) == -sgn(y.compareTo(x))를 만족해야 한다.
  - 추이성을 보장해야한다. (x.compareTo(y) > 0 && y.compareTo(z) > 0 이면 x.compareTo(z) > 0)
  - Comparable을 구현한 클래스는 모든 z에 대해 x.compareTo(y) == 0 이면 x.equals(y)이다.
  - (x.compareTo(y) == 0) == (x.equals(y)) 이여야 하지만 꼭 지켜야하는 필수사항은 아니다.
  - 주의: 이 클래스의 순서는 equals 메서드와 일관되지 않는다.
- 컬렉션을 구현한 인터페이스(Collection, Set, List, Map, Queue, Deque)는 equals의 규약을 따른다고 되어있지만, 정렬된 컬렉션은 동치성을 비교할 때 CompareTo를 사용하기 때문에 주의해야 한다.
- 