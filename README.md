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
## 프로젝트 소개
<img src="https://user-images.githubusercontent.com/69573768/164358774-43cfd9af-7f44-4db0-b1fa-017a023d8352.gif" width="200">

---
## UML
![](https://i.imgur.com/uqOhKP2.png)

---

## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]() [![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]() [![xcode](https://img.shields.io/badge/iOS-14.0-yellow)]()

## 키워드
`json`, `Codable`, `CodingKeys`, `NSDataAsset`, `TableView`, `safe subscript`, `MVC`, `NameSpace`

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

#### name에 string literal이 그대로 들어가는 문제
"items"이나 "exposition_universelle_1900"에 string literal를 그대로 사용해도 되는지 아니면 관리를 하여 사용해서 사용하는 것중 어느것이 좋은지 궁금했습니다.

#### 개최지: 프랑스파리 를 표현하는데 레이블을 2개로 할지, attributedText를 사용해볼지

개최지 : 프랑스 파리 를 출력할때, 개최지만 다른 폰트를 가지고 있어서 해당 문제를 어떻게 해결할지 고민했습니다.

방법1 개최지 레이블 따로, 프랑스 파리 레이블 따로
방법2 하나의 레이블로 attributedText 이용

방법2로 했다가 방법1로 리팩터링 했습니다

#### tableView에서 list가 필요해서 선언할때

예를들어 HeritageViewController에는 TableView에 표시할 데이터를 담아둘 배열인 heritageList가 있는데,
해당 리스트에는 json 파일로부터 decode한 [Heritage]가 들어가야 합니다

저희가 고민한게

- 아예 프로퍼티 기본값을 주는 방법
    - private let list = ParserManager<[Heritage]>.parser
- 옵셔널로 선언한 다음, 추후 초기화 해주는 방법
    - private var list: [Heritage]?
- 빈 배열로 선언한 다음, 추후 초기과 해주는 방법
    - private var list = Heritage
 
 Decodable extions의 parse 메서드 내부와 타입을 맞추기 위해 옵셔널로 초기화 해주는 방식을 선택 


#### required init fatal error

코드 베이스라서 어차피 required init이 불릴일은 절대 없다고 생각해서 fatalError()를 사용했는데 이래도 되는걸까요? 아니면 더 좋은 방법이 있을까요??

#### TableViewCell의 reuseIdentifier

문자열을 그대로 쓰는걸 피하기 위해, 예전 쥬스메이커에서 ViewController의 Storyboard Identifer를
아래와 같이 설정했었습니다

```swift
extension UIViewController {

  static var identifier: String {
    return String(describing: self)
  }
}
```

TableViewCell의 reuseIdentifier도 해당 방식과 비슷하게 해보았는데, 괜찮은 방법일까요? 혹시 더 좋은 방법이나 린생이 사용하시는 방법이 궁금합니다

```swift
extension UITableViewCell {

  static var identifier: String {
    return String(describing: self)
  }
}

```

#### 프로젝트 파일 그룹화에 관해서

파일을 관리할때 App Delegate, Scene Delegate도 따로 폴더에 넣어주는게 좋을까요..? 넣는다면 어떤이름이 좋을지 궁금합니다.. View도 Model도 Controller도 아닌거 같기도하고.. 또 Controller같기도 하고요

#### CellForRowAt 매서드의 return

tableView에서 cell을 guard let을 이용해서 얻어오는데 실패했을때도 UITableViewCell을 반환해야 하는데, 현재는 UITableViewCell()을 그냥 반환해주고 있습니다. 해당 방식에 문제가 있거나 혹시 더 좋은 방법이 있을까요?

이 부분에 있어서 다른분들께도 질문을 드리고 생각해봤는데, UITableViewCell()을 바로 반환하는 방식이 별로 좋은것 같지는 않은거같아요.
결정적으로 UITableViewCell()을 그냥 반환해버리면, 모두 비어있는 Cell 몇개가 생성되는데, 해당 Cell은 여전히 didSelectRowAt 매서드가 있기때문에, 여전히 select 이벤트를 처리해서 다음화면으로 넘어가더라구요..!

잘못된 Cell일때는 selection을 막는 식으로 구현해보려고 하는데, 이런식으로 접근하는게 맞을까요?


### 해결한점

#### Massive ViewController

View와 Controller를 분리해서 해결하였습니다
- View: only 드로잉
- Controller: model과 view를 바인딩

#### Magic Number/Literal

파일마다 enum으로 namespace를 만들어서 해결하였습니다

#### CodeBase 제약의 가독성 문제

MarkDown과 extension을 사용하고 View를 분리하여 해결하였습니다

#### unsafe subscript

Array를 extension해서 safe subscript 기능을 구현하여 해결하였습니다

#### MVC 구조 미준수

MVC 패턴에 따라서, Model이 업데이트 된후, Model -> Controller -> View를 통해 View가 업데이트 되도록 구조 변경하였습니다

#### 비동기 느낌으로 수정

ResultType과 Completion을 이용해서 데이터 parsing을 비동기 느낌으로 수정

---

## [STEP 3]

### 고민한점

#### 모델을 parse하는 곳의 위치

기존 Decodable Extension으로 하던 것을 아예 삭제하고, Controller의 request() 매서드에서 직접 요청하는 느낌으로 바꿨습니다 

```swift
private func request(name: String, completion: (Result<Expo, ParseError>) -> Void) {
    guard let data = NSDataAsset(name: name)?.data else {
      completion(.failure(.invalidName))
      return
    }
    do {
      let decodedData = try JSONDecoder().decode(Expo.self, from: data)
      completion(.success(decodedData))
    } catch {
      completion(.failure(.decodeFail))
    }
}
```

실제 사용

```swift
request(name: Const.File.name) { result in
  switch result {
  case .success(let data):
    expo = data
  case .failure(let error):
    showAlert(errorMessage: error.localizedDescription)
  }
}
```

### 해결한점

#### stackView 내부의 image의 width와 heigth의 제약을 추가할시 제약 오류가 발생하는 문제 
```swift
stackView.alignment = .center
```
이와 같이 stackView의 내부의 image의 위치를 특정 해주어야 오류가 발생하지 않습니다.

#### NavigationBar를 Custom 하는법

```swift
let navigationAppearance = UINavigationBarAppearance()
navigationAppearance.configureWithDefaultBackground()
UINavigationBar.appearance().standardAppearance = navigationAppearance
UINavigationBar.appearance().compactAppearance = navigationAppearance
UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
```

이런 코드로 가능했습니다. 이 부분은 공부를 더 해봐야 할 것 같네요

#### StackView 내부 뷰들을 StackView의 margin 기준으로 배치하는 법

stackView의 isLayoutMarginsRelativeArrangement 속성을 true로 설정하면 하위 뷰들은 모두 마진기준으로 배치되는걸 배웠습니다 :)

#### 특정 ViewController에서만 화면 방향을 바꾸는법
```swift 
import UIKit

class ExpoNavigationController: UINavigationController {
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    if self.topViewController as? ExpoViewController == nil {
      return .all
    } else {
      return .portrait
    }
  }
}
```
고정하고자 하는 ViewController에서 viewWillAppear때마다 강제고정이 되도록 구현
```swift
private func fixDevice(orientation: UIDeviceOrientation) {
    let value = orientation.rawValue
    UIDevice.current.setValue(value, forKey: Const.Device.orientation)
}
```

위와 같은 코드로 ExpoViewController에서만 화면을 세로로 고정하였습니다.


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
