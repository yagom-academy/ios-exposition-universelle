# 만국박람회🇰🇷🇫🇷

## 목차
1. [소개](#1-소개)
2. [팀원](#2-팀원)
3. [타임라인](#3-타임라인)
4. [프로젝트 구조](#4-프로젝트-구조)
5. [실행화면(기능 설명)](#5-실행-화면기능-설명)
6. [트러블슈팅](#6-트러블-슈팅)
7. [참고링크](#7-참고-링크)
8. [개선할점](#8-개선할-점)

## 1. 소개
1900년 개최된 파리 만국박람회에 대한 정보와 한국 출품작의 설명을 보여주는 프로젝트입니다.

<br/>

## 2. 팀원

[팀 회고](https://github.com/Rhode-park/ios-exposition-universelle/blob/step03/%ED%8C%80%20%ED%9A%8C%EA%B3%A0.md)

|⭐️[Rhode](https://github.com/Rhode-park)|⭐️[Christy](https://github.com/christy-hs-lee)|
| :--------: | :--------: |
|<img height="180px" src="https://i.imgur.com/XyDwGwe.jpg">|<img height="180px" src="https://i.imgur.com/kHLXeMG.png">|



</br>

## 3. 타임라인
### 프로젝트 진행 기간
**23.02.20 (월) ~ 23.02.24 (금)** 

| 날짜 | STEP | 타임라인 |
| --- | --- | --- |
|23.02.20 (월)| STEP1 | - Json Decoding과 UITableView 학습 | 
|23.02.21 (화)| STEP1 | - Json 데이터와 매칭할 모델 타입 구현</br> |
|23.02.22 (수)| STEP2 | - ItemViewController에서 tableView 구현</br>- Json Decoding 후 tableView cell에 데이터 전달 |
|23.02.23 (목)| STEP2 | - ExhibitItemViewController 구현</br>- 화면간 데이터 전달 구현</br>|
|23.02.24 (금)| STEP2 | - 컨벤션 및 변수명 수정 </br>- 리드미 작성 |
|23.02.27 (월)| STEP2 | - NameSpace 구현 및 컨벤션 수정 | 
|23.02.28 (화)| STEP2 | - 화면 전달 방식 변경, 기능 분리 및 컨벤션 수정 |
|23.03.01 (수)| STEP2 | - 오타 수정 |
|23.03.02 (목)| STEP3 | - STEP3 예습 </br>- AutoLayout 및 Dynamic Types 적용 |
|23.03.03 (금)| STEP3 | - Decoder 구조체 수정 및 기능 분리 |

<br/>



## 4. 프로젝트 구조
### 폴더 구조
````
Expo1900
    ├── Extra
    │   ├── Decoder
    │   ├── IdentifierType
    ├── Resources
    │   ├── AppDelegate
    │   ├── SceneDelegate
    │   ├── Assets
    │   └── Info
    └── Sources
        ├── Model
        │    ├── ExhibitItem
        │    ├── ExpositionUniverselle
        │    └── NameSpace
        ├── View
        │    ├── Main
        │    └── LaunchScreen
        └── Controller
             ├── ExpositionViewController
             ├── ItemViewController
             ├── ExhibitItemViewController
             └── CustomTableViewCell    
````

<br/>

## 5. 실행 화면(기능 설명)

### dynamic Type: 작은 글자
| 박람회 홈 화면 | 출품작 화면 | 세부 출품작 화면 |
| :--------: | :--------: | :--------: |
| <img src="https://i.imgur.com/hgUjnzm.gif" width=250> | <img src="https://i.imgur.com/Taa7zyD.gif" width=250> | <img src="https://i.imgur.com/0ZLIDQL.gif" width=250>|


</br>

### dynamic Type: 큰 글자
| 박람회 홈 화면 | 출품작 화면 | 세부 출품작 화면 |
| :--------: | :--------: | :--------: |
| <img src="https://user-images.githubusercontent.com/61936306/222731596-10b8cc97-48c2-4b5b-8e26-471a1e928a63.gif" width=250> | <img src="https://i.imgur.com/3JxoaIr.gif" width=250> | <img src="https://user-images.githubusercontent.com/61936306/222731628-f9323a42-96ad-451a-82ec-2709c9cee553.gif" width=250>|

</br>

## 6. 트러블 슈팅
### 1️⃣ 카멜케이스와 스네이크케이스
json에서는 객체들을 스네이크케이스를 사용하여 나타내고 있었습니다. 이를테면 야곰 아카데미를 `yagom_academy`와 같은 식으로 표현하는 것입니다. Swift에서는 lower 카멜케이스를 사용합니다. `yagomAcademy`와 같은 식으로 표현합니다. enum 타입을 만들어 원래의 표현을 rawValue로 주고, 새로이 가지게 될 변수명을 case에 적어주었습니다. 

```swift
private enum CodingKeys: String, CodingKey {
    case name
    case imageName = "image_name"
    case shortDescription = "short_desc"
    case description = "desc"
}
```

이 때, `CodingKey`라는 프로토콜을 채택하게 됩니다: 

<img height="100px" src="https://i.imgur.com/eLhPRxC.png">

인코딩과 디코딩을 위한 키로 사용되는 타입입니다. 자동적으로 rawValue에 해당하는 값을 swift에 호환 가능한 새로운 변수명으로 바꾸어줍니다.

<br/>

### 2️⃣ 네비게이션바 hidden
**1st try**
첫 번째 화면에서는 네비게이션바가 보이지 않습니다. 그래서 첫 번째 화면에서는 네비게이션바를 감추고 나머지 화면들에서는 네비게이션바를 보여줘야합니다. 스토리 보드 상에서 다음의 인스펙터에서 `Hidden`에 체크를 할 수 있습니다:

![](https://i.imgur.com/DCmhs3T.png)

이렇게 할 경우, 다른 네비게이션바까지 모두 사라지는 문제가 발생했습니다.
그래서 맨 첫번째 뷰에서만 네비게이션바를 보이지 않게 코드를 작성했습니다:
```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.isNavigationBarHidden = true
}
```
`viewWillAppear`에 해당 코드를 넣은 이유는, 다음 화면으로 넘어갔다가 다시 돌아올 때 `viewDidLoad`가 아닌 `viewWillAppear`부터 사이클이 시작되기 때문입니다. 뷰의 라이프 사이클은 다음과 같습니다: 

<img height="300px" src="https://i.imgur.com/Vp09mAy.png">

</br> 이런 사이클을 가지기 때문에 `viewWillAppear`에 해당 코드를 넣어 현재의 화면으로 다시 돌아오면 네비게이션바가 없어지도록 만들었습니다.

다른 화면에서는 네비게이션바가 있어야하기 때문에, 다음 화면의 `viewDidLoad`에서 다시 `isNavigationBarHidden`를 `false`로 바꾸어주었습니다:

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    exhibitItems = decodeJson()
    self.tableView.reloadData()
    self.navigationController?.isNavigationBarHidden = false
    self.navigationItem.title = "한국의 출품작"
}
```

</br>

**2nd try**
관련 기능을 메서드로 따로 분리하였습니다:
```swift
//ExpositionViewController
private func hideNavigationBar() {
    navigationController?.isNavigationBarHidden = true
}

//ItemListViewController
private func hideNavigationBar() {
    navigationController?.isNavigationBarHidden = false
}
````

그리고 `isNavigationBarHidden`이 있는 곳의 통일성을 주기 위하여 각각의 viewController의 `viewWillAppear`에서 해당 메서드를 호출해주었습니다:
```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    hideNavigationBar()
}
```

</br>

**3rd try**
하나의 viewController에서 해당 기능을 관리할 수 있도록 다음과 같이 수정하였습니다:
```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    appDelegate?.shouldSupportAllOrientation = false
    configureNavigationBar(isHidden: true)
}

override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    appDelegate?.shouldSupportAllOrientation = true
    configureNavigationBar(isHidden: false)
}

private func configureNavigationBar(isHidden: Bool) {
    navigationController?.isNavigationBarHidden = isHidden
}
```
</br>

### 3️⃣ String 관리하기
String을 별도로 관리해주기 위하여 enum으로 NameSpace를 구현해주었습니다. 

struct와 enum 모두 NameSpace를 만들 수 있습니다. 그렇지만, struct로 만들 경우 인스턴스 생성이 가능해집니다. 물론, `private init() { }`를 사용하면, 그것을 막을 수 있습니다. 그렇지만, enum을 사용하게되면 그러한 작업 없이도 불필요한 인스턴스 생성을 막을 수 있기 때문에 enum으로 만들었습니다.

문자열 중간에 변수가 들어가는 것을 처리하기 위하여 format specifier의 개념을 사용해주었습니다. String은 %@로 Int는 %d로 대체하여 문자열을 구성할 수 있습니다.
그 결과 다음과 같은 NameSpace를 만들 수 있었습니다:
```swift
enum NameSpace {
    static let emptyString = ""
    static let homeViewTitle = "메인"
    static let itemViewTitle = "한국의 출품작"
    static let visitorCountText = "방문객 : %@ 명"
    static let locationText = "개최지 : %@"
    static let durationText = "개최 기간 : %@"
}
```
%@에 해당하는 변수는 다음과 같이, 이 NameSpace를 사용할 때 지정해줄 수 있습니다:
```swift
titleLabel.text = expositionUniverselle.title
visitorCountLabel.text = String(format: NameSpace.visitorCountText, expositionUniverselle.visitorCount.insertComma())
locationLabel.text = String(format: NameSpace.locationText, expositionUniverselle.location)
durationLabel.text = String(format: NameSpace.durationText, expositionUniverselle.duration)
descriptionLabel.text = expositionUniverselle.description
```

</br>

### 4️⃣ Identifier 관리

화면 전환과 데이터의 전송을 위해 `identifier`를 사용했습니다. 처음에는 직접 작성하는 방식의 하드코딩을 했습니다. 하지만 휴먼 에러를 발생할 가능성이 있어 안전한 방법을 찾고자 했습니다. 이후 `static let`키워드를 사용하여 `UIViewController`와 `UITableViewCell`이 자신의 `identifier`를 들고 있게 했습니다.

```swift
    final class ItemListViewController: UIViewController {
        static let viewIdentifier = "ItemListViewController"
        ...
    }

    class CustomTableViewCell: UITableViewCell {
        static let cellIdentifier = "cell"
        ...
    }
```

이후 protocol을 사용한 방법으로 수정했습니다. `identifier`를 컨트롤러의 이름과 동일하게 설정한 뒤 프로토콜을 활용하여 자신의 이름을 들고있게 할 수 있는 방법을 구현했습니다.

```swift
protocol IdentifierType {
    static var identifier: String { get }
}

extension IdentifierType {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController: IdentifierType { }

extension CustomTableViewCell: IdentifierType { }
```



</br>

## 7. 참고 링크
> - [Swift 공식문서 - UITableView](https://developer.apple.com/documentation/uikit/uitableview)
> - [Swift 공식문서 - UITableViewController](https://developer.apple.com/documentation/uikit/uitableviewcontroller)
> - [Swift 공식문서 - Filling a table with data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)
> - [Swift 공식문서 - UITableViewDataSource](https://developer.apple.com/documentation/uikit/uitableviewdatasource)
> - [Swift 공식문서 - UITableViewDelegate](https://developer.apple.com/documentation/uikit/uitableviewdelegate)
> - [Swift 공식문서 - instantiateViewController(identifier:, creator:)](https://developer.apple.com/documentation/uikit/uistoryboard/3213989-instantiateviewcontroller)
> - [Swift 공식문서 - String Format Specifiers](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html)
> - [부스트코스 - JSON 다루기](https://www.boostcourse.org/mo326/lecture/20146?isDesc=false)
> - [야곰닷넷 - 오토레이아웃 정복하기](https://yagom.net/courses/autolayout/)

<br/>

## 8. 개선할 점
### STEP 2
화면 구성 방식으로 스토리보드 방식을 채택해서 아쉬움이 남습니다. 스토리보드가 초기에는 직관적으로 보인다고 생각해서 그렇게 사용하게 되었습니다. 그러나, 프로젝트를 진행하다보니 스토리보드보다는 코드가 조금 더 직관적이고 명료하다고 느끼게 되었습니다. 그래서 코드로만 짜지 않은 것이 아쉽게 느껴집니다.

### STEP 3
StackView와 AutoLayout에 대해서 숙지되지 않은 부분이 있었던 것이 아쉽게 느껴집니다. 

<br/>

---
