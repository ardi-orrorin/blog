# data

데이터 소스는 테라폼으로 정의 되지 않은 외부 리소스의 또는 저장된 정보를 테라폼내에서 참조 할 때 사용한다.

```BNF
resource "local_file" "abc" {
  filename = "${path.module}/example2.txt"
  content  = "Hello, World!"
}

data "local_file" "abc" {
  filename = local_file.abc.filename
}

resource "local_file" "def" {
  filename = "${path.module}/example3.txt"
  content  = data.local_file.abc.content
}
```

### Meta Arguments
- `depends_on` : 다른 리소스가 생성된 후에 생성되도록 하는 옵션 의존성 관계를 설정할 수 있다.
- `count` : 리소스를 여러개 생성할 수 있다.
- `for_each` : 리소스를 여러개 생성할 수 있다.
- `provider` : 리소스를 생성할 provider를 지정한다.
- `lifecycle` : 리소스의 생명주기를 관리하는 옵션


### Example

- `aws_availablility_zones` : 데이터 소스의 이름
- `available` : 데이터 소스의 이름
- `state` : 필수 속성으로 사용할 데이터 소스의 상태를 지정한다.

```BNF
data "aws_availablility_zones" "available" {
  state = "available"
}

resource "aws_instance" "example" {
  ami = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  availability_zone = data.aws_availablility_zones.available.names[0]
}
```

