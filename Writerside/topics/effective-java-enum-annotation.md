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