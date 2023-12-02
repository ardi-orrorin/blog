# 02.Condition

## 1. if문
### 1-1. if문의 기본 구조
- **if \[ 값1 조건 값2 \]** 대괄호 한쌍을 별도의 프로세서를 생성 후 결과를 얻는다. (대괄호 안 띄워쓰기 필수)
- if \[\[ 값1 조건 값2 \]\] 대괄호 두쌍은 현재 실행중인 프로세서에서 결과를 얻는다.

```Shell
if [ 값1 조건 값2 ]
then
    명령어
fi
```

```Shell
```
{src="/Language/shellScript/if.sh" include-lines="13-18"}


### 1-2. if 규칙
- 비교 조건은 정수형과 문자형을 구분해야 한다.

```Shell
```
{src="/Language/shellScript/if.sh" include-lines="24-27"}

```Shell
```
{src="/Language/shellScript/if.sh" include-lines="30-33"}

### 1-3. 다중 조건 elif

```Shell
```
{src="/Language/shellScript/if.sh" include-lines="37-42"}

### 1-4. 조건 종류
#### 1-4-1. 문자 비교
대소문자를 구분한다.

| 문자열 비교 | 설명 |
|:------:|:---:|
|   ==   | 문자열이 같으면 참 |
|   !=   | 문자열이 다르면 참 |
|   <    | 문자열1 < 문자열2 문자열1이 문자열2보다 사전적으로 앞이면 참 |
|   \>   | 문자열1 > 문자열2 문자열1이 문자열2보다 사전적으로 뒤면 참 |
|   -z   | 문자열이 0이면 참 |
|   -n   | 문자열이 0이 아니면 참 |

#### 1-4-2. 정수 비교
| 정수 비교 | 의미 | 설명 |
|:------:|:---:|:---:|
|   -eq   | equal | 값1과 값2가 같으면 참 |
|   -ne   | not equal | 값1과 값2가 다르면 참 |
|   -gt   | greater | 값1 > 값2이면 참 |
|   -ge   | greater equal | 값1 >= 값2이면 참 |
|   -lt   | less | 값1 < 값2이면 참 |
|   -le   | less equal | 값1 <= 값2이면 참 |



#### 1-4-3. 두개 이상의 조건
| 조건 |             설명             |
|:------:|:--------------------------:|
|   -a   |     && 연산과 동일, and 연산      |
|   -o   | \|        \| 연산과 동일, or 연산 |

#### 1-4-4. 파일 비교

| 파일 비교 | 설명 |
|:------:|:---:|
|   -d   | 파일이 존재하고 디렉토리이면 참 |
|   -e   | 파일이 존재하면 참 |
|   -r   | 파일이 심볼릭링크면 참 |
|   -s   | 파일이 읽기 가능하면 참 |
|   -w   | 파일이 쓰기 가능하면 참 |
|   -x   | 파일이 실행 가능하면 참 |
|   file1 -nt file2   | file1이 file2보다 최신 파일이면 참 |
|   file1 -ot file2   | file1이 file2보다 이전 파일이면 참 |
|   file1 -ef file2   | file1과 file2랑 같으면 참 |


## 2. Switch문
### 2-1. 기본 구조
```Shell
case 변수 in
    조건,값) 실행문 ;;
    조건,값) 실행문 ;;
esac   // esac는 case를 거꾸로 쓴것
```
```Shell

```
{src="/Language/shellScript/switch.sh" include-lines="9-14"}
