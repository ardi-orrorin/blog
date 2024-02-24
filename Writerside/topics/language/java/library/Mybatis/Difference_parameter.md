# #{} #[] 차이?


# #{}
- parameter가 String 형태로 들어와 자동적으로 'string' 형태로 변환이 된다.
- '' 문자열 형태로 주입되기 때문에 쿼리 주입으로 인한 보안상 유리한 측면이 있다.

```SQL
SELECT * FROM table WHERE column = #{parameter}

SELECT * FROM table WHERE column = 'parameter' // 형식으로 변환

SELECT #{parameter} FROM table // ''로 감싸져서 사용 불가능 
```

# ${}
- Parameter가 타입이 그대로 출력된다.
- 해당 컬럼의 자료형에 맞추어 파라미터 자료형이 변경된다.
- 쿼리 주입의 위험이 있으므로 주의해야 한다.
- 테이블이나 컬럼명을 파라메터로 전달하고 싶을 때 사용한다. #{}은 자동으로 ''붙어서 사용이 불가능하기 때문이다.

```SQL
SELECT * FROM table WHERE column = ${parameter}

SELECT * FROM table WHERE column = parameter // 해당 컬럼의 타입이나 형태로 변환

SELECT ${parameter} FROM table // 타입 그대로 표시되기 때문에 사용 가능 
```  

