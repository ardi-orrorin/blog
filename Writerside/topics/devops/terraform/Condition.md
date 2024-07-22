# Condition

테라폼에서의 조건식은 3항 연산자를 갖는다.

### Example-1
```BNF
var.example ? "12" : "hello"
var.example ? tostirng(12) : "hello"
```

### Example-2
```BNF
variable "enable_file" {
    default = true
}

resource "local_file" "foo" {
    count = var.enable_file ? 1 : 0
    content = "foo!"
    filename = "${path.module}/foo.txt"
}

output "content" {
    value = var.enable_file ? local_file.foo[0].content : "file is not enabled"
}
```