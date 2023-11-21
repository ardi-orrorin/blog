# 03.Transaction

## Overview
트랜잭션은 데이터베이스의 상태를 변화시키기 위해 수행하는 작업의 단위이다.
    
## Isolation Level
1. 트랜잭션 격리 수준으로 수준에 따라 격리 정도가 달라진다.
2. 트랜잭션을 병행하여 처리할 때 트랜잭션끼리 얼마나 고립되어 있는지를 나타낸다.
3. 트랜잭션의 고립 수준이 높을수록 동시성은 낮아지고, 동시성이 높을수록 고립 수준은 낮아진다.
4. 트랜잭션의 고립 수준은 동시성과 데이터베이스의 정합성 사이에서 트레이드 오프가 발생한다.
5. 이런 한 트랜잭션 격리 수준이 필요한 이유는 멀티스레드를 통해 처리시 정합성을 유지하기 위함이다.


| Isolation Level | Dirty Read | Non-Repeatable Read | Phantom Read |
|:---------------:|:----------:|:-------------------:|:------------:|
| READ UNCOMMITTED| O          | O                   | O            |
| READ COMMITTED  | X          | O                   | O            |
| REPEATABLE READ | X          | X                   | O            |
| SERIALIZABLE    | X          | X                   | X            |

1. **Dirty Read** : 한 트랜잭션에서 데이터를 수정하고 커밋하지 않았는데 다른 트랜잭션에서 수정된 데이터를 읽을 수 있는 상황
2. **Non-Repeatable Read** : 한 트랜잭션에서 데이터를 읽었는데 다른 트랜잭션에서 데이터를 수정하여 다시 읽었을 때 처음과 다른 데이터를 읽는 상황
3. **Phantom Read** : 한 트랜잭션에서 데이터를 읽었는데 다른 트랜잭션에서 데이터를 삽입하여 다시 읽었을 때 처음과 다른 데이터를 읽는 상황

### 1. READ UNCOMMITTED
![](db-taransaction-read-uncommited.jpg)

### 2. READ COMMITTED
![](db-taransaction-read-commited.jpg)

### 3. REPEATABLE READ
![](db-taransaction-repeatable-read.jpg)
