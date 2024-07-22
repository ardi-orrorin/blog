# dynamic

count나 for_each같은 리소스 전체를 여러개 생성하는 것 외에도 리소스 내에서 선언된 구성 블록을 다중을 작성해야할 경우 사용한다.


### Example-1
```BNF
resource "provider_resource" "name" {
    name = "some_resource"

    dynamic "some_setting" {
        for_each = {
            a_key = a_value
            b_key = b_value
            c_key = c_value    
        }
        content {
            key = some_setting.value
        }
    }
}
```

### Example-2
```BNF

variable "names1" {
    default = {
        a = "hello a"
        b = "hello b"
        c = "hello c"   
    }
}

data "archive_file" "dotfiles" {
    type = "zip"
    output_path = "${path.module}/dotfiles.zip"

    dynamic "source" {
        for_each = var.names1
        content {
            content  = source.value
            filename = "${path.module}/${source.key}.txt"
        }
    }
}
```