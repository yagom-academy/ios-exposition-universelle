# 만국 박람회

## 1. 소개
- 파리 박람회에 대한 소개와 한국의 출품작을 확인할 수 있는 팜플렛 앱입니다.
- 앱 개발을 통해 코드로 TableView를 작성하는 법을 이해하고, JSON 파일을 파싱하여 데이터를 Cell에 추가하는 과정을 학습하였습니다.  

<br>

## 2. 팀원
- 🙋🏻‍♂️ 휴 @Hugh-github
- 🙋🏻‍♀️ 현 @seohyeon2

<br>

## 3. 타임라인
### 1주차
- 월 Step 0 ~ 1 : 저장소 포크 및 복제, 프로젝트에 필요한 JSON 모델 구현
- 화 Step 1 : JSON 모델 파일 리팩토링
- 수 Step 2 : 박람회 앱 첫 화면인 MainViewController 구현
- 목 Step 2 : 한국의 출품작을 보여주는 TableViewController 구현
- 금 Step 2 : 출품작 상세 설명을 보여주는 DetailViewController 구현

### 2주차
- 월 Step 2 : View와 Controller를 분리하는 방법에 대해 공부
- 화 Step 3 : 휴식!!
- 수 Step 3 : 각 화면별 회전 모드 설정 및 Dynamic Type 적용
- 목 Step 3 : JSON 데이터 디코딩 시 발생할 수 있는 에러 케이스 작성 및 반영
- 금 Step 3 : Step3 리팩토링
<br>

## 4. UML, 순서도
![UML](https://user-images.githubusercontent.com/50102522/175472687-32dc7cba-cd46-4861-af0d-bb6eba3e6293.png)



<br>

## 5. 실행 화면 및 기능 설명
### 1️⃣ 실행 화면 사진 및 코드
|[파리만국박람회 소개 화면 코드 보기](https://github.com/Hugh-github/ios-exposition-universelle/blob/Step2/Expo1900/Expo1900/Controller/MainViewController.swift)|[한국 출품작 소개 화면 코드 보기](https://github.com/Hugh-github/ios-exposition-universelle/blob/Step2/Expo1900/Expo1900/Controller/ItemListViewController.swift)|[출품작 상세 소개 화면 코드 보기](https://github.com/Hugh-github/ios-exposition-universelle/blob/Step2/Expo1900/Expo1900/Controller/DetailViewController.swift)|Dynamic Type 적용 화면|
|:--:|:--:|:--:|:--:|
|![스크린샷 2022-06-17 오후 2 16 40](https://user-images.githubusercontent.com/50102522/174239413-e47d3df1-ca9a-499a-9b92-ca7b7559c75b.png)|![스크린샷 2022-06-17 오후 2 16 32](https://user-images.githubusercontent.com/50102522/174239434-f8f6b5cb-6c24-4e37-82d6-159f662d84f2.png)|![스크린샷 2022-06-17 오후 2 16 49](https://user-images.githubusercontent.com/50102522/174239460-f1b09bb5-ec27-465e-a4c0-4fd7728c619b.png)| <img src="https://user-images.githubusercontent.com/102569735/175462914-11578d53-dd92-437a-92e5-c81de62b9973.gif" width="600" height="440"/> | 

<br>

### 2️⃣ 주요 기능

### 파리만국박람회 소개 화면
1. JSON 파싱
  - 모델에서 `DataManager`를 이용해 JSON 데이터를 파싱 
2. AddTarget
  - 버튼에 이벤트가 발생했을 때 다음 화면으로 전환
3. App Life Cycle
  -  ViewWillAppear, ViewDidAppear을 이해하고 Navigation bar를 원하는 시점에만 보일 수 있게 설정

### 한국 출품작 소개 화면
1. TableView
  - `UITableViewDataSource` 프로토콜의 필수 메서드에서, 파싱한 데이터를 Cell에 넣어주고 TableView에 등록
  - `init`에서 Cell 내부의 기본 Componets 및 제약사항을 추가하고 `accessoryType`을 이용해 화면 이동을 알려주는 item 구현
2. 데이터 전달
  - 화면 전환 시, 프로퍼티를 이용하여 데이터를 다음 화면으로 전달해 줌

### 출품작 상세 소개 화면
1. 레이아웃 및 데이터
  - 코드로 작성한 레이아웃을 설정하고 파싱된 데이터를 보여줌 

<br>

## 6. 트러블 슈팅
### 1️⃣ 겪었던 문제점 및 해결 방안
**Unable to activate constraint with anchors 오류**
- 문제점: view에 모두 등록되기 전에 레이아웃을 설정해주었더니 헤당 에러가 발생함
- 해결 방법: view를 먼저 등록한 후에 레이아웃을 설정해주어 해결 함
- 깨달은 점: view 등록 시, 등록 순서를 고려해야함을 깨달음 

**레이아웃 충돌 오류**
- 문제점: 코드로 레이아웃을 설정해주어도 반영이 되지 않은 문제를 겪음
- 해결 방법: `translatesAutoresizingMaskIntoConstraints`를 `false`로 설정하였더니 화면에 반영됨을 확인함
- 깨달은 점: 코드로 레이아웃 시, `translatesAutoresizingMaskIntoConstraints = false` 필수로 작성해야 함을 깨달음

**화면 고정 문제**
- 문제점: ItemListView가 가로 상태에서 MainView로 돌아가면 화면이 세로 모드로 고정이 안되는 걸 확인함
- 해결 방법: 우리가 만든 앱의 화면은 NavigationController의 `UIInterfaceOrientationMask`를 따르기 때문에 `supportedInterfaceOrientations`을 재정의해 각 화면에 원하는 모드를 설정해 주니 해당 문제를 해결함
- 깨달은 점: Controller의 흐름을 파악해 원하는 설정을 해주어야 한다. 

**JSON 데이터 파싱 문제**
- 문제점: JSON 데이터에 우리가 사용하려는 Key와 Value가 아닐 경우 파싱 시 에러가 발생함
- 해결 방법: JSON 데이터와 매칭할 모델에 생성자를 활용해 Key 또는 Value가 매칭되지 않을 경우 nil이 되도록 설정 그 후 filter를 통해 nil이 포함된 데이터는 제거
- 깨달은 점: 현재 우리는 정상적인 데이터를 가지고 프로젝트를 진행하고 있지만 비정상적인 데이터도 고려해 매칭할 타입을 설계하고 분류하는 작업을 해주어야 한다.
<br>

### 2️⃣ 고민했던 부분
- MVC 패턴을 적용하여 파일분리를 한 부분
- 코드로 레이아웃을 설정하는 부분
- 잘못된 데이터를 제외하고 정상적인 데이터만 반환하는 부분
- Dynamic Type을 적용해야 하는 부분
- 화면 회전을 설정하는 부분
- Button title에 Dynamic Type을 적용하는 부분
<br>

##  7. 참고 링크
- [Unable to activate constraint with anchors 오류 관련 링크](https://velog.io/@lina0322/iOSSwift-Unable-to-activate-constraint-with-anchors-%EC%98%A4%EB%A5%98-addSubview)
- [화면 고정 문제 관련 링크](https://velog.io/@wonhee010/%ED%8A%B9%EC%A0%95-ViewController%EC%97%90%EC%84%9C-%ED%99%94%EB%A9%B4-%ED%9A%8C%EC%A0%84-%EC%B2%98%EB%A6%AC)
