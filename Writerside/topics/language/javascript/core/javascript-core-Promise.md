# Promise

## Overview
- 자바스크립트 비동기 처리에 사용되는 객체이다.

```Javascript
const requestData1 = () => 
    new Promise(resolve => setTimeout(() => resolve(1), 3000));
const requestData2 = () => 
    new Promise(resolve => setTimeout(() => resolve(2), 2000));
const requestData3 = () => 
    new Promise(resolve => setTimeout(() => resolve(3), 1000));
const requestData4 = () => 
    new Promise((_, reject) => setTimeout(() => reject(4), 1000));

const res = [];
let start = null;
let end = null;
```
## Promise.all
- 여러 개의 비동기 처리를 하나의 Promise로 만들어 처리할 수 있다.

- then을 이용해서 처리할 경우 순차적으로 처리되기 때문에 시간이 오래 걸린다.
```Javascript
// sequential
start = Date.now();
requestData1()
    .then(data =>{
        res.push(data);
        return requestData2();
    })
    .then(data =>{
        res.push(data);
        return requestData3();
    })
    .then(data =>{
        res.push(data);
        console.log(res);
        end = Date.now();
        console.log(`sequential time: ${end - start}ms`); // 6000ms 정도 걸림
    })
    .catch(err=> {
        console.error(err);
        end = Date.now();
        console.log(`sequential time: ${end - start}ms`);
    });
// 6000ms 정도 걸림
```

- promise.all을 이용하면 병렬적으로 처리할 수 있다.
```Javascript
start = Date.now();
Promise.all([requestData2(), requestData1(), requestData3(), requestData4()])
    .then(res=> {
        console.log(res);
        end = Date.now();
        console.log(`time: ${end - start}ms`); // 3000ms 정도 걸림
    })
    .catch(err=> {
        console.error(err);
        end = Date.now();
        console.log(`parallel time: ${end - start}ms`); // 1000ms 정도 걸림
    });
    
// 에러로 인해 1000ms 정도 소요됨
```


## Promise.race
- 여러 개의 비동기 처리 중 가장 빨리 처리된 것 하나만 처리할 수 있다.

```Javascript
Promise.race([
    requestData1(),
    requestData2(),
    requestData3(),
    requestData4()
]).then(res=> console.log(res))
.catch(err=> console.error(err));

// 3
```

## Promise.allSettled
- 여러 개의 비동기 처리 중 하나라도 실패하더라도 모든 처리가 끝날 때까지 기다렸다가 처리 결과를 반환
- 결과의 상태를 status를 통해 같이 반환한다.
- fulfilled: 성공
- rejected: 실패
- pending: 대기중 

```Javascript
Promise.allSettled([
    requestData1(),
    requestData2(),
    requestData3(),
    requestData4()
]).then(res=> console.log(res))

// [
//     {status: "fulfilled", value: 1},
//     {status: "fulfilled", value: 2},
//     {status: "fulfilled", value: 3},
//     {status: "rejected", reason: 4}
// ]
```