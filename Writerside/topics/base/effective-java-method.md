# 메서드

## 1. 매개변수가 유효한지 검사한다.
- 인덱스 값은 음수이면 안 되며, 객체 참조는 null이 아니여야한다.
- 매개변수 유효성 검사는 메서드 본문이 실행되기 전에 수행되어야 한다.
- 자바 7부터는 Objects.requireNonNull 메서드를 사용하여 null 검사를 수행하자.
- private인 경우 assert를 사용하여 매개변수 유효성을 검사할 수 있다.

```Java
// 매개변수 유효성 검사
public void setAge(int age) {
    if (age < 0) {
        throw new IllegalArgumentException("나이는 음수일 수 없습니다.");
    }
    this.age = age;
}

// 자바 7 이상
public void setAge(int age) {
    this.age = Objects.requireNonNull(age, "나이는 null일 수 없습니다.");
}

// private 메서드에서 매개변수 유효성 검사
private void checkAge(int age) {
    assert age >= 0 && age <= 100;
}
```

## 2. 적시에 방어적 복사본(Deep Copy)을 만들라.
- 클라이언트가 여러분의 불볕식을 깨뜨리려 혈안이 되어 있다고 가정하고 방어적으로 프로그래밍해야 한다.
- 생성자에게 받은 가변 매개변수 각각을 방어적으로 복사(defensive copy)해야 한다.
- 매개변수의 유효성을 검사하기 전에 방어적 복사본을 만들고, 이 복사본으로 유효성을 검사한다.
    - 멀티스레딩 환경이라면 원본 객체의 유효성을 검사한 후, 복사본을 만드는 시점에 다른 스레드가 원본 객체를 수정할 수 있으므로 방어적 복사본을 만들어야 한다.
    - 이러한 공격을 검사시점/사용시점(time-of-check/time-of-use) 공격이라고 한다.
- 매개변수가 제3자에 의해 확장될 수 있는 타입이라면 방어적 복사본을 만들 때 clone을 사용해서는 안된다.
- 클래스가 클라이언트로부터 받는 혹은 클라이언트로 반환하는 구성요소가 가변이라면 그 요소는 반드시 방어적으로 복사해야한다.

```Java
// 방어적 복사
public Date start() {
    return new Date(start.getTime());
}
public Date end() {
    return new Date(end.getTime());
}
public Period(Date start, Date end) {
    this.start = new Date(start.getTime());
    this.end = new Date(end.getTime());
    
    if (this.start.compareTo(this.end) > 0) {
        throw new IllegalArgumentException(start + "가 " + end + "보다 늦다.");
    }
}
```

## 3. 메서드 시그니처를 신중히 설계하라.
- 메서드 이름을 신중하게 짓자.
- 편의 메서드를 너무 많이 만들지 말자.
- 매개변수 목록은 짧게 유지하자.
  - 4개 이하가 좋다. 4개를 넘어가면 사용하기 어려워진다.
  - 같은 타입의 매개변수가 연달아 나오는 경우 특히 주의하자.
    - 이런 경우 매개변수를 묶어주는 클래스를 만들어 사용하자.
    - 메서드로 더 잘게 쪼개서 사용하는 방법도 있다.
  - 매개변수의 타입이나 순서가 바뀌면 다른 메서드로 인식되므로 주의하자.
- 매개변수의 타입으로는 클래스보다 인터페이스가 더 낫다.
  - 인터페이스를 사용하면 클라이언트는 여러 구현체를 사용할 수 있다.
- boolean보다는 원소 2개짜리 열거 타입이 낫다.
  - boolean을 사용하면 메서드가 어떤 동작을 하는지 알기 어렵다.
  - 열거 타입을 사용하면 메서드가 어떤 동작을 하는지 알기 쉽다.

## 4. 다중 정의는 신중히 사용하라.

```Java
// Example
public class CollectionClassifier {
    public static String classify(Set<?> s) {
        return "집합";
    }
    public static String classify(List<?> lst) {
        return "리스트";
    }
    public static String classify(Collection<?> c) {
        return "그 외";
    }
    
    public static void main(String[] args) {
        Collection<?>[] collections = {
            new HashSet<String>(),
            new ArrayList<BigInteger>(),
            new HashMap<String, String>().values()
        };
        
        for (Collection<?> c : collections) {
            System.out.println(classify(c));
        }
    }
}

// 해결 방안
public static String classify(Collection<?> c) {
    return c instanceof Set ? "집합" :
           c instanceof List ? "리스트" : "그 외";
}

```
- 위 코드는 모두 "그 외"를 출력한다.
- classify 중 어느 메서드를 호출할지는 컴파일 타임에 정해지기 때문이다.
- for문 안에 c는 항상 Collection\<?> 타입이므로 classify(Collection<?>) 메서드가 호출된다.
- 재정한 메서드는 동적으로 선택되고, 다중정의한 메서드는 정적으로 선택되기 때문이다.
- 다중 정의가 혼동을 일으키는 상황을 피해야한다.
- 안전하고 보수적으로 가려면 매개변수 수가 같은 다중정의는 만들지 말자
- 다중 정의하는 대신 메서드 이름을 다르게 지어주는 길도 열려있다.

