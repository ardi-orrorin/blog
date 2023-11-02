# Quartz

<show-structure for="procedure" />






<procedure title="1. Job 객체 생성">
    <p>Job 객체를 상속받아 실행할 구문 작성</p>
    <code-block lang="kotlin" include-lines="47-51" src="/Language/java/library/quartz/java_library_quartz.kt" />
</procedure>

<procedure title="2. Job 생성">
    <p></p>
    <code-block lang="kotlin" include-lines="17-19" src="/Language/java/library/quartz/java_library_quartz.kt" />
</procedure>

<procedure title="3. Trigger 생성">
    <step>
        <p>
        일정한 주기로 반복하는 Simple Trigger, <br/>
        일정한 시간마다 실행하는 Cron Trigger가 있다.
        </p>
    </step>
    <step>
        <p>Simple Trigger</p>
        <code-block lang="kotlin" include-lines="21-31" src="/Language/java/library/quartz/java_library_quartz.kt" />
    </step>
    <step>
        <p>Cron Trigger</p>
        <code-block lang="kotlin" include-lines="34-39" src="/Language/java/library/quartz/java_library_quartz.kt" />
    </step>
</procedure>

<procedure title="4. 스케쥴러 실행">
    <code-block lang="kotlin" include-lines="41-43" src="/Language/java/library/quartz/java_library_quartz.kt" />
</procedure>




<seealso>
<category ref="ref">
    <a href="http://www.quartz-scheduler.org">Home Page</a>
    <a href="http://www.quartz-scheduler.org/documentation/quartz-2.3.0/tutorials/crontrigger.html">Cron Trigger Document</a>
</category>
<category ref="git">
    <a href="https://github.com/quartz-scheduler/quartz">GitHub</a>
</category>
</seealso>