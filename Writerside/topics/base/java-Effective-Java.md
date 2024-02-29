# EffectiveJava

## Overview
Java를 사용할 때 효율적이고 안전한 코드를 작성하기 위한 가이드라인을 정리한 문서이다.

## 1. 생성자 대신 정적 팩토리 메서드를 고려하라.
- 여기서 말하는 팩토리 메서드는 디자인 패턴에서 팩토리 메서드가 아니다.
- 장점
  - 이름을 가질 수 있다.
  - 호출할 때마다 인스턴스를 새로 생성하지 않아도 된다.
  - 반환 타입의 하위 타입 객체를 반환할 수 있다.
  - 입력 매개변수에 다라 매번 다른 클래스의 객체를 반환 할 수 있다.
  - 정적 패터리 메서드를 작성하는 시멎에는 반환할 객체의 클래스가 존재 하지 않아도 된다.
- 단점
  - 상속을 하려면 public이나 protected 생성자가 필요하다.
  - 정적 팩토리 메서드만 제공하면 하위 클래스를 만들 수 없다.
  - 정적 팩토리 메서드는 프로그래머가 찾기 어렵다.


```java
public static Boolean valueOf(boolean b) {
    return b ? Boolean.TRUE : Boolean.FALSE;
}
```

## 2. 생성자에 매개변수가 많다면 빌더를 고려하라.
1. 점층적 생성자 패턴을 사용하면 매개변수가 많아지면 클라이언트 코드를 작성하거나 읽기 어려워진다.
2. 자바빈즈 패턴은 객체 하나를 만들려면 메서드를 여러개 호출해야 하고, 객체가 완성되기 전까지 일관성이 무너진 상태에 놓이게 된다.
3. 빌더 패턴은 점층적 생성자 패턴의 안정성과 자바빈즈 패턴의 가독성을 겸비했다.
4. 빌더 패턴은 계층적으로 설계된 클래스와 함께 쓰기에 좋다.
5. 빌더 패턴은 불변으로 만들 수 있다.
6. 매개변수가 많지 않다면 오히려 코드가 더 길어지고 생성 비용이 더 비싸질 수 있다.

```Java
//자바 빈즈 패턴
public class NutritionFacts {
    private int servingSize;
    private int servings;
    private int calories;
    private int fat;
    private int sodium;
    private int carbohydrate;

    public NutritionFacts() {}

    public void setServingSize(int servingSize) {
        this.servingSize = servingSize;
    }

    public void setServings(int servings) {
        this.servings = servings;
    }

    public void setCalories(int calories) {
        this.calories = calories;
    }

    public void setFat(int fat) {
        this.fat = fat;
    }

    public void setSodium(int sodium) {
        this.sodium = sodium;
    }

    public void setCarbohydrate(int carbohydrate) {
        this.carbohydrate = carbohydrate;
    }
}
```

```Java
//빌더 패턴
public class NutritionFacts {
    private final int servingSize;
    private final int servings;
    private final int calories;
    private final int fat;
    private final int sodium;
    private final int carbohydrate;

    public static class Builder {
        //필수 매개변수
        private final int servingSize;
        private final int servings;

        //선택 매개변수 - 기본값으로 초기화
        private int calories = 0;
        private int fat = 0;
        private int sodium = 0;
        private int carbohydrate = 0;

        public Builder(int servingSize, int servings) {
            this.servingSize = servingSize;
            this.servings = servings;
        }

        public Builder calories(int val) {
            calories = val;
            return this;
        }

        public Builder fat(int val) {
            fat = val;
            return this;
        }

        public Builder sodium(int val) {
            sodium = val;
            return this;
        }

        public Builder carbohydrate(int val) {
            carbohydrate = val;
            return this;
        }

        public NutritionFacts build() {
            return new NutritionFacts(this);
        }
    }

    private NutritionFacts(Builder builder) {
        servingSize = builder.servingSize;
        servings = builder.servings;
        calories = builder.calories;
        fat = builder.fat;
        sodium = builder.sodium;
        carbohydrate = builder.carbohydrate;
    }
}

```

## 3. private 생성자나 열거 타입으로 싱글턴임을 보증하라.
1. 싱글턴 패턴이란 인스턴스를 오직 하나만 생성할 수 있는 클래스를 말한다.
2. 싱글턴을 만드는 방법은 두가지가 있다.
   - public static final 필드 방식
   - 정적 팩토리 방식

3. public static final 필드 방식
```Java
public class Elvis {
  public static final Elvis INSTANCE = new Elvis();
  private Elvis() {}
}
 ```
- 단점
  - 만들어진 인스턴스가 전체 시스템에서 하나뿐임이 보장되지 않는다.
  - accessibleObject.setAccessible을 사용하면 private 생성자를 호출할 수 있다.
  - 리플렉션을 통해 private 생성자를 호출할 수 있다.
  
> 리플렉션이란, 구체적인 클래스 타입을 알지 못하더라고 그 클래스의 메서드, 타입, 변수들에 접근 할 수 있도록 해주는 자바 API,  
> 주로 Spring프레밍워크의 어노테이션 같은 기능들이 리플렉션을 이용하여 실행 도중 동적으로 클래스의 정보를 가져와서 사용한다.


4. 정적 팩토리 방식
```Java
public class Elvis {
  private static final Elvis INSTANCE = new Elvis();
  private Elvis() {}
  public static Elvis getInstance() { return INSTANCE; }
}
```
- getInstance 메서드를 호출할 때마다 같은 객체를 반환하므로 싱글턴이 보장된다.
- 메서드를 통해 명시적으로 싱글턴입을 알 수 있다.
- 개발자에 따라 마음만 먹으면 싱글턴이 아니게도 쉽게 수정 할 수 있다.

