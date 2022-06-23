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

<br>

## 4. UML, 순서도
(추가 예정)

<br>

## 5. 실행 화면 및 기능 설명
### 1️⃣ 실행 화면 사진 및 코드
|[파리만국박람회 소개 화면 코드 보기](https://github.com/Hugh-github/ios-exposition-universelle/blob/Step2/Expo1900/Expo1900/Controller/MainViewController.swift)|[한국 출품작 소개 화면 코드 보기](https://github.com/Hugh-github/ios-exposition-universelle/blob/Step2/Expo1900/Expo1900/Controller/ItemListViewController.swift)|[출품작 상세 소개 화면 코드 보기](https://github.com/Hugh-github/ios-exposition-universelle/blob/Step2/Expo1900/Expo1900/Controller/DetailViewController.swift)|
|:--:|:--:|:--:|
|![스크린샷 2022-06-17 오후 2 16 40](https://user-images.githubusercontent.com/50102522/174239413-e47d3df1-ca9a-499a-9b92-ca7b7559c75b.png)|![스크린샷 2022-06-17 오후 2 16 32](https://user-images.githubusercontent.com/50102522/174239434-f8f6b5cb-6c24-4e37-82d6-159f662d84f2.png)|![스크린샷 2022-06-17 오후 2 16 49](https://user-images.githubusercontent.com/50102522/174239460-f1b09bb5-ec27-465e-a4c0-4fd7728c619b.png)|

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

<br>

### 2️⃣ 고민했던 부분
- MVC 패턴을 적용하여 파일분리를 한 부분
- 코드로 레이아웃을 설정하는 부분

<br>

##  7. 참고 링크
- [Unable to activate constraint with anchors 오류 관련 링크](https://velog.io/@lina0322/iOSSwift-Unable-to-activate-constraint-with-anchors-%EC%98%A4%EB%A5%98-addSubview)
