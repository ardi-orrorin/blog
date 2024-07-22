# count

resource 또는  module에 count 정수값이 설정되면, 해당 리소스는 count 만큼 생성한다.
count로 생성되는 참조값은 count.index 로 접근 할 수 있다.

### Example-1
```BNF
resource "local_file" "abc" {
   count = 5
   content = "Hello, World!"
   filename = "${path.module}/file${count.index}.txt"
}
```

### Example-2
```BNF
variable "names" {
    type = list(string)
    default = ["a", "b", "c", "d", "e"]
}
resource "local_file" "abc" {
    count = length(var.names) ## names의 길이 
    content = "Hello, World! ${var.names[count.index]}" ## names의 index
    filename = "${path.module}/file_${var.names[count.index]}.txt"
}
```

