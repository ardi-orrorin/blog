# 클래스와 인터페이스

## 1. 클래스와 멤버의 접근 권힌을 최소화하라.
 - 모든 클래스와 멤버의 접근성을 가능한 한 좁혀야 한다.
 - 접근제한자 private, package-private, protected, public을 사용하여 정보 은닉을 통해 클래스 내부 구현을 감추고 외부로부터의 오용을 막아야 한다.
 - public 클래스의 인스턴스 필드는 되도록 public이 아니여야 한다.
   - 해당 필드의 불변식을 보장할 수 없어. 다른 곳에서 필드가 수정될 수 있다.
 - 정적 필드도 마찬가지로 public이 아니여야 하지만, 예외로 추상 개념을 ㅎ완성하는데 꼭 필요한 구성요소의 상루무나ㅕ public static final 필드로 공개해도 좋다.
 - 길이가 0이 아닌 배열은 모두 변경이 가능하기 때문에, 클래스에서 public static final 배열 필드를 두지 말아야 한다.
```Java
// 보안 허점이 존재
public static final Thing[] VALUES = { ... };

// 새로운 배열을 할당하여 반환
private static final Thing[] PRIVATE_VALUES = { ... };
public static final List<Thing> VALUES = Collections.unmodifiableList(Arrays.asList(PRIVATE_VALUES));
 ```

## 2. public 클래스에서는 public 필드가 아닌 접근자 메서드를 사용하라.
- 패키지 바깥에서 접근할 수 있는 클래스라면 접근자를 제공함으로써 내부표현 방식을 언제든지 수정할 수 있는 유연성을 얻을 수 있다.
- package-private 클래스나 private 중첩 클래스라면 데이터 필드를 노출해도 괜찮다.

```Java
// public 클래스의 필드를 직접 노출하지만 불변식을 보장하는 코드
public final class Time {
    private static final int HOURS_PER_DAY = 24;
    private static final int MINUTES_PER_HOUR = 60;

    public final int hour; // final을 통해 불변을 보장해서 그나마 안전하다.
    public final int minute;

    public Time(int hour, int minute) {
        if (hour < 0 || hour >= HOURS_PER_DAY) {
            throw new IllegalArgumentException("시간: " + hour);
        }
        if (minute < 0 || minute >= MINUTES_PER_HOUR) {
            throw new IllegalArgumentException("분: " + minute);
        }
        this.hour = hour;
        this.minute = minute;
    }
}
```