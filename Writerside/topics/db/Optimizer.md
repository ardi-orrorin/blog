# Optimizer

## 규칙기준 옵티마이저 (Rule-based Optimizer)


### 최적의 경로 우선 순위

1. ROWID 1 ROW 액세스
2. 클러스터 조인에 대한 1 ROW 액세스
3. UNIQUE HASH Cluster로 1 ROW 액세스
4. UNIQUE INDEX로 1 ROW 액세스
5. Cluster 조인
6. Non Unique Hash Cluster Key
7. Non Unique Cluster Key
8. Non Unique 결합 Index
9. Non Unique 한 컬럼 Index 
10. 인덱스 범위
11. 인덱스 전체 범위
12. Sort Merge Join
13. Index Column Min/Max
14. Index Column Order By
15. 전체 테이블 스캔