## 5. 가변인수(Varargs)는 신중히 사용하라.

```Java
// 가변인수 활용 예
public static int min(int... args) {
    int sum = 0;
    for (int arg : args) {
        sum += arg;
    }
}

// 에러 처리
static int min(int... args) {
    if (args.length == 0) {
        // 오류가 날 경우 컴파일 에러가 아닌 런타임 에러가 발생한다.
        throw new IllegalArgumentException("인수가 1개 이상 필요합니다.");
    }
    int min = args[0];
    for (int i = 1; i < args.length; i++) {
        if (args[i] < min) {
            min = args[i];
        }
    }
    return min;
}

// 추천 방법
static int min(int firstArg, int... remainingArgs) {
    int min = firstArg;
    for (int arg : remainingArgs) {
        if (arg < min) {
            min = arg;
        }
    }
    return min;
}
```

## 6. null이 아닌, 빈 배열이나 컬렉션을 반환하라.
- 컬렉션,배열 같은 컨테이너가 비었을 때 null을 반환하는 메서드를 사용하면, 항상 방어적인 코드를 작성해야 한다.
- 빈 컨테이너를 할당하는 비용이 드니 null을 반환하는 쪽이 낫다는 의견도 존재한다.
  - 성능 분석 결과 이할당이 성능 저하의 주범이라고 확인되지 않는 한 이정도의 성능 차이는 신경 쓸 수준이 아니다.
  - null을 반환하는 API는 오류 처리 코드도 늘어난다.

```Java
public List<Cheese> getCheeses() {
    return cheesesInStock.isEmpty() ? null : new ArrayList<>(cheesesInStock);
}

List<Cheese> cheeses = shop.getCheeses();
// 방어적인 코드
if (cheeses != null && cheeses.contains(Cheese.STILTON)) {
    System.out.println("우리 가게에는 스틸턴이 있습니다.");
}
```

```Java
// 빈 컬렌션 반환하는 방법
public List<Cheese> getCheeses() {
    return new ArrayList<>(cheesesInStock);
}

// 빈 컬렉센열 매번 새로 인스턴스를 생성하지 않도록 하는 방법
public List<Cheese> getCheeses() {
    return cheesesInStock.isEmpty() ? Collections.emptyList() 
              : new ArrayList<>(cheesesInStock);
}

// 빈 배열 길이가 0일 경우 반환하는 방법
public Cheese[] getCheeses() {
    return cheesesInStock.toArray(new Cheese[0]);
}

// 빈 배열 길이가 0일 경우 매번 새로 인스턴스를 생성하지 않도록 하는 방법
private static final Cheese[] EMPTY_CHEESE_ARRAY = new Cheese[0];
public Cheese[] getCheeses() {
    return cheesesInStock.toArray(EMPTY_CHEESE_ARRAY);
}

// 나쁜 예 배열을 미리 할당하면 성능이 나빠진다.
public Cheese[] getCheeses() {
    return cheesesInStock.toArray(new Cheese[cheesesInStock.size()]);
}

```

## 7. 옵셔널 반환은 신중히 하라.
- 예외를 생성할 때 스택 추적 전체를 캡처하는 하므로 비용도 만만치 않다.
- 옵셔널을 반환하느 메서든에서는 절대 null을 반환해서는 안된다. 이는 옵셔널을 도입한 취지를 완전히 무시하는 행위이다.
- 컬렉션, 스트림, 배열, 옵셔널 같은 컨테이너 타입은 옵셔널로 감싸면 안된다.
- 결과가 없을 수 있으며, 클라잉언트가 이 상황을 특별하게 처리해야 한다면 Optional\<T>를 반환한다.
- 박싱된 기본 타입을 담은 옵셔널을 반환하는 일은 없도록 하자.
- 옵셔널을 컬렉션의 키, 값, 원소나 배열의 원소로 사용하는게 적절한 상황은 거의 없다.

```Java
public static <E extends Comparable<E>> E max(Collection<E> c) {
    if (c.isEmpty()) {
        throw new IllegalArgumentException("빈 컬렉션");
    }
    
    E result = null;
    for (E e : c) {
        if (result == null || e.compareTo(result) > 0) {
            result = Objects.requireNonNull(e);
        }
    }
    return result;
}

// 옵셔널을 반환하는 방법
public static <E extends Comparable<E>> Optional<E> max(Collection<E> c) {
    if (c.isEmpty()) {
        return Optional.empty();
    }
    
    E result = null;
    for (E e : c) {
        if (result == null || e.compareTo(result) > 0) {
            result = Objects.requireNonNull(e);
        }
    }
    return Optional.of(result);
}
```

## 8. 공개된 API 요소에는 항상 문서화 주석을 작성하라.
- 공개된 클래스, 인터페이스, 메서드, 필드에는 항상 문서화 주석을 작성하자.
- 문서화 주석은 API 사용자에게 어떻게 사용해야 하는지 설명한다.