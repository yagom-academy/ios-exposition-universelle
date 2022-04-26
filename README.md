
# 🌃 만국 박람회
> 프로젝트 기간 2022.04.11 ~ 2022.4.22
팀원 : 🐢[@Doogie](https://github.com/doogie97) 🔴[@cherrishRed](https://github.com/cherrishRed) / 리뷰어 : [@TTOzzi](https://github.com/TTOzzi)

- [프로젝트 소개](#프로젝트-소개)
- [개발환경 및 라이브러리](#개발환경-및-라이브러리)
- [키워드](#키워드)
- [STEP 1](#step1)
- [STEP 2](#step2)
- [STEP 3](#step3)
- [commit rule](#commit-rule)


## 프로젝트 소개
<div align="center">
<img title="전체적인 실행 화면" src="https://i.imgur.com/mI9HYgL.png" width="100">

**만국박람회의 설명을 확인하세요!
어떤 한국의 작품들이 있는지 자세히 볼 수 있어요!
큰 글씨도 지원합니다!**
</div>

<div align="center">
<img title="전체적인 실행 화면" src="https://i.imgur.com/pmQAz2n.gif" width="320">
<img title="Dynamic Type 적용 화면" src="https://user-images.githubusercontent.com/82325822/165224783-621b3e2a-aefb-44cb-b97e-317d220105b6.gif" width="150">
</div>


## 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.2-blue)]()

## 키워드
`JSON`,`MetaType`,`TableView`,`DynamicType`,`NSMutableAttributedString`,`의존성 주입`

## STEP1
[STEP1-PR](https://github.com/yagom-academy/ios-exposition-universelle/pull/140)
### 기능구현
- `Item`, `Exposition` 구조체 구현
- `Decodable` 확장을 통한 `decode` 메서드 구현

### 🚀 trouble shooting
#### 1. private(set)
![](https://i.imgur.com/5JbTLf9.png)
읽기 전용으로 접근제어를 설정해주고자 private(set)으로 설정하려고 했으나 오류가 났다.

✅ let 자체가 읽기 전용이라 외부에서 보았을 때는 private(set) 과 동일해, 접근제어를 걸어줄 필요가 없는 문제 였다. 

#### 2. decoder 위치
model VS viewcontroller
일반적인 디코딩 예제 코드에서는 decode 를 View Controller 에서 많이 처리 하는 것을 확인 했으나  decoder 에서는 UI 를 건드리는 부분이 없어 어디에 위치해야 하는지 의문이었다.

✅ 저희의 판단으로는 데이터를 권장하는 부분이 View Controller 있는 것이 좋지 않다고 판단해 `Decodable` 을 확장해 기능을 구현해 주게 되었다. 

#### 3. Decodable의 배열이 Decodable 의 메서드를 사용가능한 이유
![](https://i.imgur.com/t4cuROs.png)

[Self]? == Decodable? 로 인식이 돼서 정상적으로 반환이 되는 것 같은데 왜 배열타입과 Decodable타입이 동일 타입으로 취급되는 것인지 의문이었다.
✅
![](https://i.imgur.com/LWhZmPW.png)
 공식문서를 찾아보니 배열의 내부요소가 모두 Decodable 타입을 채택하면 그 배열도 Decodable 을 채택한다고 한다는 점을 발견했다.
 
#### 4. 디코딩에러 테스트
JSONDecode.decode 를 할경우 DecodingError 가 발생한다는 사실을 알게 되었다.
![](https://i.imgur.com/HMG0Ix0.png)
적절한 case 에 맞춰 에러가 발생하는지 테스트를 진행하려고 했으나 에러에 접근하는 방법이 의문이었다. 

✅ Error 에 접근한 방법
```swift 
func test_Exposition_decode호출시_잘못된파일명을대입할시_assetLoadError가발생하는지() throws {
    XCTAssertThrowsError(try Exposition.decode(with: "이상한이름")) { error in
        XCTAssertEqual(error as? DataLoadError, DataLoadError.assetLoadError)
        }
    }
```
저희가 생성한 에러 타입인 `DataLoadError` 에 접근 했을 때에는 `XCTAssertThrowsError` 메서드로 에러를 받고 `XCTAssertEqual` 로 비교해 테스트를 성공할 수 있었다. 

하지만 DecodingError는 Equatable을 채택하고 있지 않아 비교가 불가능 했다. 
```swift 
func test_프로퍼티의타입이잘못된객체에서_decode호출시_typeMismatch에러가발생하는지() throws {
    do {
        try DummyForWrongType.decode(with: "exposition_universelle_1900")
        XCTFail()
    } catch DecodingError.typeMismatch(let key, let value) {
        print(print("\n key: \(key) \n value: \(value) \n"))
    } catch {
        XCTFail()
        }
    }
```

그래서 do try 문을 사용해서 원하는 에러가 발생된 경우 해당 내용을 프린트 해 통과하게 만들었고 원하는 에러가 발생되지 않는 경우에는 실패하도록 테스트 코드를 변경하였다.


## 배운 개념
- JSON
- Meta Type
- Asset

***

## STEP2
[STEP2-PR](https://github.com/yagom-academy/ios-exposition-universelle/pull/149)
### 기능구현
- `View` 구성, `ViewController` 구성
- `Table` 뷰 구성 
- `JSON` 데이터를 뷰에 띄위기 


### 🚀 trouble shooting
#### 1. auto layout Y 포지션 or height 설정
스크롤 뷰의 높이를 따로 설정해 주지 않으면 `Y positin or height`가 필요하다는 오류가 발생 했다

✅ 이 오류의 해결 방안으로 두 가지 방법을 확인했다.

1. 높이 설정 후 priority 낮추기
![](https://i.imgur.com/xMawy3A.png)

2. Intrinsic Size 옵션 Placeholder로 바꿔주기
![](https://i.imgur.com/0Sa5q8g.png)

두 방법 중 Y 축만 지정해도 되기 때문에 첫번 째 방법을 사용해서 문제를 해결 했다.

#### 2. alert의 재사용성
```swift
    func showAlert() {
        let alert = UIAlertController(title: "오류", message: "데이터를 불러올 수 없습니다.", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
```
현재 프로젝트에서 위와 같이 얼럿을 나타내는 메소드를 두 개의 뷰컨트롤러에 각각 하나씩 구현되어 있는데 지금 프로젝트에서는 한번씩 밖에 사용을 하지 않아서 각 뷰컨트롤러에 생성을 했지만 이런 재사용성이 있는데 여러 곳에서 사용하는 메서드를 하나의 파일로 만들어서 관리를 해줘도 괜찮은지 고민이었다.

✅ 결국 `UIViewController` 의 `extension` 에 `showAlert()` 메서드를 만들어 재사용성을 높여주는 방법을 채택했습니다. 

### 배운 개념
- `defaultContentConfiguration`
- `TableView` 
- `TableViewDataSource`
- `TableVeiwDelegate`
- `ScrollView`

## STEP3
[STEP3-PR](https://github.com/yagom-academy/ios-exposition-universelle/pull/164)
### 기능구현
- `Dynamic Type` 적용
- `Dynamic Type`에 따른 스택뷰 axis전환
- 전체적인 AutoLayout 수정
- 첫번쨰 화면 세로모드로 고정, 가로모드 세부 설정


### 🚀 trouble shooting
#### 1. ViewController의 init (의존성 주입)
**[기존 코드]**
```swift
final class ItemViewController: UIViewController {
    @IBOutlet weak private var itemImageView: UIImageView!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    var item: Item?
```
위 코드에서 item에 데이터를 넣어주기 위해서는 `ItemViewController`의 인스턴스를 생성해 직접 접근을 해줬어야 했는데 그러면 외부에서 데이터가 변경되지 않도록 하는 접근제어 설정도 하지 못하고 또 직접 접근한다는 것을 문제점으로 말씀해 주셨고 `storyboard creator init`에 대해 공부해보길 권유해주셨다

```swift
final class ItemViewController: UIViewController {
    @IBOutlet weak private var itemImageView: UIImageView!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    private let item: Item
    
    init(item: Item) {
        self.item = item
        super .init(nibName: nil, bundle: nil)
    }
    
    init?(_ coder: NSCoder, _ item: Item) {
        self.item = item
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
```
✅ 그래서 공부 후 위 과정을 통해 `ItemViewController`의 init을 통해 item을 할당해주도록 했다.

#### ++ 추가 내용
```swift
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
```
fatalError는 일부러 크래쉬를 내는 메서드로 사용시 리젝사유에 해당한다고 한다
(생각해보니 일부러 크래쉬를 내는 행위 자체가 말이 안되는 듯..)
```swift
required init?(coder: NSCoder) {
    super.init(coder: coder)
    }
```
그래서 위와 같이 super를 통해 기존해 해주던 작업만 진행 할 수 있게 해주었으며 호출 부에서는

```swift
let itemVC = storyboard
    .instantiateViewController(identifier: ItemViewController.identifier,
                            creator: { coder -> ItemViewController? in
        return .init(coder, item)
    })
```
위와 같이 수정해 반환값을 옵셔널로 수정해 문제가 생기면 nil을 반환할 수 있게 해주었다.

이에따라
```swift
init(item: Item) {
    self.item = item
    super .init(nibName: nil, bundle: nil)
}
```
처음에는 nil을 반환하면 안될 것 같아서 nil이면 위 초기화 메서드를 통해 빈 뷰컨트롤러를 반환해주려고 했는데 위 코드는 더 이상 사용되지 않아 제거

#### 2. 프로토콜을 이용한 의존성 낮추기
`Heritage` 와 `ListViewController` 사이의 의존도가 너무 높은 것 같아 의존성을 낮춰보기로 하였다.

✅ `Item` 이라는 프로토콜을 생성해 의존도를 낮춰 보았다. 
`Heritage` -> <-`ListViewController` 이런 구조를 
`Heritage` -> `Item` <-`ListViewController` 이렇게 수정했다.

#### 3. AutoLayout(accessability 에 따른 정갈한 UI)
`accessability` 의 `dynamic font` 를 지원했습니다.
폰트의 크기가 너무 커지면 UI의 가독성이 현저히 떨어지는 문제를 발견했다.

✅
* main View 의 버튼이 위의 컨텐츠와 겹치지 않도록 `maximumContentSizeCategory` 사이즈를 `.accessibilityExtraLarge` 로 설정해 주었습니다. 
* 2번 째 스크롤 뷰의 `accessibilityExtraLarge` 사이즈 이상의 뷰에서는 사진과 글씨의 가독성을 위해서 stackView 를 세로로 돌리도록 설정했다. 

#### 4. 화면회전
✅ 첫번째 화면을 고정하기 위해서 다음과 같은 방법들을 사용했습니다. 
1. mainViewController 에서 AppDelegate 를 받아와서 고정을 해주었습니다.
2. AppDelegate 내부에서 mainViewController 를 받아와 고정해주기 
3. AppDelegate 와 mainViewController 사이의 객체를 만들어서 그 객체에서 고정해주는 메서드를 생성하기 
4. `supportedInterfaceOrientations` 메서드를 override 해서 화면 고정하기

1, 2, 3 과 같은 다양한 방법을 시도해 보았지만 AppDelegate 와 mainViewController 사이의 의존성이 높아 진다는 점등의 단점으로 사용하지 않았고 결국엔 `ExpoNavigationController` 와  `mainViewController` 에 아래의 메서드를 구현해 주어 문제를 해결했다.

```swift 
override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    guard let _ = self.topViewController as? MainViewController else {
        return .all
    }
    return .portrait
}
```

가로상태에서 2번째 화면으로 화면 회전이 일어났을 때 
회전이 되는 상황을 만들기 위해서 

`viewDidAppear` 에 `attemptRotationToDeviceOrientation` 메서드를 호출해 주었다.

```swift 
override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    UIViewController.attemptRotationToDeviceOrientation()
}
```

#### 5. 글씨 크기에 따른 제약 조건 변경
```swift
func changeItemStackViewSetting(){
        let category = UIApplication.shared.preferredContentSizeCategory
        switch category {
        case UIContentSizeCategory.accessibilityExtraLarge, UIContentSizeCategory.accessibilityExtraExtraLarge, UIContentSizeCategory.accessibilityExtraExtraExtraLarge:
            itemStackView.axis = .vertical
            labelStackView.leadingAnchor.constraint(equalTo: itemStackView.leadingAnchor, constant: 0.0).isActive = true
            labelStackView.trailingAnchor.constraint(equalTo: itemStackView.trailingAnchor, constant: 0.0).isActive = true
            itemImageView.widthAnchor.constraint(equalTo: itemStackView.widthAnchor, multiplier: 0.6).isActive = true

        default:
            itemStackView.axis = .horizontal
        }
    }
```
위코드는 글씨 크기가 바뀜에 따라 cell의 제약 조건을 바꿔주는 기능인데 
사실 이는 제약 조건을 바꿔주는 것이 아닌 글씨 크기가 바뀔 때 마다 새 제약 조건을 만들어 주는 것이라 계속 해서 쌓이게 된다.

✅ 
```swift
private lazy var labelLeadingConstraint = labelStackView.leadingAnchor.constraint(equalTo: itemStackView.leadingAnchor, constant: 0.0)
private lazy var labeltraillingConstraint = labelStackView.trailingAnchor.constraint(equalTo: itemStackView.trailingAnchor, constant: 0.0)
private lazy var ImageViewWidthConstraint = itemImageView.widthAnchor.constraint(equalTo: itemStackView.widthAnchor, multiplier: 0.6)

func changeItemStackViewSetting(){
        let category = UIApplication.shared.preferredContentSizeCategory
        switch category {
        case UIContentSizeCategory.accessibilityExtraLarge, UIContentSizeCategory.accessibilityExtraExtraLarge, UIContentSizeCategory.accessibilityExtraExtraExtraLarge:
            itemStackView.axis = .vertical
            labelLeadingConstraint.isActive = true
            labeltraillingConstraint.isActive = true
            ImageViewWidthConstraint.isActive = true

        default:
            itemStackView.axis = .horizontal
            labelLeadingConstraint.isActive = false
            labeltraillingConstraint.isActive = false
            ImageViewWidthConstraint.isActive = false
        }
    }
```
그래서 각각의 제약 조건을 변수로 생성하고 이를 활성화/비활성화 시켜주는 방식으로 변경하였다.

#### 6. 폰트 변경시 앞쪽 text로 범위 설정시 적용이 안되는 문제
<img src="https://i.imgur.com/xuDiYBW.gif" width="150">

```swift
private func changeFontSize(for expoInfo: Exposition) {
    let bodyFont = UIFont.preferredFont(forTextStyle: .body)
    visitorsLabel.changeFontSize(bodyFont, targetString: "방문객")
    locationLabel.changeFontSize(bodyFont, targetString: "개최지")
    durationLabel.changeFontSize(bodyFont, targetString: "개최 기간")
    }
```
<img src="https://i.imgur.com/llFBBuV.gif" width="150">


```swift
private func changeFontSize(for expoInfo: Exposition) {
    let bodyFont = UIFont.preferredFont(forTextStyle: .body)
    visitorsLabel.changeFontSize(bodyFont, targetString: ": \(ExpoNumberFormatter.changeVisitorsFormat(from: expoInfo.visitors) ?? "정보 없음")")
    locationLabel.changeFontSize(bodyFont, targetString: ": \(expoInfo.location)")
    durationLabel.changeFontSize(bodyFont, targetString: ": \(expoInfo.duration)")
    }
```

최초에 "방문객", "개최지" 등 이런 제목? 같은 곳에 다른 폰트를 적용해 주는 것이 코드도 길어지지 않고 보기 좋을 것 같아 그렇게 진행 했으나 구동 화면에서는 뒤쪽 부분이 dynamic type 적용이 되지 않는 문제가 있었다

리뷰어에게 물어보니
`attributedText가 적용되는 시점에 첫 번째 문자의 스타일 정보로 UILabel의 스타일 관련 프로퍼티들을 업데이트 한다고 합니다!` 
라는 말로 미루어 보아 적용되는 범위 이후의 문자 스타일은 적용이 되지 않아 위와 같은 현상이 일어난 것 같다

#### 7. 가로일 때 회전
<img src="https://i.imgur.com/4Ho93u1.gif" width="350">

처음부터 시뮬레이터를 가로로 두고 어플을 실행시키면 2번 화면으로 넘어갈 때 화면 회전이 일어나지 않음

-> 최초 실행시 기기의 방향이 변경되기 전에는 unknown을 반환하기 때문에 현재 기기의 화면 상태를 체크해주는 로직을 만들어야 하는데 어플 사용에는 큰 문제가 되지 않아 구현하지 않음

✅

## 배운 개념
- `의존성`
- `ViewController의 init`
- `dynamic type`
- `NSMutableAttributedString`


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

