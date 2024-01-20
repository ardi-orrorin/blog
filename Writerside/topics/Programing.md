# Programing

## 명령형 프로그래밍 (Imperative Programming)
 - 명령형 프로그래밍은 '어떻게'에 초첨을 맞춘 프로그래밍 방식이다.
```Javascript
// 과정을 명시적으로 기술하는 프로그래밍 방식
let arr = [1, 2, 3, 4, 5];
for(let i = 0; i < arr.length; i++) {
    if (arr[i] <= 3) { // 
        arr.splice(i, 1);
    }
}
```

## 선언형 프로그래밍 (Declarative Programming)
 - 선언형 프로그래밍은 '무엇'에 초첨을 맞춘 프로그래밍 방식이다.
```Javascript
// 과정을 명시하지 않고 결과만 기술하는 프로그래밍 방식
let arr = [1, 2, 3, 4, 5];
arr.filter((item) => item > 3); 
```

## 함수형 프로그래밍 (Functional Programming)
- "순수 함수"를 사용해 상태를 제어하기 보다는, 빨리 처리하는 데 초첨을 둔 방법으로 실행 순서를 지정할 필요가 없다.
- 비절차형 언어라고 한다.
> 순수 함수란? 동일한 인자를 주면 항상 같은 값을 반환하는 함수이며, 외부의 상태를 변경하지 않는 함수를 말한다.
```Javascript
// 순수 함수
function add(a, b) {
    return a + b;
}
```
```Javascript
// 순수 함수가 아닌 함수
let c = 10;
function add(a, b) {
    return a + b + c;
}
```


## 절차지향 프로그래밍 (Procedural Programming)
- 일이 진행 되는 순서대로 프로그래밍 하는 방식
- 코드의 가독성이 좋고, 컴퓨터의 처리구조와 비슷해 실행속도가 빠르다.
- 하지만 코드의 순서가 바뀌면 결과가 달라지기 때문에 유지보수가 어렵다.

## 객체지향 프로그래밍 (Object-Oriented Programming)
- 객체(Object)를 기반으로 하는 프로그래밍 방식
- SOLID 원칙을 준수하며, 유지보수가 쉽고 확장성이 좋다.
- 코드의 재사용과 분석 및 설계가 용이하다.
- 다만 처리 속도가 상대적으로 느리고 ,설계에 많은 시간이 소요된다.


