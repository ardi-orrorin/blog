# DFS

## Overview
깊이 우선 탐색(Depth-first-search)으로 그래프 완전 탐색 기법 중 하나

그래프의 시작 노드에서 한 분기를 정하여 최대 깊이까지 탐색 후 다른 쪽 분기로 이동하여 다시 탐색 하는 알고리즘이다.



- 깊이 우선 탐색 순서

![깊이 우선 탐색](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Depth-first-tree.svg/1280px-Depth-first-tree.svg.png) {thumbnail="true"}

- 탐색 순서

![](https://upload.wikimedia.org/wikipedia/commons/2/2c/Depthfirst.png) {thumbnail="true"}


## 특징
- 재귀 함수로 구현
- Stack 자료 구조 이용
- 시간복잡도 O(V+E)
- 한 번 방문한 노드는 다시 방문하지 않는다.




<seealso>
    <category ref="ref">
        <a href="https://ko.wikipedia.org/wiki/깊이_우선_탐색">위키백과 - 깊이 우선 탐색</a>
    </category>
</seealso>