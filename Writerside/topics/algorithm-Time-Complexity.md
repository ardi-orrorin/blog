# 01. Time-Complexity

## Overview
시간복잡도 (Time Complexity)는 알고리즘의 성능을 나타내는 척도이다.

## 시간복잡도 표기 종류
- Big-O(빅-오) : 상한 점근
- Big-Ω(빅-오메카) : 하한 점근
- Big-Θ(빅-세타) : 그 둘의 평균


### 1. Big-O 표기법
최악의 경우를 고려하여 성능을 표기한다.

- Big-O 종류
  - O(1) : 일정한 복잡도(Constant Complexity)
  - O(n) : 선형 복잡도(Linear Complexity)
  - O(log n) : 로그 복잡도(Logarithmic Complexity)
  - O(n^2) : 2차 복잡도(Quardratic Complexity)
  - O(2n) : 지수 복잡도(Exponential Complexity)

![](time_complexity_chart.png){thumbnail="true"}

![](Complexities-Graph1.png){thumbnail="true"}

### 1-1. O(1) : 일정한 복잡도(Constant Complexity)
입력값이 증가하더라도 시간이 일정하게 걸리는 알고리즘

![](constant-time-graph.png){thumbnail="true"}

```Kotlin

```Kotlin
fun O1(array: IntArray, index: Int): Int {
    return array[index]
}
val arr: IntArray = intArrayOf(1,2,3,4,5)
val index = 3
println(O1(arr, index)) // 4
// 시간이 지나도 배열중 하나의 값을 가져오므로, 시간복잡도는 O(1)이다.
```


### 1-2. O(n) : 선형 복잡도(Linear Complexity)
입력값이 증가하면 시간도 선형적으로 증가하는 알고리즘

대표적으로 1차 for-loop, while loop, do while loop foreach loop 등이 있다.

![](linear-time-graph.png){thumbnail="true"}

```Kotlin
fun On(n: Int) {
    for (i in 0..n) {
        // 실행문
    }
}
// 입력값에 따라 for문이 n번 실행되므로, 시간복잡도는 O(n)이다.
```

### 1-3. O(log n) : 로그 복잡도(Logarithmic Complexity)
- 입력값이 증가하더라도 시간이 로그함수적으로 증가하는 알고리즘  
- O(1) 다음으로 빠른 알고리즘
- 이진탐색, 퀵정렬, 합병정렬 등이 대표적인 알고리즘

![](quadratic-time.png){thumbnail="true"}

### 1-4. O(n^2) : 2차 복잡도(Quardratic Complexity)
- 입력값이 증가하면 시간이 제곱함수적으로 증가하는 알고리즘

![](quadratic-time.png){thumbnail="true"}

```Kotlin
fun On2_loop_2(n: Int) {
    for (i in 0..n) {
        for (j in 0..n) {
            // 실행문
        }
    }
}

fun On2_loop_3(n: Int) {
    for (i in 0..n) {
        for (j in 0..n) {
            for (k in 0..n) {
                // 실행문
            }
        }
    }
}
```


### 1-5. O(2^n) : 지수 복잡도(Exponential Complexity)
- 입력값이 증가하면 시간이 지수함수적으로 증가하는 알고리즘
- 피보나치 수열이 대표적인 알고리즘

```Kotlin
fun fibonacci(n: Int): Int {
    return if (n <= 1) n else fibonacci(n - 1) + fibonacci(n - 2)
}
```


<seealso>

<category ref="ref">
<a href="https://velog.io/@yeonkr/시간-복잡도-공간-복잡도">참고 레퍼런스</a>
</category>

</seealso>