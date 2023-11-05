# Pageable



## 1. URL Requset Parameter

### size
한 번에 불러온 데이터 사이즈
DB 에서는 Limit으로 호출한다.
```cURL
size=10
```

### page
```cURL
?page=0
?page=1
```

### sort
$1 : Direction
$2 : Order
```cURL
?sort=createdAt,desc
?sort=createdAt,asc
```


### Pageable
```
?size=10&page=0&sort=createdAt,desc
```cURL

