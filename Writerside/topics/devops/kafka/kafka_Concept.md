# 01. Concept

<show-structure for="procedure" />

<procedure title="Replication(레플리케이션)">
<p>
각 메시지들을 여러 개로 복사해서 카프카 클러스터 내 브로커들에게 분산키는 동작을 의미
이 덕분에 예기치 않게 브로커가 종료 되더라도 안정성을 유지할 수 있다. <br/><br/>
--replication-factor 3 이라는 옵션을 통해 리플리케이션 수를 지정할 수 있다. <br/><br/>  
factor가 많아지면 그 만큼 안정성을 유지할 수 있지만, 그 만큼 리소스를 많이 사용하게 되어,
오버헤드가 발생할 수 있으므로, 효율적으로 사용하길 권장한다. <br/>  
</p>
<tip>
    <b>Factor</b> 추천값 <br/>
    테스트나 개발 환경 : 1 <br/>
    운영 환경(로그성 메시지로 약간의 유실허용) : 2 <br/>
    운영 환경(유실 허용X) : 3 <br/>
</tip>
</procedure>

<procedure title="Partition(파티션)" style="steps">
    <step>
        <p>하나의 토픽이 한 번에 처리할 수 있는 한계를 높이기 위해 토픽 하나를 여러개로 나눠 병렬 처리가 가능하도록 만든 것</p>
    </step>
    <step>
        <p>파티션의 수 만큼 Consumer를 연결 할 수 있다.</p>
    </step>
    <step>
        <p>파티선 번호는 0부터 시작</p>
    </step>
    <step>
        <p>파티션은 언제든지 수정할 수 있으므로, 초기에는 2~4정도 생성 후, Consumer LAG등 모니터링 하면서 조금씩 늘려가는 것을 추천</p>
    </step>
    <step>
        <p>LAG란, Producer가 보낸 메시지 수(카프카에 남아 있는 메시지 수) - Consumer가 가져간 메지시 수<br />
            예를 들어 Producer 5개의 메시지를 카프카로 전송했는데, Consumer 4개를 가져갔다면 5 - 4 = 1 으로 LAG = 1이 된다. <br />
            모든 메시지를 가져 갔다면 5-5=0 으로 LAG라는 지표를 통해 지연이 없는지 확인 할 수 있다.
        </p>
    </step>
    <tip>
        <p>적절한 파티션 수 계산 사이트 <a href="https://eventsizer.io">https://eventsizer.io</a>를 참고</p>
    </tip>
    <img src="kafka_01.jpg" alt="" />
</procedure>

<procedure title="Segment">
    <p>Producer에 의해 브로커로 전송된 메시지를 Topic 의 Partition에 저장되며, 각 메시지는 Segment라는 로그 파일 형태로 브로커의 로컬 디스크에 저장된다.</p>
</procedure>

<procedure title="Flow">
    <img src="kafka_02.jpg" alt="" />
    <step>
        <p>압축 전송</p>
        <list style="decimal">
            <li>지원하는 대표적인 압축 타입 gzip, snappy, lz4, zstd</li>
            <li>일반적으로 높은 압축률이 필요한 경우 gzip, zstd 권장</li>
            <li>빠른 응답 속도가 필요하다면 lz4, snappy 권장</li>
        </list>
    </step>
    <step>
        <p>Leader, Follower</p>
        <list style="decimal">
            <li>리프리케니션 기능은 토픽을 자체를 복제하는 것이 아닌 토픽의 파티션을 복제하는 것</li>
            <li>원본과 리플레이션을 구분하기 위해 Leader, Follwer라고 부른다.</li>
        </list>
    </step>
</procedure>
