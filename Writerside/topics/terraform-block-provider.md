# provider

## 프로바이더 요구사항 정의

- required_providers 블록을 사용하여 특정 버전의 프로바이더를 요구할 수 있다.
- required_version 속성을 사용하여 특정 버전 이상을 요구할 수 있다.
- source : "[호스트주소/네임스페이스]/유형" 속성을 사용하여 프로바이더의 소스를 지정할 수 있다.
- version 속성을 사용하여 프로바이더의 버전을 지정할 수 있다.

```BNF
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.0"
        }
    }

    required_version = ">= 1"
}
```