# include

## Overview
MyBatis에서 include는 사전에 정의된 SQL을 재사용할 수 있도록 해준다.

## Example

```xml
<sql id="table">
    FROM ${table}
</sql>

<select id="selectAll" resultType="Member">
    SELECT *
    <include refid="table">
        <property name="table" value="MEMBER"/>
    </include>
</select>

<!-- 아래와 같은 의미-->
<select id="selectAll" resultType="Member">
    SELECT *
      FROM MEMBER
</select>
```


## 외부 mapper에서 include 사용하기

```xml
<!-- mapper.xml-->
<mapper namespace="com.example.demo.mapper.MMember">
    <sql id="table">
        FROM ${table}
    </sql>
</mapper>

<!-- common.xml-->
<mapper namespace="com.example.demo.mapper.Common">
    <select id="selectAll" resultType="Member">
        SELECT *
        <include refid="com.example.demo.mapper.MMember.table">
            <property name="table" value="MEMBER"/>
        </include>
    </select>
</mapper>
```
