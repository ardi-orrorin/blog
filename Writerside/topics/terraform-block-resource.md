# resource

## Description
선언된 항목을 생성하는 동작을 수행한다.예를 들어 aws ec2 instance를 생성하거나, 파일을 생성하는 등 다양한 동작을 수행할 수 있다.

```BNF
resource "local_file" "abc" {
  filename = "${path.module}/example.txt"
  content  = "Hello, World!"
}
```
- `local_file` : provider
- `abc` : resource name
- `"${path.module}/example.txt"` : 파일의 생성 경로 ${path.module}은 현재 모듈의 경로를 나타낸다. {path.module}는 현재 모듈의 경로를 나타낸다.
- `"Hello, World!"` : 파일의 내용


```BNF
resource "local_file" "def" {
  depends_on = [local_file.abc]
  filename = "${path.module}/example2.txt"
  content  = "def content"
}
```

- `depends_on` : 다른 리소스가 생성된 후에 생성되도록 하는 옵션 의존성 관계를 설정할 수 있다.

### Lifecycle
- 리소스의 생명주기를 관리하는 옵션
- 테라폼는 기본적으로 삭제 후 생성 방식을 사용하지만, 이를 변경할 수 있다.
- `create_before_destroy` : 리소스를 삭제하기 전에 새로운 리소스를 생성한다.
- `ignore_changes` : 변경 사항을 무시하는 옵션을 지정한다.

```BNF
resource "local_file" "life_cycle" {
  filename = "${path.module}/life_cycle1.txt"
  content  = "life cycledsfsdfsdfs"
  lifecycle {
    create_before_destroy = true
    ignore_changes = [
        content
    ] 
  }  
}
```

### Postcondition
- 리소스가 생성된 후에 조건을 검사한다.
- 조건이 참이 아니면 에러 메시지를 출력한다.

```BNF
resource "local_file" "post" {
  filename = "${path.module}/example5.txt"
  content  = ""

  lifecycle {
    postcondition {
      condition = self.content != ""
      error_message = "content must not be empty"
    }
  }
}
```

