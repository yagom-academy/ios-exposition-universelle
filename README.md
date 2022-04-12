
# 🌃 만국 박람회
> 프로젝트 기간 2022.04.11 ~ 2022.4.22
팀원 : [@Doogie](https://github.com/doogie97) [@cherrishRed](https://github.com/cherrishRed) / 리뷰어 : [@TTOzzi](https://github.com/TTOzzi)


## UML
![](https://i.imgur.com/H8wuVgU.png)

## STEP1
### 기능구현
- `Item`, `Exposition` 구조체 구현
- `Decodable` 확장을 통한 `decode` 메서드 구현

### 고민했던 것들
#### 1. private(set)
![](https://i.imgur.com/5JbTLf9.png)
읽기 전용으로 접근제어를 설정해주고자 private(set)으로 설정하려고 했으나 let 자체가 읽기 전용이라 에러가 발생해 따로 접근제어를 걸어두지 않음

2. decoder 위치
- model VS viewcontroller
일반적인 디코딩 예제 코드에서는 decode 를 View Controller 에서 많이 처리 하는 것을 확인 했으나  데이터를 주관하는 부분은 되도록이면 모델이 있어야 한다고 생각해서 모델 쪽에 배치

### 의문점
![](https://i.imgur.com/t4cuROs.png)

[Self]? == Decodable? 로 인식이 돼서 정상적으로 반환이 되는 것 같은데 왜 배열타입과 Decodable타입이 동일 타입으로 취급되는 것인지 의문

## 배운 개념
- JSON
- Meta Type
- Asset

## PR 후 개선사항



## commit rule

커밋 제목은 최대 50자 입력
본문은 최대 72자 한글로 입력

💎feat : 새로운 기능 구현

✏️chore : 사소한 코드 수정, 내부 파일 수정, 파일 이동 등

🔨fix : 버그, 오류 해결

📝docs : README나 WIKI 등의 문서 개정

♻️refactor : 수정이 있을 때 사용 (이름변경, 코드 스타일 변경 등)

⚰️del : 쓸모없는 코드 삭제

🔬test : 테스트 코드 수정

📱storyboard : 스토리 보드를 수정 했을 때 
