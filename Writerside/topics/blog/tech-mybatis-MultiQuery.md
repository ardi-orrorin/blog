# Single Query vs Multi Query

## 확인하고 하는 내용 
- insert, update의 한 개의 쿼리 여러번 실행 하는 것과 멀티 쿼리로 한번에 실행하는 것의 비용 차이
- 커넥션 비용의로 멀티쿼리의 속도가 빠를 것으로 예상이 된다.
- 빠르다면 커넥션 비용으로 인한 속도차이는 얼마나 나는지 실험해보자.

## Query Code
한 개의 insert 쿼리와 value값만 foreach를 이용한 쿼리 두 가지를 작성했다.   
해당 코드는 정확히 멀티쿼리는 아니지만, update시 query 전문을 foreach로 감싸 멀티쿼로 만들어서 실험해도 비슷한 효과를 볼 수 있었다.

![](tech-mybatis-multiquery-code.jpg) {thumbnail="true"}

## 사용한 Serivce 코드
첫 번째 for문을 통해 1000번 member의 정보를 insert를 실행하는 코드,  

두 번째는 리스트에 1000개의 member 정보를 담아 한 번에 insert하는 코드로 작성했다.

![](tech-mybatis-iinsert-test-code-.jpg) {thumbnail="true"}

## 결과

다소 단순 하고 극단적인 예제이긴 하지만, 싱글쿼리로 insert할 때는 48.88초, 멀티쿼리로 insert할 때는 0.28초로 대략 170배 이상의 차이가 났다.  
이번에는 1000개를 기준으로 실험했지만, n : 1 커넥션 비율로 간다면 그 차이는 더욱더 벌어질 것이다.

![](tech-mybatis-insert-1000-1-0result.jpg) {thumbnail="true"}

![](tech-mybatis-insert-1-1000-result.jpg) {thumbnail="true"}

두 쿼리 모두 정상적으로 db에 insert 되었다.(디비가 생성된 시간을 보면 단일 쿼리로 쓰인 db의 초값이 다르게 표시된 것을 확인할 수 있다.) 

![](tech-mybatis-insert-1000-1-0result-db.jpg) {thumbnail="true"}

![](tech-mybatis-insert-1-1000-result-db.jpg) {thumbnail="true"}

## 결론
당연하게 싱글 쿼리보다 멀티쿼리의 성능과 리소스 비용이 좋았다.   

단순한 insert의 실험이지만 170배 이상의 속도차이가 날 정도로 커넥션 비용이 상당히 크다는 것을 알 수 있었고,

또한, 실험을 통해서 추가적으로 알게된 내용은, 쿼리문의 길이 제환으로 인해 무한이 많은 멀티 쿼리를 쓸 수 없었다.

insert 할 정보의 길이를 예측하여, 최소한의 Connnection Pool이 사용되도록 하는 것이 성능 향상에 도움이 될 것이다.
