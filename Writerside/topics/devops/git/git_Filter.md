# Filter


## Filter-branch

브랜치를 재작성할 수 있는 기능을 제공
재작성해야 하는 경우가 명확하지 않다면 Filter-branch 보다는 git filter -rep


### --subdirectory-filter
특정한 디렉토리 분리
```Shell
git filter-branch -f --subdirectory-filter 경로 -- --all
```

### --index-filter
특정한 파일 분리
```Shell
git filter-branch -f --index-filter \
"git rm --cached --ignore-unmatch 경로/파일" \
--prune-empty -- --all
```
