# 02. Producer

<show-structure for="procedure" />

<procedure title="Producer" help-id="kafkaProducer">
<p>
카프카로 메시지를 보내는 역할을 하는 클라이언트 총칭
</p>
</procedure>

<procedure title="Producer Design">
    <img src="kafka_03.jpg" alt="" thumbnail="true" />
</procedure>

<procedure title="Producer Option">
    <step>
        <p>
            <b>[bootstrap.servers]</b> 클러스터 내 모든 서버가 클라이언트의 요청을 받을 수 있다. 클러스터에 처음 연결하기 위한 호스트와 포트 정보를 나타냅니다.
        </p>
    </step>
    <step>
        <p>
            <b>[client.dns.lookup]</b>
        </p>
        <list style="decimal">
            <li>하나의 호스트에 여러 IP를 매핑해 사용하는 일부 환경에서 클라이언트가 하나의 IP와 연결하지 못할 경우 다른 IP로 시도하는 설정</li>
            <li>use_all_dns_ips가 기본값</li>
            <li>resolve_canonical_bootstrap_servers_only 옵션은 커버로스(Kerberos) 환경에서 FQDN을 얻기 위한 용도로 사용한다.</li>
        </list>
    </step>
    <step>
        <p>
            <b>[acks]</b>
        </p>
        <list style="decimal"> 
            <li>프로듀서가 카프카 토픽ㄱ의 리더 측에 메시지를 전송한 후 요청을 완료하기를 결정하는 옵션</li>
            <li>
                <p>0, 1, all(-1)로 표현</p>
                <list style="decimal">
                    <li>0은 일부 손실를 감수하고 빠르게 전송한다.</li>
                    <li>1은 리더가 메시지를 받았는지 확인하지만, 모든 팔로워를 전부 확인하지는 않는다.</li>
                    <li>all(-1)은 팔로워가 메시지를 받았는지 여부를 확인, 다소 느릴 수 있지만, 하나의 팔로워가 있는 한 메시진는 손실되지 않는다.</li>
                </list>
            </li>
        </list>
    </step>
    <step>
        <p>
            <b>[buffer.memory]</b> 프로듀서가 카프카 서버로 데이털르 보내기 위해 잠시 대기(배치 전송이나 딜레이 등) 할 수 있는 전체 메모리 바이트(byte)
        </p>
    </step>
    <step>
        <p>
            <b>[compreesion.type]</b>
        </p>
        <list style="decimal">
            <li>프로듀서가 메시지 전송 시 선택할 수 있는 압축 타입</li>
            <li>none, gzip, snappy, lz4, zstd</li>
        </list>
    </step>
    <step>
        <p>
            <b>[enable.idempotence]</b>
        </p>
        <list>
            <li>true 중복 없는 전송이 가능</li>
            <li>이와 동시 max.in.flight.requests.per.connection은 5이하, retires는 0이상, acks는 all로 설정해야 한다.</li>
        </list>
    </step>
    <step>
        <p>
            <b>[max.in.flight.requests.per.connection]</b>
        </p>
        <list>
            <li>하나의 커넥션에서 프로듀서가 최대한 ACK없이 전송할 수 있는 요청수</li>
            <li>메시지의 순서가 중요하다면 1로 설정 권장, 하지만 성능은 다소 떨어진다.</li>
        </list>
    </step>
    <step>
        <p>
            <b>[retries]</b> 일시적인 오류로 인해 전송에 실패한 데이털르 다시 보내는 횟수
        </p>
    </step>
    <step>
        <p>
            <b>[battch.size]</b>
        </p>
        <list>
            <li>프로듀서는 동일한 파티션으로 보내는 여러 데이터를 함께 배치로 보내려고 시도한다.</li>
            <li>적절한 배치 크기 설정은 성능에 도움을 준다.</li>
        </list>
    </step>
    <step>
        <p>
            <b>[linger.ms]</b>
        </p>
        <list>
            <li>배치 현태의 메시지를 보내기 전에 추가적인 메시지를 위해 기다리는 시간을 조정</li>
            <li>배치 크기에 도달하지 못 한 상황에서 linger.ms 제한 시간에 도달 햇을 때 메시지를 전송</li>
        </list>
    </step>
    <step>
        <p>
            <b>[transactional.id]</b>
        </p>
        <list>
            <li>'정확히 한 번 전송'을 위해 사용하는 옵션이며, 동일한 TransactionalId에 한해 정확히 한 번을 보장</li>
            <li>옵션을 사용하기 전 enable.idempoptence를 true로 설정</li>
        </list>
    </step>
</procedure>