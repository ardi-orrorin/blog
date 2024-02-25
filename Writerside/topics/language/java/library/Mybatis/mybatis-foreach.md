# foreach

## Overview
- MyBatis에서 foreach는 컬렉션을 반복하면서 SQL을 생성할 수 있도록 해준다.



## Properties
- collection : 반복할 컬렉션의 이름
- item : 컬렉션의 각 요소를 담을 변수명
- index : 컬렉션의 인덱스를 담을 변수명
- open : 컬렉션의 시작 부분
- close : 컬렉션의 끝 부분
- separator : 각 요소 사이에 들어갈 문자열
- nullable : 컬렉션이 null일 때 예외를 발생시킬지 여부


## Example

```xml
<select id="selectByList" resultType="Member">
SELECT *
  FROM MEMBER m
 WHERE m.ID IN
       <foreach collection="list" item="item"
                open="(" close=")"
                separator="," nullable="false"
       >#{item}
       </foreach>
</select>
```