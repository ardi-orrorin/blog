# useMemo

## Overview

- useMemo의 첫번째 콜백함수는 연산을 수행한 후 반환받는 값을 콜백함수의 리턴값 형태로 작성
- 두번쨰 인자는 의존성배열이라고하는데, 의존성 배열에 등록한 값의 변화를 감지한다.
- 만약 빈 배열을 사용하게되면 아무것도 감지하지 않기 때문에 첫 로딩 시에만 호출하여 값을 메모라이즈 한다.
- 이후 두번째 인자의 값이 변경되지 않은 이상 메모라이즈된 값을 사용한다.

```Javascript
```
{src="/Language/javascript/frameworks/React/99_useMemo/useMemo.html" include-lines="15-64"}