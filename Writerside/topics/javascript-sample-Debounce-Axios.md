# Debounce-Axios

## Overview
- Debounce는 연이어 호출되는 함수를 기준에 따라 호출을 제한하는 것을 말한다.
- 예를 들어 fetch axios 같이 http 요청을 연이어서 할 경우 서버에 부하가 걸리게 된다.
- 이때 일정 간경으로 호출을 제한하여 호출을 제한 할 수 있는데, 이때 사용하는 것이 Debounce이다.

## Debounce Example
```Javascript
```
{src="Language/javascript/example/debouncde-axios.html" include-lines="17-27"}
```Javascript
```
{src="Language/javascript/example/debouncde-axios.html" include-lines="28-36"}

- 200ms 간격으로 호출되는데, 그 사이에 호출된 내용은 무시된다.

## Debounce Full Code
```Javascript
```
{src="Language/javascript/example/debouncde-axios.html"}