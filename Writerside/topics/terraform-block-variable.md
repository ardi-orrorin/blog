# variable

입력 변수로 사용할 수 있는 값들을 정의합니다. 변수는 모듈이나 루트 모듈에서 사용할 수 있습니다.

## 우선 순위
1. CLI
2. default value
3. 환경변수 TF_VAR_name
4. terraform.tfvars
5. *.auto.tfvars
6. terraform.tfvars.json
7. cli -var "name=value"


## Meta Arguments

- `type` : 변수의 타입을 지정합니다. (예: string, number, bool, list, map, object)
- `default` : 변수의 기본값을 지정합니다.
- `description` : 변수에 대한 설명을 지정합니다.
- `validation` : 변수의 유효성을 검사하는 조건을 지정합니다.
- `sensitive` : 변수의 값을 민감한 값으로 설정합니다.
- `nullable` : 변수의 값을 null로 설정할 수 있습니다.


## Type Example

```BNF
## string
variable "string" {
    type = string
    description = "This is a string variable"
    default = "string"
}
```

```BNF
## number
variable "number" {
    type = number
    description = "This is a number variable"
    default = 42
}
```

```BNF
## bool
variable "bool" {
    type = bool
    description = "This is a boolean variable"
    default = true
}
```

```BNF
## list
variable "list" {
    type = list(string)
    description = "This is a list variable"
    default = ["one", "two", "three"]
}
```

```BNF
## object
variable "object" {
    type = object({
        name = string
        age = number
    })
    description = "This is an object variable"
    default = {
        name = "John"
        age = 42
    }
}
```

```BNF
## tuple
variable "tuple" {
    type = tuple([string, number])
    description = "This is a tuple variable"
    default = ["John", 42]
}
```

```BNF
## sesnsitive
variable "name2" {
    type = string
    description = "This is a name2 variable"
    sensitive = true
}
```




