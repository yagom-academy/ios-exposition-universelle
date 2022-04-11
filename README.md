# 만국박람회 프로젝트 저장소

> 프로젝트 기간 2022.04.11 ~ 2022.04.22 </br>
팀원 : [@FirstDo](https://github.com/FirstDo) [@Taeangel](https://github.com/Taeangel) / 리뷰어 : [@린생](https://github.com/jungseungyeo)

## 목차

- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [개발환경 및 라이브러리](#개발환경-및-라이브러리)
- [키워드](#키워드)
- [STEP 1](#step-1)
    + [고민한점](#고민한점)
    + [해결한점](#해결한점)
- [STEP 2](#step-2)
    + [고민한점](#고민한점)
    + [해결한점](#해결한점)
- [STEP 3](#step-3)
    + [고민한점](#고민한점)
    + [해결한점](#해결한점)
- [그라운드 룰](#그라운드-룰)
    + [활동 시간](#활동-시간)
    + [코딩 컨벤션](#코딩-컨벤션) 

---
## UML
![](https://i.imgur.com/8E70lBc.png)

---

## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]() [![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]() [![xcode](https://img.shields.io/badge/iOS-14.0-yellow)]()

## 키워드
`json`, `Codable`, `CodingKeys`, `NSDataAsset`

## [STEP 1]

### 고민한점

#### parse 매서드의 구현

처음에는 Heritage, Expo 구조체 각각에 static parse 매서드를 구현했는데, 하나의 함수로 만드는게 좋을거 같아서 ParseManager<T: Decodable> 구조체를 만들고, parse를 구현했습니다.

Decode할 타입이 [Heritage], Expo 이기도 하고, 각 타입에 대한 assetName이 달라서 하나의 매서드로 구현할 수 없을 줄 알았는데, ParseManager<T: [Hertige]>.parse() 이런식으로 사용할 수 있다는걸 알아서, 하나의 매서드로 합칠 수 있었습니다.

근데 T에는 Decodable을 채택한 타입만 올 수 있는데, [Heritage]가 들어갈 수 있더라구요!  
Heritage 가 Decodable을 채택했기때문에, [Heritage]도 자동으로 Decoable이 채택된 것인지 궁금합니다

#### ParseManager 파일의 위치

해당 struct가 Model에 있는게 맞는지 궁금합니다..
Model도 View도 Controller도 아닌것 같은데, 따로 그룹을 만들어줘야 할까요?

### 해결한점 

#### 컨벤션에 맞지 않는 json 네이밍 수정

json을 decode할때, json의 key와 model의 프로퍼티 네이밍이 같아야 하는데, 컨벤션이 맞지 않아서 어떤식으로 해야하나 고민했습니다.  
enum CodingKeys를 구현하고, 해당 enum에 CodingKey 프로토콜을 채택하여 컨벤션에 맞는 네이밍으로 변경 하였습니다.

---

## [STEP 2]

### 고민한점

### 해결한점
---

## [STEP 3]

### 고민한점

### 해결한점

---

## 그라운드 룰

### 활동시간
변동사항이 있으면 DM을 보내줄 것

#### 1. 평일
- 오전 10:00: 의존모둠 스크럼
- 오전 10:30 ~ 오후 23:00: 프로젝트 수행

#### 2. 예외사항
- Taeangel: x
- dudu: 금요일 오후 6시 이후 불가능
---

### 공식 문서 및 세션 활동, 일정
- 전날 공부한 것을 공유
- 모르는 내용을 서로 묻기
- (공식 문서를 다 숙지할 때까지는) 마이크 음소거 후 공부
- 숙지 완료가 되면 프로젝트 진행
- 
---

### 코딩 컨벤션
#### 1. Swift 코드 스타일
[스타일가이드 컨벤션](https://github.com/StyleShare/swift-style-guide#%EC%A4%84%EB%B0%94%EA%BF%88)

#### 2. 커밋 메시지
#### 2-1. 커밋 Titie 규칙
```
feat: 새로운 기능의 추가
fix: 버그 수정
docs: 문서 수정
style: 스타일 관련 기능(코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
refactor: 코드 리펙토링
test: 테스트 코트, 리펙토링 테스트 코드 추가
chore: 빌드 업무 수정, 패키지 매니저 수정(ex .gitignore 수정 같은 경우)
add: assert 추가
```

#### 2-2. 커밋 Body 규칙
- 현재 시제를 사용, 이전 행동과 대조하여 변경을 한 동기를 포함하는 것을 권장
- 문장형으로 끝내지 않기
- title과 body 사이는 한 줄 띄워 구분하기
- titile line의 글자수는 50자 이내로 제한하기
- subject line의 마지막에 마침표(.) 사용하지 않기
- body는 72자마다 줄 바꾸기
- body는 어떻게 보다 무엇을, 왜 에 맞춰 작성하기
