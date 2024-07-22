# terraform_tutorial


```BNF
# main.tf

resource "local_file" "abc" {
  content  = "abc12312321231333!"
  filename = "${path.module}/abc.txt"
}

// 추가
resource "local_file" "def" {
  content  = "def!123333121!"
  filename = "${path.module}/def.txt"
}
 
```


```Shell
terraform init

terraform plan

terraform apply
```
