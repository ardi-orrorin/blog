# for-Loop

## Overview
반복문


## 1. 고전적인 for-Loop
for (초기화; 조건; 증감) { ... }
```Javascript
```
{src="Language/javascript/core/for_loop.js" include-lines="2-4"}

````Javascript
// 결과
0
1
2
3
4
// 생략
````

## 2. for-in
객체의 속성을 순회
```Javascript
```
{src="Language/javascript/core/for_loop.js" include-lines="7-15"}

```Javascript
// 결과
name, 'Lee'
age, 20
alive, true
```

```Javascript
```
{src="Language/javascript/core/for_loop.js" include-lines="18-27"}

```Javascript
// 결과
0 : [object Object]
1 : [object Object]
2 : [object Object]
3 : [object Object]
```

## 3. for-of
배열의 요소를 순회
```Javascript
```
{src="Language/javascript/core/for_loop.js" include-lines="30-33"}

```Javascript
// 결과
1
2
3
```

## 4. in vs of
- in : 객체의 key를 순회
- of : 배열의 요소를 순회

```Javascript
```
{src="Language/javascript/core/for_loop.js" include-lines="39-41"}

```Javascript
// 결과
0
1
2
3
```

```Javascript
```
{src="Language/javascript/core/for_loop.js" include-lines="44-46"}

```Javascript
// 결과
{ id: 0, name: 'Lee', age: 20 }
{ id: 1, name: 'Kim', age: 30 }
{ id: 2, name: 'Park', age: 40 }
{ id: 3, name: 'Choi', age: 50 }
```

