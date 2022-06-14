# iOS 커리어 스타터 캠프

## 프로젝트 저장소
> 프로젝트 기간 
> 팀원: [@Groot-94](https://github.com/Groot-94), [@bradheo65](https://github.com/bradheo65)
리뷰어: [@ryan-son](https://github.com/ryan-son)

---
## 📑 목차
- [📈 프로젝트 소개](#📈-프로젝트-소개)
- [🚀 UML](#🚀-UML)
- [💡 키워드](#💡-키워드)

- [🧑🏻‍💻 그라운드 룰](#그라운드-룰)
    - [👨‍👦‍👦 협업 방식](##👨‍👦‍👦-협업-방식)
    - [⏰ 프로젝트 시간](##⏰-프로젝트-시간)
    - [📨 소통 방법](##📨-소통-방법)
    - [💻 코드 컨벤션](##💻-코드-컨벤션)
    - [🪵 브랜치 이름규칙](##🪵-브랜치-이름규칙)
    - [⌨️ 커밋 규칙](##⌨️-커밋-규칙)
    - [🏆 Disign Pattern](##🏆-Disign-Pattern)
    - [📚 참고문서](##📚-참고문서)
- [📝 핵심경험](#📝-핵심경험)
- [🎥 기능설명](#🎥-기능설명)
- [1️⃣ STEP 1](#1️⃣-STEP-1)
    - [고민한점](#STEP-1-고민한점)
    - [배운 개념](#STEP-1-배운개념)
    - [Review](#STEP-1-Review)
    - [Update](#STEP-1-Update)
---
## 📈 프로젝트 소개
1900년 파리 만국박람회에서 소개된 한국의 문화유산을 앱으로 확인해보자.
---
## 🚀 UML  
**[ClassDiagram]**

![image](https://user-images.githubusercontent.com/45350356/173483569-2689a921-3c4c-4864-845f-cf1d72a2cea1.png)
</br>
---
## 💡 키워드
- TDD
- Json

---
## 🧑🏻‍💻 그라운드 룰
### 👨‍👦‍👦 협업 방식

- 코드 작성 시 제약사항 준수
- git commit 시 Karma Style 준수
- 짝 프로그래밍으로 코드 작성 시 부담 없이 작성 후 토의
- 순서도(전반적인 흐름)와 UML(세부적인 내용) 작성
- 의견이 있을 경우 자신 있게 말하기 - 자기의 코드가 아니라 우리의 코드 !!

### ⏰ 프로젝트 시간
- 월, 목 : 14:00 ~ 22:00
- 화, 수 : 10:00 ~ 21:30
- 금 : 10:00 ~ 18:00
- 주말 : 유동적

### 📨 소통 방법

- 기본적으로 디스코드를 사용

### 💻 코드 컨벤션

- [Swift Statements](https://docs.swift.org/swift-book/ReferenceManual/Statements.html) 형식 준수
- 함수안에 있는 코드 다 붙이기
- 클래스 100줄, 함수 10줄 지키기
- extention, Mark Comment를 이용한 코드분리
- 매직넘버, 매직스트링 X

### 🪵 브랜치 이름규칙

- develop - 최종 코드 → develop에서 야곰 레포로 pr 보내고, 머지되면 main으로 이동
- 각 step 별로 브런치 생성 (ex. step1, step2, step3)

### ⌨️ 커밋 규칙

```
# [타입] : 제목

##### 제목은 최대 50 글자까지만 입력 ############## -> |

# 본문은 위에 작성
######## 본문은 한 줄에 최대 72 글자까지만 입력 ########################### -> |

# 꼬릿말은 아래에 작성: ex) #이슈 번호

# --- COMMIT END ---
# [타입] 리스트
#   feat    : 기능 (새로운 기능)
#   fix     : 버그 (버그 수정)
#   refactor: 리팩토링
#   style   : 스타일 (코드 형식, 세미콜론 추가: 비즈니스 로직에 변경 없음)
#   docs    : 문서 (문서 추가, 수정, 삭제)
#   test    : 테스트 (테스트 코드 추가, 수정, 삭제: 비즈니스 로직에 변경 없음)
#   chore   : 기타 변경사항 (빌드 스크립트 수정 등)
# ------------------
#     제목 첫 글자를 대문자로
#     제목은 명령문으로
#     제목 끝에 마침표(.) 금지
#     제목과 본문을 한 줄 띄워 분리하기
#     본문은 "어떻게" 보다 "무엇을", "왜"를 설명한다.
#     본문에 여러줄의 메시지를 작성할 땐 "-"로 구분
# ------------------

```

## 🏆 Disign Pattern
- MVC
---
## 📚 참고문서
- [UITableView](https://developer.apple.com/documentation/uikit/uitableview)
- [Table Views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)
- [Filling a Table with Data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)
- [Configuring the Cells for Your Table](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table)
- [JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
    - [Using JSON with Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)
    - [Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
- [LLDB 정복하기](https://yagom.net/courses/start-lldb/)
---
## 📝 핵심경험
- [x] Codable을 채택하여 JSON 데이터와 매칭할 모델 타입 구현
- [x] 스네이크 케이스 또는 축약형인 JSON 키 값을 스위프트의 네이밍에 맞게 변환
---
## 🎥 기능설명
### **ExpoInformation**
- exposition_universelle_1900.json 파일 JsonDecode를 위한 데이터 포멧 타입 구현. 
### **KoreaItems**
- items.json 파일 JsonDecode를 위한 데이터 포멧 타입 구현. 
---
## 1️⃣ STEP 1
### STEP 1 고민한점
- json Decoding 방식
- coding key 왜 써야 하는지??
- Json decode 테스트 nil 반환
- Json 파일을 어디에 저장해야 할지
### STEP 1 배운개념
- Json
- Assets
- Coding Key
### STEP 1 Review
### STEP 1 Update
