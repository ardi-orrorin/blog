# for

- list 타입의 경우 값 또는 인덱스 반환
- map 타입의 경우 키 또는 키와 값 반환
- set 타입의 경우 키 값 반환

### Example-1

```BNF
## variables.tf
variable "names" {
    default = ["a", "b", "c", "d", "e"]
}
```

```BNF
## output-base.tf
output "names" {
    value = for name in var.names : name
}
```

```BNF
## upper.tf
resource "local_file" "for_upper" {
  content  = jsonencode([for s in var.name_lower : upper(s)])
  filename = "${path.module}/for_file.txt"
}
```

```BNF
## index_value.tf
output "B_index_value" {
    value = [for i, v in var.name_lower : "${i}: ${v}"]
}
```

```BNF
## filter
output "D_with_filter" {
    value = [for v in var.name_lower : upper(v) if v != "c"]
}
```