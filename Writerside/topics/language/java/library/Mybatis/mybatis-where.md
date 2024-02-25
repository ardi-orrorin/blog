# where

## OverView
- where 태그는 SQL where 절을 생성할 때 쓰며, and나 or로 시작하는 경우 자동적으로 제거해준다.
- where 태그는 if 태그와 함께 사용하면 유용하다.
- if를 사용할 경우 조건에 처음 맞는 엘리먼트는 and나 or가 제거 된다.

## Example

```xml
<select id="selectByType" resultType="Member">
    SELECT *
      FROM MEMBER m
      <where> 
        <if test="id != null and id != 0">
          AND m.ID = #{id}
        </if>
        <if test="name != null and name != ''">
          AND m.NAME = #{name}
        </if>
        <if test="birthday != null and birthday != ''">
          AND m.BIRTHDAY = #{birthday}
        </if>
        <if test="email != null and email != ''">
          AND m.EMAIL = #{email}
        </if>
    </where>
</select>
```
