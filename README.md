# 만국박람회 프로젝트 저장소
> 프로젝트 기간 2022.04.11 ~ 2022.04.22 </br>
팀원 : [@Lingo](https://github.com/llingo) [@마이노](https://github.com/Mino777) / 리뷰어 : [@라자냐](https://github.com/wonhee009)

## 목차

- [STEP 1](#step-1)
    + [고민 및 해결한 점](#고민_및_해결한_점)
- [STEP 2](#step-2)
    + [고민 및 해결한 점](#고민_및_해결한_점)
- [STEP 3](#step-3)
    + [고민 및 해결한 점](#고민_및_해결한_점)
- [그라운드 룰](#그라운드-룰)
    + [스크럼](#스크럼)
    + [코딩 컨벤션](#코딩-컨벤션) 

---

## [STEP 1]
### 고민 및 해결한 점
- 서로 커뮤니케이션을 통해 코딩 컨벤션을 맞추는 것을 고민했습니다.
- Info.plist를 Resource 폴더로 옮기는 과정에서 Packaging의 절대경로가 표시되지 않는 문제가 발생했고 
한번 빌드를 해줘야 절대경로가 표시되는 것을 알 수 있었습니다.
- 로컬에 있는 json 파일에서 데이터를 가져오는 방법에 대해 고민했고 

1. 메인 Bundle에서 파일의 Path를 가져온 후 URL로 데이터를 가져오는 방법
2. 메인 Bundle의 url 메서드를 통해 데이터를 가져오는 방법
3. Asset에 넣을 경우 NSDataAsset을 통해 가져오는 방법

3가지 방법이 있었습니다.

```swift
if let path = Bundle.main.path(forResource: "exposition_universelle_1900", ofType: "json"),
   let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
  XCTAssertNoThrow(try decoder?.decode(Expo.self, from: data))
}

if let url = Bundle.main.url(forResource: "exposition_universelle_1900", withExtension: "json"),
   let data = try? Data(contentsOf: url) {
  XCTAssertNoThrow(try decoder?.decode(Expo.self, from: data))
}

guard let asset = NSDataAsset(name: "exposition_universelle_1900", bundle: .main) else {
  XCTFail("Expo Decode Failure")
  return
}
XCTAssertNoThrow(try decoder?.decode(Expo.self, from: asset.data))
```

### 조언 받고 싶은 점
- Asset과 Info.plist 파일의 위치를 기존에는 View 폴더에서 관리 했었는데 Resource로 빼는 것에 대해 어떻게 생각하시는 지 궁금합니다.
- if의 조건문이 길어졌을때 아래의 코드처럼 줄바꿈을 하는 것에 대해 어떻게 생각하시는 지 궁금합니다. 
다른 방법이 있다면 조언 부탁드립니다! 🙇🏻 🙇🏻 🙇🏻
```swift
if let path = Bundle.main.path(forResource: "exposition_universelle_1900", ofType: "json"),
   let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
  XCTAssertNoThrow(try decoder?.decode(Expo.self, from: data))
}
```

---

## [STEP 2]
### 고민 및 해결한 점
- 요구사항에 오토레이아웃은 STEP 3부터 적용한다고 되어있었지만 보기에 불편하지 않게끔만 적용했습니다. 
- Decodable Extension으로 JSON 디코딩 기능을 분리하여 재사용할 수 있도록 했습니다.
- Asset을 가져오는 과정에서의 에러와 Decode 에러 처리를 분리하였습니다.
- 디코딩의 결과를 Result 타입을 통해 반환하여 ViewController에서 `success`, `failure` 케이스에 따라 사용할 수 있도록 했습니다.
- 테이블 뷰를 ViewController에 Delegate, Datasource로 생성하는 방법도 있지만 이번 프로젝트에서는 UITableViewController를 사용해봤습니다.
- Alert을 효율적으로 재사용하기 위해 Builder 패턴을 적용하여 AlertBuilder로 생성할 수 있도록 했습니다.
- 매직리터널을 제거하기 위해 상수로 분리했습니다.
- MainViewController의 크기가 다른 Label을 하나의 Label로 할지 Label를 분리할 지 고민하였고 
STEP 3에서 `AttributedText`를 사용해서 각 문자의 크기를 변경해보기로 했습니다.
- ViewController과 TableViewCell의 identifier를 사용하는 코드의 중복을 막기 위해 Extension으로 아래와 같이 분리했습니다.
```swift
extension UIViewController: UIViewControllerable {
  static var identifier: String {
    return String(describing: self)
  }
}

extension UITableViewCell {
  static var identifier: String {
    return String(describing: self)
  }
}
```

### 조언 받고 싶은 점
MainViewController의 네비게이션바를 MainViewController의 라이프사이클에서 hidden 처리를 했는데 더 좋은 방법이 있을 지 궁금합니다.
```swift
override func viewWillAppear(_ animated: Bool) {
  self.navigationController?.isNavigationBarHidden = true
}

override func viewWillDisappear(_ animated: Bool) {
  super.viewWillDisappear(animated)
  self.navigationController?.isNavigationBarHidden = false
}
```

---

## [STEP 3]
### 고민 및 해결한 점

**1. Alert**
범용성만을 위해 모든 기능을 구현하는 것은 오히려 개발자(팀원들)에게 혼란을 줄 수 있기 때문에 필요한 기능만 구현하도록 해야한다는 점에 대해 고민했습니다.

**2. 첫 화면은 portrait으로 고정, 다른 화면은 landScape 허용**
AppDelegate의 해당 메서드를 통해 MainViewController의 viewWillAppear에서 UIInterfaceOrientationMask을 portrait으로 고정 시켜준 뒤 viewWillDisappear에서 다시 모든 화면 전환이 가능하도록 고정을 풀어주어 해결하였습니다.

```swift=
func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?)
```

**3. Dynamic Type를 적용하여 사용자의 접근성을 높였습니다.**
Dynamic Type을 적용하는 과정에서 Label의 Font Size가 너무 커져버려서 글자가 짤리는 현상이 발생하는 Label들에 대해 adjustsFontSizeToFitWidth 프로퍼티의 값을 true로 설정하여 해결하였습니다.


**4. AttributedString**
`AttributedString`을 사용하여 텍스트의 특정 범위에 폰트를 다르게 줄 수 있다는 것을 알게되었고 공식문서를 참고하여 적용해봤습니다.

**5. ImageView의 사이즈에 대하여**
ImageView의 width를 설정해주면 자동으로 height를 원본 이미지 비율에 맞게 설정해준다고 생각했었습니다. 오토레이아웃을 잡아주며 공부해보니 ImageView는 처음에는 Intrinsic Size가 없다가 이미지를 넣어주면 이미지의 크기를 Intrinsic Size로 설정하는 것이었고 크기는 AspectFit, AspectFill과 같은 Content Mode에 따라 변경될 수 있다는 것을 알게되었습니다.

---

### 조언 받고 싶은 점
**1. Button titleLabel Dynamic Type 적용**
Button의 titleLabel의 Dynamic Type을 적용했을 때 FontSize를 컨트롤하는 부분을 titleLabel의 adjust관련 프로퍼티들과 autoShrink관련 프로퍼티들로 시도해보았으나 아직 해결하지 못하였습니다. 버튼의 경우 어떤식으로 해결하는것이 좋을까요?

**2. LandScape 상태에서 MainVC -> ExpoItemTableVC로 push되는 상황의 화면 전환**
현재 MainVC에서 landScape 모드로 다음 VC로 push 되는 경우에 자동으로 화면이 전환되지 않고 portrait 모드로 push가 된 뒤, 시뮬레이터의 디바이스 방향을 전환해야 landScape 모드로 전환되는 상황입니다. ExpoItemTableVC에서 MainVC처럼 강제로 방향을 전환하면 해결은 할 수 있지만, landScape의 방향(left, right)를 모르기 때문에 만약 디바이스의 방향이 landScapeLeft인 경우에 landScapeRight로 강제로 전환할 경우 같은 문제가 있습니다.

현재 디바이스의 방향을 확인해서 해당 방향으로 강제로 전환 시켜주는 방법이 있을까요?








---

## 🪧 Lingo, 마이노 팀 그라운드 룰
### ✏️ 스크럼
- 스크럼은 딱딱한 분위기보단 자유롭고 부드러운 분위기로 😋
- 매일 아침 10시 30분, 디스코드에서 진행
- 어제의 활동 리뷰
- 오늘 활동 예정 사항 / 목표
- 자신의 부족한 부분 / 우리 팀이 아쉬운 부분 토론
- 컨디션 공유 😰
- 공유하고 싶은 이슈, 꿀팁 공유
- 스크럼 진행시간은 최대 30분을 넘기지 않기 ⏱
- 상황에 따라 조정 가능

### 세션 있는 날
데일리 스크럼 + 18시 30분 ~ 진행
유동적

### 세션 없는 날
데일리 스크럼 + 13시 ~ 진행
유동적

---

## 🪧 프로젝트
프로젝트 협업 관련된 규칙 ( 지속적으로 업데이트 예정 ) / 야곰캠프에 있는 규칙을 기본으로 🤓

### 코딩 컨벤션
#### Swift 코드 스타일
코드 스타일은 [스타일쉐어 가이드 컨벤션](https://github.com/StyleShare/swift-style-guide#%EC%A4%84%EB%B0%94%EA%BF%88) 에 따라 진행한다.

### Commit 규칙
커밋 제목은 최대 50자 입력
본문은 한 줄 최대 72자 입력

### Commit 제목 규칙
- 기능(feat): 새로운 기능을 추가
- 버그(fix): 버그 수정
- 리팩토링(refactor): 코드 리팩토링
- 형식(style): 코드 형식, 정렬, 주석 등의 변경(동작에 영향을 주는 코드 변경 없음)
- 테스트(test): 테스트 추가, 테스트 리팩토링(제품 코드 수정 없음, 테스트 코드에 관련된 모든 변경에 해당)
- 문서(docs): 문서 수정(제품 코드 수정 없음)
- 기타(chore): 빌드 업무 수정, 패키지 매니저 설정 등 위에 해당되지 않는 모든 변경(제품 코드 수정 없음)

### Commit Body 규칙
제목 끝에 마침표(.) 금지
한글로 작성

### 브랜치 이름 규칙
`STEP1`, `STEP2`, `STEP3`

