# set-if

## Overview
- update 쿼리문에 set-if를 사용하여 조건에 맞을 때면 컬럼의 내용을 변경 할 수 있다.
- set 엘리먼트를 사용하면 자동적으로 SET 구문이 삽입된다.

## Example

```xml
<update id="update" parameterType="Member">
    UPDATE MEMBER
       <set>
         <if test="name != null and name != ''">
           NAME = #{name},
         </if>
         <if test="birthday != null and birthday != ''">
           BIRTHDAY = #{birthday},
         </if>
         <if test="email != null and email != ''">
           EMAIL = #{email},
         </if>
     </set>
    WHERE ID = #{id}
</update>
```
