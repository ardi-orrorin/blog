# for-each


resource 또는 module에 for_each 블록을 사용하면, 해당 리소스는 for_each 블록에 정의된 키-값 쌍 만큼 생성된다.  
for_each 블록은 map 또는 set 타입의 변수를 사용한다.

### Example

```BNF
resource "local_file" "foreach" {
    for_each = {
        a = "content a"
        b = "content b"
        // c = "content c"
        d = "content d"
        e = "content e"
    }

    content = "Hello, World! ${each.value}"
    filename = "${path.module}/file_${each.key}.txt"
}
```

### Example-2

```BNF
resource "local_file" "foreach" {
    for_each = toset(["a", "b", "c", "d", "e"])

    content = "Hello, World! ${each.value}"
    filename = "${path.module}/file_${each.key}.txt"
}
```

