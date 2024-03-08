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


