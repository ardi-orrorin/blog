# local

외부에서 입력 받지 않고 내부에서 선언되어 가공되어 사용되는 변수를 정의 할 때 사용한다.

locals를 사용하여 블록을 선언하며, locals내의 변수는 moudule 내에서 고유해야 한다.

```BNF
## main.tf
variable "prefix" {
    default = "hello"
}
 
locals { # 같은 모듈 안에서 변수를 사용할 때 사용
    name = "terraform"
    content = "Hello, ${var.prefix} ${local.name}!"
    my_info = {
        age = 20
        region = "KR"
    }
    my_nums = [1, 2, 3, 4, 5]
}

locals { 
    content = "content2" ## 에러
}
```

```BNF
## output.tf
output "content" {
    value = local.content
}
```