# Queue

## Overview
큐(Queue)는 먼저 들어온 데이터가 먼저 나가는 FIFO(First In First Out)구조로 저장하는 자료구조이다.

## 일반 Queue
- add() : 큐에 데이터를 추가한다.
- remove() : 큐에서 데이터를 삭제한다.
- peek() : 큐에서 데이터를 조회한다.
- poll() : 큐에서 데이터를 삭제하고 반환한다.

```Java
import java.util.Queue;

class Main {
    public static void main(String[] args) {
        Queue<Integer> q = new LinkedList<>();
        q.add(1);
        q.add(2);
        q.add(3);
        
        System.out.println(q); // [1, 2, 3]
        System.out.println(q.remove()); // 1
        System.out.println(q); // [2, 3]
        System.out.println(q.poll()); // 2
        System.out.println(q); // [3]
        System.out.println(q.peek()); // 3
        System.out.println(q); // [3]
    }
}
```

## Priority Queue
우선순위 큐(Priority Queue)는 우선순위가 높은 데이터가 먼저 나가는 자료구조이다.

- PriorityQueue() : 우선순위 큐를 생성한다. 오름차순
```Java
import java.util.PriorityQueue;

class Main {
    public static void main(String[] args) {
        PriorityQueue<Integer> pq = new PriorityQueue<>();
        pq.add(1);
        pq.add(3);
        pq.add(2);
        
        System.out.println(pq); // [1, 3, 2]
        System.out.println(pq.remove()); // 1
        System.out.println(pq); // [2, 3]
        System.out.println(pq.poll()); // 2
        System.out.println(pq); // [3]
        System.out.println(pq.peek()); // 3
        System.out.println(pq); // [3]
        
    }
}
```

- PriorityQueue(Collections.reverseOrder()) : 우선순위 큐를 생성한다. 내림차순
```Java
import java.util.PriorityQueue;

class Main() {
    public static void main(String[] args) {
        PriorityQueue<Integer> pq = new PriorityQueue<>(Collections.reverseOrder());
        pq.add(1);
        pq.add(3);
        pq.add(2);
        
        System.out.println(pq); // [3, 2, 1]
        System.out.println(pq.remove()); // 3
        System.out.println(pq); // [2, 1]
        System.out.println(pq.poll()); // 2
        System.out.println(pq); // [1]
        System.out.println(pq.peek()); // 1
        System.out.println(pq); // [1]
    }  
} 

```
