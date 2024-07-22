# moved

State에 기록된 리소스의 경우 변경 사항이 일어나면 리소스 삭제 후 새로운 리소스가 생성되는데, 
이 때 리소스의 상태를 그대로 유지하고 싶다면 moved 블록을 사용한다.

> terrafrom mv 를 통해 직접 State를 변경 할 수도 있다.

아래와 같은 사항에서 사용

- 리소스의 이름 변경
- count로 처리하던 반복문을 for_each로 변경
- 리소스가 모듈로 이동하여 참조하는 주소가 변경



```BNF
## 미리 만들어 놓은 리소스
resource "local_file" "a" {
    content = "foo!"
    filename = "${path.module}/foo.bar"
}
```

```BNF
## 리소스 이름 변경
resource "local_file" "b" {
    content = "foo!"
    filename = "${path.module}/foo.bar"
}

moved { # 리소스 이름 선언
    from = local_file.a
    to = local_file.b
}

output "file_content" {
    value = local_file.b.content
}
```

