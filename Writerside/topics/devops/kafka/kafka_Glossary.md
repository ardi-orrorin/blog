# 00. Glossary

<show-structure for="procedure" />

<procedure title="구성 요소" id="component" style="choices">
    <step id="zookeeper">
        <p>
            <b>[ZooKeeper]</b> 아파치 프로젝트 애플리케이션 이름으로 카프카의 메타데이터 관리 및 브로커의 정상상태(health check) 점검을 담당한다.
        </p>
    </step>
    <step id="kafkaCluster">
        <p>
            <b>[Kafka 또는 Kafka Cluster]</b> 아파치 프로젝트 애플리케이션 이름으로 여러대의 브로커를 구성한 클러스터를 의미
        </p>
    </step>
    <step id="broker">
        <p>
            <b>[Broker]</b> 카프카 애플리케이션이 설치된 서버 또는 노드
        </p>
    </step>
    <step id="producer">
        <p>
            <b>[Producer]</b> 카프카로 메시지를 보내는 역할을 하는 클라이언트 총칭
        </p>
    </step>
    <step id="consumer">
        <p>
            <b>[Consumer]</b> 카프카로 메시지를 꺼내가는 역할을 하는 클라이언트 총칭
        </p>
    </step>
    <step id="topic">
        <p>
            <b>[Topic]</b> 카프카는 메시지 피드들을 토픽으로 구분하고, 각 토픽의 이름은 카프카 내에서 고유하다.
        </p>
    </step>
    <step id="partition">
        <p>
            <b>[Partition]</b> 벙렬 처리 및 고성능을 얻기 위해 하나의 토픽을 여러 개로 나눈 것을 말한다.
        </p>
    </step>
    <step id="segment">
        <p>
            <b>[Segment]</b> 프로듀서가 전송한 실제 메시지가 브로커의 로컬 디스크에 저장되는 파일
        </p>
    </step>
    <step id="message">
        <p>
            <b>[Message 또는 Record]</b> 프로듀서가 브로커로 전송하거나 컨슈머가 읽어가는 데이터 조각
        </p>
    </step>
</procedure>




