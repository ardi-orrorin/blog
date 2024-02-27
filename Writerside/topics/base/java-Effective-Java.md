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