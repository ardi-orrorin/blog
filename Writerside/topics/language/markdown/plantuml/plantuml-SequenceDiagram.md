# SequenceDiagram


### example
```plantuml
@startuml
test1 -> test2: test start
test2 -> test1: test223
@enduml
```

```text
@startuml
test1 -> test2: test start
test2 -> test1: test223
@enduml
```

```plantuml
@startuml
test1 -> test2: test start
test1 -> test3: test start
test1 -> test4: test start
test1 -> test5: test start
test1 -> test6: test start
test1 -> test7: test start
test1 -> test8: test start
@enduml
```
```text
@startuml
test1 -> test2: test start
test1 -> test3: test start
test1 -> test4: test start
test1 -> test5: test start
test1 -> test6: test start
test1 -> test7: test start
test1 -> test8: test start
@enduml
```

### participant
- paricipant
- actor
- boundary
- control
- entity
- database
- collections
- queue

```plantuml
@startuml
participant paricipant as foo1
actor actor as foo2
control control as foo3
boundary boundary as foo4
entity entity as foo5
database database as foo6
collections collections as foo7
queue queue as foo8

foo1 -> foo2
foo1 --> foo3
foo1 -> foo4
foo1 --> foo5
foo1 -> foo6
foo1 --> foo7
foo1 -> foo8
@enduml
```

```text
@startuml
participant paricipant as foo1
actor actor as foo2
control control as foo3
boundary boundary as foo4
entity entity as foo5
database database as foo6
collections collections as foo7
queue queue as foo8

foo1 -> foo2
foo1 --> foo3
foo1 -> foo4
foo1 --> foo5
foo1 -> foo6
foo1 --> foo7
foo1 -> foo8
@enduml
```

### order

```plantuml
@startuml
participant test1 order 20
participant test2 order 10
@enduml
```

```text
@startuml
participant test1 order 20
participant test2 order 10
@enduml
```

### 여러 줄
```plantuml
@startuml
participant test1 [
    test
    ----
    test
]
@enduml
```

```text
@startuml
participant test1 [
    test
    ----
    test
]
@enduml
```

### 특수문자

```plantuml
@startuml
"test1" -> "test2()": test start
@enduml
```

```text
@startuml
"test1" -> "test2()": test start
@enduml
```

### mySelf

```plantuml
@startuml
test1 -> test1: loop
@enduml
```

```text
@startuml
test1 -> test1: loop
@enduml
```

### Text Align
```plantuml
@startuml
skinparam sequenceMessageAlign left
testtesttest1 -> testtesttest2: test start
@enduml

@startuml
skinparam sequenceMessageAlign right
testtesttest1 -> testtesttest2: test start
@enduml

@startuml
skinparam sequenceMessageAlign center
testtesttest1 -> testtesttest2: test start
@enduml

@startuml
skinparam responseMessageBelowArrow true
testtesttest1 -> testtesttest2: test
testtesttest2 -> testtesttest1: start
@enduml
```

```text
@startuml
skinparam sequenceMessageAlign left
testtesttest1 -> testtesttest2: test start
@enduml

@startuml
skinparam sequenceMessageAlign right
testtesttest1 -> testtesttest2: test start
@enduml

@startuml
skinparam sequenceMessageAlign center
testtesttest1 -> testtesttest2: test start
@enduml

@startuml
skinparam responseMessageBelowArrow true
testtesttest1 -> testtesttest2: test
testtesttest2 -> testtesttest1: start
@enduml
```


### Arrow Color

```plantuml
@startuml
test1 -[#red]> test2: test start
test2 -[#55ffff]> test1: test end
@enduml
```

```text
@startuml
test1 -[#red]> test2: test start
test2 -[#55ffff]> test1: test end
@enduml
```

### number
```plantuml
@startuml
autonumber
test1 -> test2: start
test2 -> test1: end
@enduml

@startuml
autonumber 15
test1 -> test2: start
test2 -> test1: end
@enduml

@startuml
autonumber 5 "<b>[000]"
test1 -> test2: start
test2 -> test1: end
@enduml

@startuml
autonumber 100 "<b>(<u>##</u>)"
test1 -> test2: start
test2 -> test1: end
@enduml

@startuml
autonumber 100 "<font color=red><b>(<u>##</u>)"
test1 -> test2: start
test2 -> test1: end
@enduml

@startuml
autonumber 100 "<font color=ff55ff><b>(<u>##</u>)"
test1 -> test2: start
test2 -> test1: end
@enduml
```

