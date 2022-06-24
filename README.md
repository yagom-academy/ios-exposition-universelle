
# 제목: 만국박람회 프로젝트

### 프로젝트 저장소
>프로젝트 기간 : 2022-06-13 ~ 2022-06-24
소개: TableView, ScrollView 와 JSON 데이터를 활용하여 만국 박람회 전시작을 볼 수 있는 어플리케이션의 제작
**리뷰어** : [**제이슨**](https://github.com/ehgud0670)

## 팀원
    
| 재재 | 보리사랑 |
|:---:|:---:|
|<img src = "https://i.imgur.com/NffqjhR.png" width = "75%" height = "30%">|<img src = "https://i.imgur.com/TeCoRmz.jpg" width="25%" height = "20%">|
|[Github](https://github.com/ZZBAE)|[Github](https://github.com/yusw10)|
    

---

## 타임라인: 시간 순으로 프로젝트의 주요 진행 척도를 표시

### Week 1
- **2022-06-13(월)** - STEP1 PR
  - Table View의 DataSource, Delegate에 대해서 고찰
  - 주어진 JSON 데이터를 토대로 인스턴스화 할 데이터 타입 작성
  - STEP1 Pull Request
 
- **2022-06-14(화)**
  - STEP2에 필요한 내용 개인 공부(TableView, JSON Data Handling)

- **2022-06-15(수)** - STEP1 Merged
  - 리뷰어 제이슨과 함께 STEP 1 리뷰(인스턴스의 테스트코드 작성법, Decodable, content.json의 의미)
  - STEP2 진행 방향 논의

- **2022-06-16(목)**
  - 첫번째 화면의 기초 레이아웃 설정(ScrollView)
  - 첫번째 화면 기능 구현(ScrollView 활용 및 박람회 정보가 담긴 JSON Data 디코딩)
  
- **2022-06-17(금)** - STEP2 PR
  - 두번째 화면인 박람회 전시물품 목록 화면 TableView기본 레이아웃 구현(예정)
  - 두번째 화면인 박람회 전시물품 목록 화면 TableViewCell 프로토타입 기본 레이아웃 구현
  - 두번째 화면인 박람회 전시물품 목록 화면 기능 구현
  - 세번째 화면인 박람회 세부정보 화면 기능 구현
  - Readme.md 작성

### Week 2
- **2022-06-20(월)** - STEP2 Merged
  - STEP2 Comment 관련하여 수정
- **2022-06-21(화)**
  - 첫번째 화면의 AutoLayout 수정
- **2022-06-22(수)** - STEP3 PR
  - 두번째, 세번째 화면의 AutoLayout 및 portrait 설정 완료
  - pull request
- **2022-06-23(목)**
  - 휴식
- **2022-06-24(금)**
  - STEP3 Comment 관련 수정
  - Readme.md 작성

---

## 프로젝트 내용

### 주요 기능
- JSON Data의 Decoding
- Scroll View를 활용하여 설명이 길어져도 내용을 스크롤링하여 전부 출력 가능
- Table View를 활용하여 전시품 목록들을 리스트화 하여 출력 가능
- AutoLayout을 활용하여 디바이스가 달라져도 레이아웃이 구성되게 조정
- Dynamic size를 적용

### 구현 기능
- **Util**
    - JsonDataDecoding : JsonData의 Decoding을 구현
    - NavigationItemManager : Navigation Bar의 title 과 button 설정
- **Models**
    - ExpoItemElement : 전시회 품목별 데이터 타입
    - Exposition : 전시회 정보 데이터 타입
- **View**
    - ExpoMenuTableViewCell : 전시품목 목록 화면 구성
- **Controller**
    - ExpoHomeViewController : 만국 박람회 소개 화면 구성
    - ExpoMenuViewController : 한국의 전시 물품 목록 화면 구성
    - DetailViewController : 전시 품목 상세 설명 화면 구성
- **ExpoItemModelsTests**
    - ExpoItemModelsTests : Json 데이터 디코딩을 확인하기 위한 테스트 클래스


### 실행 화면 (화면 별)
|**만국 박람회 소개 화면**|**한국의 전시 물품 목록 화면**|**전시 품목 상세 화면**
|:------:|:------:|:------:|
|![](https://i.imgur.com/2YQswtZ.gif)|![](https://i.imgur.com/LqY1AjF.gif)|![](https://i.imgur.com/2QQMybi.gif)|

### 실행 화면 (Dynamice Size 적용 시)
|**만국 박람회 소개 화면**|**한국의 전시 물품 목록 화면**|**전시 품목 상세 화면**
|:------:|:------:|:------:|
|![](https://i.imgur.com/4Badyvf.gif)|![](https://i.imgur.com/ndxA9vk.gif)|![](https://i.imgur.com/Ndxvx3c.gif)|


---


## [STEP 1 - 데이터 타입 정의](https://github.com/ZZBAE/ios-exposition-universelle/blob/step3/Docs/Step1.md)

---

## [STEP 2 - 전체 화면 UI 구성](https://github.com/ZZBAE/ios-exposition-universelle/blob/step3/Docs/Step2.md)

---

## [STEP 3 - AutoLayout 설정](https://github.com/ZZBAE/ios-exposition-universelle/blob/step3/Docs/Step3.md)


---

## 참고 


### 참고한 페이지
[Apple Developer Document - Codable](https://developer.apple.com/documentation/swift/codable/)
[Cory의 블로그 - ScrollView AutoLayout](https://corykim0829.github.io/ios/UIScrollView-with-storyboard/#)
[Apple Developer Document - TableView](https://developer.apple.com/documentation/uikit/uitableview/)
[boost course의 yagom 강의](https://www.boostcourse.org/mo326/lecture/18732?isDesc=false)
