# CLI

## Environment Variables

- mac/linux/unix : `export VAR_NAME=value`
- windows : `set VAR_NAME=value`
- powershell : `$Env:VAR_NAME="value"`


### Log
stderr 로그에 대한 레벨을 정의, trace, debug ,info, warn, error, off를 설정할 수 있다.

- `TF_LOG` : terraform 실행시 로그 레벨을 설정
- `TF_LOG_PATH` : 로그를 파일로 저장할 경로를 설정
- `TF_LOG_CORE` : core 로그 레벨을 설정
- `TF_LOG_PROVIDER` : provider 로그 레벨을 설정


```BNF
## main.tf
resource "local_file" "abc" {
  content  = "abc12312321231333!"
  filename = "${path.module}/abc.txt"
}

```

```Bash
TF_LOG=trace terraform plan

2024-06-30T13:43:59.600+0900 [INFO]  Terraform version: 1.8.4
2024-06-30T13:43:59.600+0900 [INFO]  Go runtime version: go1.22.1
2024-06-30T13:43:59.600+0900 [INFO]  CLI args: []string{"terraform", "plan"}
2024-06-30T13:43:59.600+0900 [INFO]  CLI command args: []string{"plan"}
2024-06-30T13:43:59.613+0900 [INFO]  backend/local: starting Plan operation
2024-06-30T13:43:59.615+0900 [INFO]  provider: configuring client automatic mTLS
2024-06-30T13:43:59.629+0900 [INFO]  provider.terraform-provider-local_v2.5.1_x5: configuring server automatic mTLS: timestamp="2024-06-30T13:43:59.629+0900"
2024-06-30T13:43:59.643+0900 [INFO]  provider: configuring client automatic mTLS
2024-06-30T13:43:59.652+0900 [INFO]  provider.terraform-provider-local_v2.5.1_x5: configuring server automatic mTLS: timestamp="2024-06-30T13:43:59.652+0900"
2024-06-30T13:43:59.666+0900 [INFO]  backend/local: plan calling Plan
2024-06-30T13:43:59.666+0900 [INFO]  provider: configuring client automatic mTLS
2024-06-30T13:43:59.675+0900 [INFO]  provider.terraform-provider-local_v2.5.1_x5: configuring server automatic mTLS: timestamp="2024-06-30T13:43:59.675+0900"
2024-06-30T13:43:59.693+0900 [INFO]  backend/local: plan operation completed
```


### TF_VAR_name

TF_VAR_변수이름 입력 값 또는 default로 선언된 값으로 대체한다.

```BNF
variable "abc" {
    default = "abc"
}

output "abc_output" {
    value = "${var.abc}"
}

resource "local_file" "abc" {
  content  = "abc12312321231333!"
  filename = "${path.module}/abc.txt"
}
```


```Bash
TF_VAR_abc=-asd123 terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # local_file.abc will be created
  + resource "local_file" "abc" {
      + content              = "abc12312321231333!"
      + content_base64sha256 = (known after apply)
      + content_base64sha512 = (known after apply)
      + content_md5          = (known after apply)
      + content_sha1         = (known after apply)
      + content_sha256       = (known after apply)
      + content_sha512       = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0777"
      + filename             = "./abc.txt"
      + id                   = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + abc_output = "-asd123"
```

### TF_DATA_DIR
State 파일을 저장할 디렉토리를 설정한다.  

> 이미 init 한 상태에서는 변경하려면 플러그인을 설치하라고 에러가 발생한다.

```Bash
TF_DATA_DIR=./terraform_state terraform plan

Error: Required plugins are not installed
```