```text
@startuml
autonumber
test1 -> test2: start
test2 -> test1: end
@enduml

@startuml
autonumber 15
test1 -> test2: start
test2 -> test1: end
@enduml

@startuml
autonumber 5 "<b>[000]"
test1 -> test2: start
test2 -> test1: end
@enduml

@startuml
autonumber 100 "<b>(<u>##</u>)"
test1 -> test2: start
test2 -> test1: end
@enduml

@startuml
autonumber 100 "<font color=red><b>(<u>##</u>)"
test1 -> test2: start
test2 -> test1: end
@enduml

@startuml
autonumber 100 "<font color=ff55ff><b>(<u>##</u>)"
test1 -> test2: start
test2 -> test1: end
@enduml
```
### note

```plantuml
@startuml
test1 -> test2: test start
note right: test start note

@enduml

## 여러줄 
@startuml
test1 -> test2: test start
note right of test2
    test1sdf
    sdfsdf
    dfsdf
    sdf
    end note
test2 -> test1: test end
@enduml


@startuml
test1 -> test2: test start
note over test1
    test1sdf
    sdfsdf
    dfsdf
    sdf
    end note
test2 -> test1: test end
@enduml

@startuml
test1 -> test2: test start
note over test1, test2
    note over test1,test2
    end note
test2 -> test1: test end
@enduml


@startuml
test1 -> test2: test start
note over test1,test2 #ff5500

    note over test1,test2
    color = #ff5500
    end note
    
test2 -> test1: test end
@enduml
```

```text
@startuml
test1 -> test2: test start
note right: test start note

@enduml

## 여러줄 
@startuml
test1 -> test2: test start
note right of test2
    test1sdf
    sdfsdf
    dfsdf
    sdf
    end note
test2 -> test1: test end
@enduml


@startuml
test1 -> test2: test start
note over test1
    test1sdf
    sdfsdf
    dfsdf
    sdf
    end note
test2 -> test1: test end
@enduml

@startuml
test1 -> test2: test start
note over test1, test2
    note over test1,test2
    end note
test2 -> test1: test end
@enduml


@startuml
test1 -> test2: test start
note over test1,test2 #ff5500

    note over test1,test2
    color = #ff5500
    end note
    
test2 -> test1: test end
@enduml
```

### new page

```plantuml
@startuml
test1 -> test2: test start
test2 -> test1: test end
newpage A title
test2 -> test1: test start
test1 -> test2: test end
@enduml
```

```text
@startuml

test1 -> test2: test start
test2 -> test1: test end

newpage A title

test2 -> test1: test start
test1 -> test2: test end

@enduml
```

### 페이지 제목, 머리말 꼬리말
```plantuml
@startuml
header This is a header
footer This is a footer

title Example of a sequence diagram
test1 -> test2: test start
test2 -> test1: test end
@enduml
```

```text
@startuml

header This is a header
footer This is a footer

title Example of a sequence diagram

test1 -> test2: test start
test2 -> test1: test end

@enduml

```

### group
```plantuml
@startuml

alt test
    test1 -> test2: test start
    test2 -> test1: test end

else test

    test1 -> test2: test start
    test2 -> test1: test end
    
    group test
        test1 -> test2: test start
        test2 -> test1: test end
    end
    
    loop 1000 times
        test1 -> test2: test start
        test2 -> test1: test end
    end

end

@enduml
```

```text
@startuml

alt test
    test1 -> test2: test start
    test2 -> test1: test end

else test

    test1 -> test2: test start
    test2 -> test1: test end
    
    group test
        test1 -> test2: test start
        test2 -> test1: test end
    end
    
    loop 1000 times
        test1 -> test2: test start
        test2 -> test1: test end
    end

end

@enduml
```

### 지연
```plantuml
@startuml
test1 -> test2 : test start

...wait 5 seconds...

test1 -> test3 : test start

...wait 15 seconds...

test1 -> test4  : test start
@enduml
```

```text
@startuml
test1 -> test2 : test start

...wait 5 seconds...

test1 -> test3 : test start

...wait 15 seconds...

test1 -> test4  : test start
@enduml
```

### 줄바꿈, 공백
```plantuml
@startuml
title 줄바꿈
a -> b : test\nstart
b -> c : test\nend
@enduml

@startuml
title 공백
a -> b : test\nstart
|||
b -> c : test\nend
@enduml
```

