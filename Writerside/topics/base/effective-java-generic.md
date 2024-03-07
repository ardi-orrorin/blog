# 제네릭

## 1. Raw 타입은 사용하지 말라.
- Raw 타입이란 제네릭 타입에서 타입 매개변수를 전혀 사용하지 않는 것을 말한다.
```Java
private final Collection stamps = ...; // Raw 타입

stamps.add(new Coin(...)); // 컴파일러는 경고를 띄우지 않는다.

for (Iterator i = stamps.iterator(); i.hasNext();) { // Raw 타입
  Stamp s = (Stamp) i.next(); // ClassCastException 발생
} 
```

```Java
private final Collection<Stamp> stamps = ...; // 제네릭 타입

stamps.add(new Coin(...)); // 컴파일러는 경고를 띄운다.
```
- 이렇듯 Raw 타입을 쓰면 제내릭이 안겨주는 안전성과 표현력을 모두 읽게 된다.
- 제네릭 타입을 쓰고 싶지만 실테 타입 매개변수가 무엇인지 싱경 쓰고 싶지 않다면 물을표(?) 와일드카드 타입을 사용하자.

| 한글용어           | 영문용어                   | example                            |
|----------------|------------------------|------------------------------------|
| 매개변수화 타입       | paramerterized type    | List<String\>                      |
| 실제 타입 매개변수     | actual type parameter  | String                             |
| 제네릭 타입         | generic type           | List\<E\>                          |
| 정규 타입 매개변수     | formal type paramerter | E                                  |
| 비한정적 와일드 카드 타입 | unbouned wildcard type | List<?>                            |
| 로(로우)타입        | raw type               | List                               |
| 한정적 타입 매개변수    | bounded type parameter | \<E extends Number\>               |
| 재귀적 타입 한정      | recursive type bound   | <T extends Comparable\<T\>>        |
| 한정적 와일드 카드 타입 | bounded wildcard type  | List<? extends Number>             |
| 제네릭 메서드 | generic method | static <E\> List<E\> asList(E[] a) |
|타입 토큰 | type token | String.class                       |

## 2. 비검사 경고를 제거하라.
- 경고를 제거할 수는 없지만 타입이 안전하다고 확신할 수 있다면 @SupprexssWarnings("unchecked") 애너테이션을 달아 경고를 숨기자. (단, 런타임에서는 ClassCastException이 발생할 수 있다.)
- @SuppressWarnings("unchecked") 애너테이션을 사용할 때는 그 경고를 무시해도 안전한 이유를 항상 주석으로 남기자.
- 가능한 한 범위를 좁혀서 사용하자.

## 3. 배열보다는 리스트를 사용하자
- 배열은 공변(covariant), 리스트는 불공변(invariant)이다.
- 배열은 실체화(reify)된다. 즉, 런타임에도 자신이 담기로 한 원소의 타입을 인지하고 확인한다. 반면, 제네릭 타입은 타입 정보가 런타임에 소거된다. (타입 소거는 제네릭 타입을 이용해 만든 객체에서 컴파일타임에 타입 검사를 하지만 런타임에는 타입 정보가 소거되는 것을 말한다.)
- 배열은 실체화된 타입이므로 런타임에도 타입 안전성을 보장하지만, 제네릭 타입은 타입 정보가 런타임에 소거되므로 컴파일타임에만 타입 검사를 할 수 있다.
```Java
// 런타입에서 실패
Object[] objectArray = new Long[1];
objectArray[0] = "I don't fit in"; // ArrayStoreException 발생

// 컴파일타임에서 실패
List<Object> ol = new ArrayList<Long>(); // 컴파일 에러
ol.add("I don't fit in"); // 컴파일 에러
 
```
```Java
List<String> stringLists = new List<String>[1]; // 컴파일 에러
List<Integer> intList = List.of(42); // 컴파일 에러
Object[] objects = stringLists; // 컴파일 에러
objects[0] = intList; // 런타임 에러
String s = stringLists[0].get(0); // ClassCastException 발생
```

## 4. 이왕이면 제네릭 타입으로 만들라
- 제네릭 타입으로 만들면 클라이언트 코드에서 형변환을 하지 않아도 된다.
- 단 배열을 사용 하는 경우 제네릭 타입으로 만들 수 없다. (배열은 공변이기 때문에 런타임에 타입 안전성을 보장할 수 없다.)

## 5. 이왕이면 제네릭 메서드로 만들라.


## 6. 한정적 와일드카드를 사용해 API 유연성을 높이라.
- PECS(Producer-Extends, Consumer-Super) 원칙
  - 원소를 생산할 생산자라면 <? extends E>
  - 원소를 소비할 소비자라면 <? super E>


## 7. 제네릭과 가변인수를 함께 쓸 때는 신중하라.


## 8. 타입 안전 이종 컨테이너를 고려하라.
```Java
// 타입 안전 이종 컨테이너 패턴
public class Favorites {
  private Map<Class<?>, Object> favorites = new HashMap<>();

  public <T> void putFavorite(Class<T> type, T instance) {
    favorites.put(Objects.requireNonNull(type), instance);
  }

  public <T> T getFavorite(Class<T> type) {
    return type.cast(favorites.get(type));
  }
}
```

## 9. 스트림의 주의해서 사용하라.
- 람다에서는 타입 이름을 자주 생랷하므로 매개변수의 이름을 잘 지어야 가독성이 유지된다.
- 메스드를 직절히 활용하는 일의 중요성은 일반 반복 코드에서 보다는 스트림 파이프라인에서 훨씬 크다.
- 기존 코드는 스트림을 사용하도록 리퍼터링하되, 새코드가 더 나아 보일 때만 반영한다.

## 10. 스트림에서는 부작용 없는 함수를 사용하라.
- forEach 연산은 스트림 계산 결과를 보고할 때나 사용하고, 계산하는 데는 쓰지 말자.
- 반환 타입으로는 스트림보다 컬렉션이 낫다.
- 스트림을 사용하면 지연(lazy) 연산이 가능하다. (스트림 파이프라인은 종단 연산이 호출될 때까지 아무 연산도 수행하지 않는다.)

## 11. 반환 타입으로는 스트림보다 컬렉션이 낫다.
- 원소 시퀀스를 반환하는 공개 API의 반환 타입에는 Collection이나 그 하위 타입을 쓰는 게 일반적으로 최선이다.
- 단지 컬렉션을 반환하는 이유로 덩치 큰 시퀀스를 메모리에 올려서는 안된다.