# 열거타입과 애너테이션

## 1. int 상수 대신 열거 타입을 사용하라.
- 열거 타입은 밖에서 접근 할 수 있는 생성자를 제공하지 않으므로 사실상 Final이다.
- 열거 타입 선언으로 만들어진 인스턴스들은 딱 하나씩만 존재함을 보장한다. 다시 말해 인스턴스가 통제된다(싱글턴)
- 열거 타입은 컴파일타임 타입 안전성을 제공한다.

```Java
// 열거 타입의 Obejct
public enum Planet {
    MERCURY(3.302e+23, 2.439e6),
    VENUS(4.869e+24, 6.052e6),
    EARTH(5.975e+24, 6.378e6),
    MARS(6.419e+23, 3.393e6),
    JUPITER(1.899e+27, 7.149e7),
    SATURN(5.685e+26, 6.027e7),
    URANUS(8.683e+25, 2.556e7),
    NEPTUNE(1.024e+26, 2.477e7);
    
    private final double mass; // 열거 타입은 근본적으로 불변이라 final로 선언해야 한다.
    private final double radius;
    private final double surfaceGravity;
    
    private static final double G = 6.67300E-11;
    
    Planet(double mass, double radius) {
        this.mass = mass;
        this.radius = radius;
        surfaceGravity = G * mass / (radius * radius);
    }
    
    public double mass() { return mass; }
    public double radius() { return radius; }
    public double surfaceGravity() { return surfaceGravity; }
    
    public double surfaceWeight(double mass) {
        return mass * surfaceGravity;
    }
}
```

- 위 예제 중 열거 타입 상수를 하나 제거 한다면?, 삭제한 열거 타입을 사용중인 코드에서는 컴파일 오류가 발생한다. 이는 열거 타입이 타입 안전성을 제공하기 때문이다.
- 열거 타입에 정의된 상수 개수가 영원히 고정 불변일 필요는 없다.

## 2. ordinal 메서드 대신 인스턴스 필드를 사용하라.
- ordinal 메서드는 열거 타입 상수가 선언된 순서를 반환한다.
- 상수의 순서가 바뀌면 ordinal 메서드가 반환하는 값도 바뀌기 때문에 ordinal 메서드는 사용하지 않는 것이 좋다.
- 대신 열거 타입 산수에 연결된 값을 필드에 저장하자.

```Java
public enum Ensemble {
    SOLO(1), DUET(2), TRIO(3), QUARTET(4), QUINTET(5), SEXTET(6), SEPTET(7), OCTET(8), DOUBLE_QUARTET(8), NONET(9), DECTET(10);
    
    private final int numberOfMusicians;
    
    Ensemble(int size) { this.numberOfMusicians = size; }
    public int numberOfMusicians() { return numberOfMusicians; }
}
```

## 3. 비트 필드 대신 EnumSet을 사용하라.
- 비트 필드는 열거 타입 상수의 집합을 표현할 때 사용한다.
- EnumSet 클래스는 열거 타입 상수의 집합을 효과적으로 표현할 수 있다.
- EnumSet 클래스는 Set 인터페이스를 구현하며, 열거 타입 상수의 값들을 비트 벡터로 표현한다.
- 원소가  64개 이하일 경우 EnumSet 전체를 long 변수 하나로 표현하여 비트 필드에 비견되는 성능을 보여준다.


```Java
//비트 필드란
public class Text {
    public static final int STYLE_BOLD = 1 << 0; // 1
    public static final int STYLE_ITALIC = 1 << 1; // 2
    public static final int STYLE_UNDERLINE = 1 << 2; // 4
    public static final int STYLE_STRIKETHROUGH = 1 << 3; // 8
    
    public void applyStyles(int styles) {
        // ...
    }
}
```

```Java
public class Text {
    public enum Style { BOLD, ITALIC, UNDERLINE, STRIKETHROUGH }
    
    public void applyStyles(Set<Style> styles) {
        // ...
    }
}
    
text.applyStyles(EnumSet.of(Style.BOLD, Style.ITALIC));
```

## 4. ordinal 인덱싱 대신 EnumMap을 사용하라.


## 5. 확장할 수 있는 열거 타입이 필요하면 인터페이스를 사용하라.
- 타입 안전 열거 패턴은 확장할 수 없으나 열거 타입은 그럴 수 없다.

```Java
public interface Operation {
    double apply(double x, double y);
}

public enum BasicOperation implements Operation {
    PLUS("+") {
        public double apply(double x, double y) { return x + y; }
    },
    MINUS("-") {
        public double apply(double x, double y) { return x - y; }
    },
    TIMES("*") {
        public double apply(double x, double y) { return x * y; }
    },
    DIVIDE("/") {
        public double apply(double x, double y) { return x / y; }
    };
    
    private final String symbol;
    
    BasicOperation(String symbol) { this.symbol = symbol; }
    
    @Override
    public String toString() { return symbol; }
}
```