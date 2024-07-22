# output

테라폼 프로비저닝 수행 후 결과 속성 값을 확인하는 용도로 사용된다.


### Example
```BNF
resource "local_file" "abc" {
    content  = "Hello, Terraform!"
    filename = "${path.module}/output.txt"
}

output "file_id" {
    value = local_file.abc.id #id: 리소스의 고유 식별자
}

output "file_abspath" {
    value = abspath(local_file.abc.filename) #abspath: 절대경로로 변환
}
```


