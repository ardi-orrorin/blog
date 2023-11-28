# FLUX

## Overview

- 사용자 입력을 기반으로 Action을 만들고 Dispatcher에 전달하여 Store의 데이터를 변경 후, View에 반영하는 단방향 디자인 패턴을 말한다.

- Flux 구조

![](designPattern-Flux.png)

- Redux 아키텍처

![](https://ko.redux.js.org/assets/images/ReduxDataFlowDiagram-49fa8c3968371d9ef6f2a1486bd40a26.gif) {thumbnail="true"}


## Action
- 사용자가 입력하고 데이터를 변경하기 위한 객체를 생성하는 부분이다.
- 타입(type)과 데이터(payload)로 구성하여 Dispatcher에 전달한다.

```Javascript
import {createActions } from 'redux-actions';

// redux-actions를 사용한 예제
export const {test : {input}} = createActions({
    [TEST_INPUT]: ({key, value}) => ({[key]: value}),
});
```

## Dispatcher
- Action에게 데이터를 받아 Store로 전달하는 중앙 허브 역할을 한다.

```Javascript
import { input } from './store/testRedocuer';

// action을 이용하여 dispatcher에게 데이터를 전달하는 예제
function onChangeHandler(e) {
    dispatch(input({key: e.target.id, value: e.target.value}));
}


```


## Store
- Dispatcher로부터 데이터를 받아 저장하고, View에게 데이터를 전달하는 역할을 한다.  
- MVC 패턴에서 Model에 해당한다.

```Javascript

import { handleActions } from 'redux-actions';

// store 초기값
const initialState = {
    title: '',
    body: '',
};

// redux-actions을 통해 store를 생성하는 예제
const testReducer = handleActions({
    [TEST_INPUT] : (state, {payload}) => ({
        ...state, [TEST_INPUT]: {...state[TEST_INPUT], ...payload },
    }),
}, initialState);
```

## View
- Store로부터 데이터를 받아 화면에 표시하는 역할을 한다.
- MVC 패턴에서 View에 해당한다.

```Javascript
function App() {
  const inputData = useSelector(state => state.testReducer[TEST_INPUT]);
  const dispatch = useDispatch();
  
  function onChangeHandler(e) {
    dispatch(input({key: e.target.id, value: e.target.value}));
  }
  return (
   <>
    <label htmlFor="title">title input: </label>
    <input id='title' type="text" value={inputData?.title} onChange={onChangeHandler} />
    
    <br />

    <label htmlFor="body">body input: </label>
    <input id='body' type="text" value={inputData?.body} onChange={onChangeHandler} />
    
    {
      inputData?.title && <p>{inputData.title}</p>
    }
    {
      inputData?.body && <p>{inputData.body}</p>
    }
    
   </>
  );
}
```