# Provisioner

프로비지너는 프로바이더로 실행되지 않은 커맨드와 파일 복사 같은 역할을 수행한다.    
예를 들어 리눅스 VM을 생성하고 특정 패키지를 설치하거나 설정을 해야할 경우 사용한다.  
다만 실행된 결과는 state 파일에 저장되지 않으므로 프로비저닝에 대한 결과가 항상 같지 않다.

### local-exec
- `command` : 실행할 명령어 <<EOF EOF 사용가능
- `interpreter` : 명령어를 실행할 인터프리터
- `working_dir` : 명령어를 실행할 디렉토리
- `environment` : 환경변수

```BNF
variable "sensitive_content" {
    default = "secret"
    sensitive = true
}

resource "local_file" "foo" {
    content = upper(var.sensitive_content)
    filename = "${path.module}/foo.bar"

    provisioner "local-exec" {
        command = "echo the content of the file is: ${self.content}"
    }

    provisioner "local-exec" {
        command = "abc"
        on_failure  = continue
    }

    provisioner "local-exec" {
        when = destroy
        command = "echo 'destroying the file' ${self.filename}"
    }
}
```


### remote-exec
- `connection`: 연결 정보
  - `type` : 연결 유형 (ssh, winrm)
  - `user` : 연결 사용자
  - `password` : 연결 비밀번호
  - `host` : 연결 대상 주소
  - `port` : 연결 포트
  - `timeout` : 연결 시간 초과
  - `script_path` : 스크립트 경로
  - `private_key` : 개인 키
  - `certificate` : 인증서 개인키와 함께 사용함
  - `agent` : ssh-agent 사용 여부
  - `agent_identity` : ssh-agent 사용시 식별자
  - `host_key` : 원격 호스트 또는 서명된 CA 의 경결을 확인 하는 데 사용하는 키
  - `target_platform` : 대상 플랫폼 (linux, windows)
  - `https` : https 사용 여부
  - `insecure` : https 유효성 무시
  - `use_ntlm` : NTLM 사용 여부
  - `cacert` : CA 인증서
  - `bastion_host` : bastion 호스트
  - `bastion_user` : bastion 사용자
  - `bastion_password` : bastion 비밀번호
  - `bastion_port` : bastion 포트
  - `bastion_private_key` : bastion 개인 키
  - `bastion_certificate` : bastion 인증서

> **bastion**
> 내부와 외부 네트워크 사이에서 보안 역할을 하는 게이트웨이 호스트 서버를 말한다.

```BNF
## ssh.tf
resource "null_resource" "foo" {
    provisioner "remote-exec" {
        connection {
            type = "ssh"
            user = "root"
            password = var.password
            host = var.host
            port = 22
            timeout = "30s"
            script_path = "${path.module}/script.sh"
            private_key = file("${path.module}/key.pem")
            certificate = file("${path.module}/cert.pem")
            agent = true
            agent_identity = file("${path.module}/id_rsa")
            host_key = file("${path.module}/host_key")
            target_platform = "linux"
            https = true
            insecure = true
            use_ntlm = true
            cacert = file("${path.module}/ca.pem")
        }        
    }
}
```

```BNF
## bastion.tf
resource "null_resource" "foo" {
    provisioner "remote-exec" {
        connection {
            bastion_host = var.bastion_host
            bastion_user = var.bastion_user
            bastion_password = var.bastion_password
            bastion_port = 22
            bastion_private_key = file("${path.module}/bastion_key.pem")
            bastion_certificate = file("${path.module}/bastion_cert.pem")
            bastion_host_key = file("${path.module}/bastion_host_key")
        }        
    }
}
```

#### Null Resource
아무 작업도 수행하지 않는 리소스이다.
테라폼 프로비저닝 동작을 설계하면서 사용자가 의도적으로 동작을 조율해야 할 때 사용한다.
프로바이더가 제공하는 리소스 수명주기 관리만으로 해결하기 어렵기 때문이다.  
- 프로비저닝 수행 과정에 명령어 실행
- 프로비너저와 함께 사용
- 모듈, 반복무느 데이터소스, 로컬 변수와 함께 사용
- 출력을 위해 데이터 가공


#### File Provisioner
- `source(필수)`: 복사할 파일 경로
- `destination(필수)`:  복사될 파일 경로
- `content`: 파일 내용

```BNF
resource "null_resource" "foo" {
    provisioner "file" {
        source = "${path.module}/file.txt"
        destination = "/tmp/file.txt"
    }
       
    provisioner "file" {
        content = "Hello, World"
        destination = "/tmp/file.txt"
    }
}

```

#### terraform_data
1.4버전에서는 null_resource를 대체하기 위해 terraform_data가 추가 되었다.
자체적으로 아무것도 수행하지 않지만 null_resource와 다르게 별도의 프로바이더 구성이 없이 수명주기 관리자가 제공된다는 장점이 있다.


```BNF
resource "terraform_data" "foo" {
    triggers_replace= [
        aws_instance.bar.id,
        aws_instance.baz.id,
    ]
    
    input= "world"
}
output "terraform_data_output" {
    value = terraform_data.foo.output
}
```