```text
@startuml
title 줄바꿈
a -> b : test\nstart
b -> c : test\nend
@enduml

@startuml
title 공백
a -> b : test\nstart
|||
b -> c : test\nend
@enduml

```

### 라이프라인
```plantuml
@startuml
User -> A: DoWork
activate A
A -> B: Create Request
|||
B -> C: DoWork

C -> C: Create Response\n wait 5 seconds

C -> B: Send Response

B -> A: Response Created

A -> User: Done
deactivate A

@enduml

@startuml
autoactivate on
User -> System: DoWork
System -> System: Internal call
return thread 1 end
return success end
@enduml

```


```text

@startuml
User -> A: DoWork
activate A
A -> B: Create Request
|||
B -> C: DoWork

C -> C: Create Response\n wait 5 seconds

C -> B: Send Response

B -> A: Response Created

A -> User: Done
deactivate A
@enduml

@startuml

autoactivate on

User -> System: DoWork
System -> System: Internal call

return thread 1 end
return success end

@enduml
```

### 활성, 비활성, 생성

```plantuml
@startuml
test1 -> test2 ++ : 활성
test2 -> test3 -- : 비활성
test1 -> test4 ** : 인스턴스 생성
test4 -> test1 !! : 인스턴스 제거
@enduml

@startuml
test1 -> test2 ++-- :활성, 비활성 혼용
test2 -> test1 ++-- :활성, 비활성 혼용
test1 -> test2 --++ :활성, 비활성 혼용
test2 -> test1 --++ :활성, 비활성 혼용
@enduml
```

```text
@startuml
test1 -> test2 ++ : 활성
test2 -> test3 -- : 비활성
test1 -> test4 ** : 인스턴스 생성
test4 -> test1 !! : 인스턴스 제거
@enduml

@startuml
test1 -> test2 ++-- :활성, 비활성 혼용
test2 -> test1 ++-- :활성, 비활성 혼용
test1 -> test2 --++ :활성, 비활성 혼용
test2 -> test1 --++ :활성, 비활성 혼용
@enduml
```

### incoming, outgoing
```plantuml

@startuml
?-> test1 : start
[-> test2 : start 2
test2 ->] : end 2
test1 ->? : end ?
test1 ->] : end ]
@enduml

```
```text
@startuml
?-> test1 : start
[-> test2 : start 2
test2 ->] : end 2
test1 ->? : end ?
test1 ->] : end ]
@enduml
```


### anchors and duration
```plantuml
@startuml
!pragma teoz true

{start} test1 -> test2 : start
test2 -> test3 : processing

|||

test3 -> test2 : response
{end} test2 -> test1 : end

{start} <-> {end} : duration 20 seconds

@enduml
```
```text
@startuml
!pragma teoz true

{start} test1 -> test2 : start
test2 -> test3 : processing

|||

test3 -> test2 : response
{end} test2 -> test1 : end

{start} <-> {end} : duration 20 seconds

@enduml

```

### box
```plantuml
@startuml

skinparam sequenceMessageAlign center
skinparam ParticipantPadding 40
skinparam BoxPadding 20

box "A to B"
participant A
participant B
end box

box "C to D"
participant C
participant D
end box

A -> B : box start
B -> A : box end

B -> C : Connect

C -> D : box start
D -> C : box end
@enduml
```

```text
@startuml
skinparam sequenceMessageAlign center
skinparam ParticipantPadding 40
skinparam BoxPadding 20

box "A to B"
participant A
participant B
end box

box "C to D"
participant C
participant D
end box

A -> B : box start
B -> A : box end

B -> C : Connect

C -> D : box start
D -> C : box end
@enduml
```

### arrow
```plantuml
@startuml
skinparam sequenceMessageAlign center
skinparam arrowPadding 20
participant Alice as a
participant Bob   as b
a ->     b : ""->   ""
a ->>    b : ""->>  ""
a -\     b : ""-\   ""
a -\\    b : ""-\\\\""
a -/     b : ""-/   ""
a -//    b : ""-//  ""
a ->x    b : ""->x  ""
a x->    b : ""x->  ""
a o->    b : ""o->  ""
a ->o    b : ""->o  ""
a o->o   b : ""o->o ""
a <->    b : ""<->  ""
a o<->o  b : ""o<->o""
a x<->x  b : ""x<->x""
a ->>o   b : ""->>o ""
a -\o    b : ""-\o  ""
a -\\o   b : ""-\\\\o""
a -/o    b : ""-/o  ""
a -//o   b : ""-//o ""
a x->o   b : ""x->o ""
@enduml
```