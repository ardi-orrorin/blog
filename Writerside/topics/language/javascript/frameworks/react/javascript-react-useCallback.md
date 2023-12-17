# useCallback

## Overview
- 컴포넌트 최적화하는 훅 중 하나이며, 함수를 메모라이징 하는 훅이다.
- 컴포넌트는 mount된 이후 state 변경에 따라 re-rendering이 발생하는 데, 이때 함수가 새로 생성되어, 불필요하게 함수를 다시 생성해야하는 비효율적인 상황이 발생한다.
- 이때 useCallback을 사용하면, 함수를 메모라이징하여, 조건에 의해서만 재렌더링 되도록 할 수 있다.

```Javascript
```
{src="/Language/javascript/frameworks/React/99_useCallback/useCallBack.html" include-lines="15-44"}