5. 열거 타입 방식
```Java
public enum Elvis {
  INSTANCE;
  public void leaveTheBuilding() { ... }
}
```
- public 필드 방식과 비슷하지만 더 간결하고, 추가 노력 없이 직렬화 할 수 있다.
- 싱글턴을 만드는 방법 중 가장 좋은 방법이다.
- 하지만 만들려는 싱글턴이 Enum 외의 클래스를 상속해야 한다면 이 방법은 사용할 수 없다.

## 4. 인스턴스화를 막으려거든 private 생성자를 사용하라
- 추상 클래스로 만드는 것은 인스턴스화를 막을 수 없다.
- 하위 클래스를 만들어서 인스턴스화하면 그만이기 때문이다.
- 컴파일러가 기본 생성자를 만드는 경우는 오직 명시된 생성자가 없을 때분이니 private 생성자를 추가하면 클래스의 인스턴스화를 막을 수 있다.
- 명시적 생성자가 private이니 클래스 바깥에서 접근할 수 없다.
- 꼭 AssertionError 에러를 던질 필요는 없지만, 클래스 안에서 실수로라도 생성자를 호출하지 않도록 해준다.

```Java
public class UtilityClass {
  private UtilityClass() { //기본 생성자가 만들어지는 것을 막는다.
    throw new AssertionError();
  }
}  
```

## 5. 자원을 직접 명시하지 말고 의존 객체 주입을 사용하라
- 의존 객체 주입이란 클래스가 사용하는 자원을 직접 만들어 사용하는 것이 아니라 외부에서 주입받는 것을 말한다.
- 의존 객체 주입은 클래스의 유연성, 재사용성, 테스트 용이성을 높여준다.
- 의존 객체 주입은 생성자, 정적 팩터리, 빌더 모두에 응용할 수 있다.
- 팰토리 메서드 패턴의 경우 하위 클래스에서 구현체를 제공할 수 있다.

```Java
public class SpellChecker {
  private final Lexicon dictionary;
  public SpellChecker(Lexicon dictionary) {
    this.dictionary = Objects.requireNonNull(dictionary);
  }
  public boolean isValid(String word) { ... }
  public List<String> suggestions(String typo) { ... }
}
```

## 6. 불필요한 객체 생성을 피하라.
- 똑같은 기능의 객체를 매번 생성하기보다는 객체 하나를 재사용 하는 편이 나을 때가 많다.

Example
```Java
// 내부에서 만드는 Pattern 객체는 한 번 사용후 CG가 되어버려서 성능이 낭비가 된다.
static boolean isRomanNumeral(String s) {
  return s.matches("^(?=.)M*(C[MD]|D?C{0,3})"
      + "(X[CL]|L?X{0,3})(I[XV]|V?I{0,3})$");
   
   
// Pattern 객체를 클래스 초기화 과정에서 직접 생성해 캐싱해두고 나중에 사용할 때마다 재사용한다.   
public class RomanNumerals {
  private static final Pattern ROMAN = Pattern.compile(
      "^(?=.)M*(C[MD]|D?C{0,3})"
      + "(X[CL]|L?X{0,3})(I[XV]|V?I{0,3})$");
  static boolean isRomanNumeral(String s) {
    return ROMAN.matcher(s).matches();
  }
}
```

## 7. 다 쓴 객체 참조를 해제하라
- 배열 및 리스트의 원소를 다 쓴 뒤라도 GC 에서 자원이 회수하지 않는다.
- 이러한 객체를 참조하고 있는 객체들도 GC가 회수하지 않는다.
- 해당 참조를 다 썻다면 null 처리하여 GC가 회수할 수 있도록 해야한다.
- null 처리는 예외적인 경우여야하고, 가급전 scope 밖으로 밀어내는 것이 좋다.
- WeakHashMap을 사용하여 키가 가비지 컬렉션 될 때마다 자동으로 제거되는 맵을 만들 수 있다.

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
    if (size == 0)
      throw new EmptyStackException();
    return elements[--size]; // 배열의 사이즈는 줄어 들지만 참조된 객체들은 GC가 되지않아 메모리 누수가 발생한다.
  }
  /**
   * 원소를 위한 공간을 적어도 하나 이상 확보한다.
   * 배열 크기를 늘려야 할 때마다 대략 두 배씩 늘린다.
   */
  private void ensureCapacity() {
    if (elements.length == size)
      elements = Arrays.copyOf(elements, 2 * size + 1);
  }
} 
```

## 8. finalizer와 cleaner 사용을 피하라


## 9. try-with-resources를 사용하라
- 자바 라이브러리에는 close 메서드를 호출해 직접 닫아줘야 하는 자원이 많다.
- try-finally로 자원을 닫아주는 것은 불편하고, 중첩되는 경우 finally 하위 블록에는 예외처리가 생략되어 close되지 않을 가능성이 있다. 
- try-with-resources를 사용할 수 있는데, 사용하기 위해서는 해당 자원이 AutoCloseable 인터페이스를 구현해야 한다.
- try-with-resources를 사용하면 자원을 명시적으로 닫아주지 않아도 된다.

```Java
// try-finally를 사용한 자원 닫기
static String firstLineOfFile(String path) throws IOException {
  BufferedReader br = new BufferedReader(new FileReader(path));
    try {
        return br.readLine();
    } finally {
      br.close();
    }
}

// try-with-resources를 사용한 자원 닫기
static String firstLineOfFile(String path) throws IOException {
  try (
    BufferedReader br = new BufferedReader(new FileReader(path))
  ) {
    return br.readLine();
  }
}
```



