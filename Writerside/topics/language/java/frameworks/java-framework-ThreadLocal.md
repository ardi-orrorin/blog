# ThreadLocal

## Overview
스레드 단위로 로컬 변수를 사용할 수 있게 해주는 클래스이다.


## Thread-safe
멀티 스레드 환경에서 여러 곳에서 함수나 변수 등에 접근 가능할 때 다른 스레드들이 동시에 같은 것에 접근해도 문제가 생기지 않는 다는 것을 의미

자바에서는 보통 Thread, Runable을 통해 구현 한다.


## ThreadLocal 사용방법
```Java

ThreadLocal<Box> boxT1 = ThreadLocal.withInitial(() -> new Box(1, 2, 3));
ThreadLocal<Box> boxT2 = ThreadLocal.withInitial(() -> new Box(4, 5, 6));

System.out.println(boxT1.get()); // Box [x=1, y=2, z=3]
System.out.println(boxT2.get()); // Box [x=4, y=5, z=6]

boxT1.set(new Box(7, 8, 9));
boxT2.set(new Box(10, 11, 12));

System.out.println(boxT1.get()); // Box [x=7, y=8, z=9]
System.out.println(boxT2.get()); // Box [x=10, y=11, z=12]

boxT1.remove();
boxT2.remove();
```