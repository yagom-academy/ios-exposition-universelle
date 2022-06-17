
# 제목: 만국박람회 프로젝트

### 프로젝트 소개:
프로젝트 기간 : 2022-06-13 ~ 2022-06-24
소개: TableView, ScrollView 와 JSON 데이터를 활용하여 만국 박람회 전시작을 볼 수 있는 어플리케이션의 제작
**리뷰어** : [**제이슨**](https://github.com/ehgud0670)

## 팀원
    
| 재재 | 보리사랑 |
|:---:|:---:|
|![](https://i.imgur.com/NffqjhR.png)|<img src=https://i.imgur.com/TeCoRmz.jpg width=320>|
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
  
- **2022-06-17(금)**
  - 두번째 화면인 박람회 전시물품 목록 화면 TableView기본 레이아웃 구현(예정)
  - 두번째 화면인 박람회 전시물품 목록 화면 TableViewCell 프로토타입 기본 레이아웃 구현(예정)
  - 두번째 화면인 박람회 전시물품 목록 화면 기능 구현(예정)

### Week 2
- **2022-06-20(월)**
- **2022-06-21(화)**
- **2022-06-22(수)**
- **2022-06-23(목)**
- **2022-06-24(금)**

---

## 프로젝트 내용

### 주요 기능
- JSON Data의 Decoding
- Scroll View를 활용하여 설명이 길어져도 내용을 스크롤링하여 전부 출력 가능
추후 추가 예정

### 실행 화면(기능 설명)
1. **만국 박람회 소개 화면**
2. **한국의 전시 물품 목록 화면**
3. **전시 품목 상세 화면**
추후 추가 예정

---

## STEP 1

### STEP1 고민한 점 

**제이슨 리뷰**

- 소스 파일들을 어떤 폴더로 정리하시는지 궁금합니다. MVC를 예로 들면 모델끼리, 뷰끼리, 컨트롤러끼리 묶는지,아니면 한 뷰 컨트롤러가 담당하는 화면별로 MVC를 하나로 묶는지, 어떤 방식으로 파일을 계층화해서 정리하시는지 궁금합니다.
 
>  말씀주신것처럼 모델, 뷰, 컨트롤러끼리 묶는 경우도 있고 화면별로 모델, 뷰, 컨트롤러 폴더를 따로 묶는 경우도 있습니다.
화면이 너무 많아지다 보면 후자가 좀 더 파일 파악하기는 수월하더라고요. 그럼 고민해보시고 그룹 잘 나눠보시기 바랍니다 :)

- 포크해서 클론받은 작업물 중에 items.json을 구현해주었는데, Contents.json도 해주어야하는지 의문이였습니다. 해주지 않아도 된다면 이 Contents.json은 어떤 역할을 하는 건지 궁금합니다.

>Contents.json 도 결국 화면에서 쓰인다면 같이 모델링 작업 해주시면 좋습니다. 저의 경우에는 서버 api 로 내려오는 response들을 하나의 브랜치로 모두 처리했었는데 이러면 한꺼번에 모델링 처리하는 거라 나중에 다시 모델링 작업을 해줄 필요가 없어 좋았습니다. 따라서 같이 작업해주시면 좋을 듯 하네용 😄


### STEP1 트러블 슈팅

**JSON Data Decoding Test Code 작성에 관하여**

**제이슨 리뷰 중**
> 테스트 코드로 JSON 데이터가 모델로 잘 변환되는지 이번 PR에서 꼭 반영해주세요.</br>그래야 제가 리뷰어로서 어떤 데이터를 파싱하시는지 좀 더 파악이 될 것 같고 이해가 될 것 같아요.</br>그리고 여러분도 여러분이 작성하신 모델이 잘 파싱되는지도 확신할 수 있어서 안심이 되실 겁니다.

- 제이슨의 리뷰를 반영하여 테스트 코드를 작성하면, 어떤 JSON 데이터를 모델로 변환이 되는건지 확인할 수 있다는 장점을 생각하게 되었고 기존 step1에서 test code를 추가해주었다. 코드를 작성 후 간단하게 테스트를 해보면서 assets에 있는 JSON데이터가 잘 변환되는 것을 확인할 수 있었습니다. 또한 다음 스텝을 진행하면서 오류가 생긴다면, 이 부분에서는 따로 고칠 점이 없으니 다른 부분을 먼저 확인함으로써 프로젝트 진행시 더 원활한 진행이 가능할 것을 배웠습니다.


---
## STEP2

### STEP2 고민한 점

**ScrollView AutoLayout**

추후 작성예정??

---

## 참고 


### 참고한 페이지
[Apple Developer Document - Codable](https://developer.apple.com/documentation/swift/codable/)
[Cory의 블로그 - ScrollView AutoLayout](https://corykim0829.github.io/ios/UIScrollView-with-storyboard/#)
[Apple Developer Document - TableView](https://developer.apple.com/documentation/uikit/uitableview/)
[boost course의 yagom 강의](https://www.boostcourse.org/mo326/lecture/18732?isDesc=false)
