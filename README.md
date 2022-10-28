# 🇰🇷 만국박람회 🇰🇷

## 📖 목차

1. [소개](#-소개)
2. [프로젝트 구조](#-프로젝트-구조)
3. [구현 내용](#-구현-내용)
4. [타임라인](#-타임라인)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅 & 어려웠던 점](#-트러블-슈팅--어려웠던-점)
7. [참고 링크](#-참고-링크)

## 🌱 소개

`Aejong`, `Rhovin`이 만든 만국박람회 앱입니다.

- KeyWords
  - stackView
  - tableView
  - segue
  - decodable
  - reuse cell
  - json
  - Dynamic Type


## 🛠 프로젝트 구조
### 📊 UML
![](https://i.imgur.com/AMTpKL2.jpg)


### 🌲 Tree

```
<Expo1900>
├── Controllers
│   ├── ItemCell.swift
│   ├── ItemDetailViewController.swift
│   ├── KoreanItemsViewController.swift
│   ├── MainViewController.swift
│   └── NavigationController.swift
├── Info.plist
├── Models
│   ├── Exposition.swift
│   └── Item.swift
├── NameSpace
│   └── Converter.swift
├── SupportingFiles
│   ├── AppDelegate.swift
│   ├── Base.lproj
│   │   └── LaunchScreen.storyboard
│   └── SceneDelegate.swift
└── Views
    ├── Base.lproj
    │   └── Main.storyboard
    └── ItemDetail.storyboard

```

## 📌 구현 내용

#### 화면 UI 구현
화면 UI를 구현할 때, 스토리보드와 코드를 이용하여 구현


#### 화면전환의 방식
프로젝트에서 `총 3개의 View`가 있어서 `2번의 화면전환`이 이루어지고  navigation방식을 통해 push,pop 된다.
Segue를 쓰는 방식과 VC를 생성해서 push해주는 방식으로 구현

- 메인 -> 한국의출품작 으로 화면이동할 땐 따로 데이터를 전달하지 않기 때문에 간단하게 버튼의 action에 `performSegue()`메서드를 넣어 segue를 통해 화면이 전환되게 구현
- 한국의출품작 -> cell상세 뷰 로 화면이동을 할 때에는 `UITableViewDelegate`의 `tableView()`메서드 내부에서 VC의 인스턴스를 생성해주고, cell에 해당하는 데이터를 전달되게 구현


#### 제네릭을 활용한 decode() 메서드 구현
`[Item]` 혹은 `Exposition` 타입의 형태로 디코딩해주는 메서드 decode()를 jsonDecoder.decode()메서드처럼 제네릭을 통해 파일 명만 입력하면 파일에 맞는 리턴타입이 나오도록 구현

```swift
// jsonDecoder.decode() 메서드 정의
open func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
```
---

위와 비슷한 방법으로 매개변수에 Model의 타입을 추가해준다면 Model 타입은 매개변수를 통해 결정
```swift
// 메서드 정의
static func decode<Model: Decodable>(_ file: String) -> Model? {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: file) else { return nil }
        
        let model = try? Converter.jsonDecoder.decode(Model.self, from: dataAsset.data)
        
        return model
    }

// 메서드 사용
exposition = Converter.decode(type: Exposition.self, "exposition_universelle_1900")
```



### 메인화면 세로로만 볼 수 있게 구현
앱 딜리게이트를 이용하는 방법을 통해 첫 번째 화면만 세로로 볼 수 있게 구현했지만 `모든 뷰 컨트롤러에서 딜리게이트를 사용해야 한다는 점`, `앱 딜리게이트와 결합도가 높아지는 점`을 이유로 네비게이션 컨트롤러 클래스의 `supportedInterfaceOrientations` 프로퍼티를 활용하는 방법으로 구현


1. 앱 딜리게이트를 이용하는 방법
    - 화면 회전을 위해서 `AppDelegate`에서 아래처럼 `supportedInterfaceOrientation: bool` 값을 설정해서, true일 경우 모든 회전이 가능, false일 경우 세로만 가능하도록 설정

``` swift
var shouldSupportAllOrientation = true

func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    if supportedInterfaceOrientations {
        return .all
    }
    
    return .portrait
}
```
 - 그리고 각 뷰컨트롤러에서 앱딜리게이트를 설정 및 뷰 라이프사이클에서 `appDelegate.shouldSupportAllOrientation` 변수를 true, false 하는 방법으로 메인화면은 세로방향 고정, 다른 뷰들은 모든방향이 가능하도록 설정


```swift
private var appDelegate = UIApplication.shared.delegate as! AppDelegate

override func viewWillAppear(_ animated: Bool) {
    appDelegate.shouldSupportAllOrientation = true또는 false
}

```
- 하지만 이런 방법은 모든 뷰 컨트롤러에서 앱딜리게이트와 라이프사이클을 설정해주어야 한다는 이슈가 있음. 그래서 2번째 네비게이션 컨트롤러를 이용하는 방법을 사용하여 구현

2. 네비게이션 컨트롤러를 이용하는 방법
    - 화면 회전을 위해서 `var supportedInterfaceOrientations: UIInterfaceOrientationMask` 변수를 오버라이딩하여 화면 회전 설정
    - 네비게이션 컨트롤러가 하위 뷰를 아래와 같은 방법으로 메인뷰는 세로만, 나머지는 모든방향이 가능하도록 설정

```swift
class NavigationController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.topViewController as? MainViewController != nil ? .portrait : .all
    }
}
```

3. 실행화면

| ![Oct-27-2022_10-29-13](https://user-images.githubusercontent.com/49301866/198180870-d84c0f63-925e-478e-83b9-68e737f52348.gif) |
| :----------------------------------: |



### 출품작 목록과 상세 두 화면 모두 가로로 회전했을 때도 정상적으로 표시될 수 있도록 구현

기본타입 셀은 이미지뷰의 크기를 조절할 수 없어 autolayout을 설정해주기 어려웠음. 그래서 `ItemCell`이라는 custom 셀을 활용해 autolayout을 설정

- 기본타입셀과 custom셀 화면 비교


| 기본타입(subtitle) 셀   |  custom 셀        |
| :------------------: | :--------------: | 
| ![](https://i.imgur.com/ERzX7D4.jpg)| ![](https://i.imgur.com/EvAQr2w.png)


- 계층구조

imageView와 Label들을 stackView로 설정하여 가로,세로로 보여지는 동안 imageView 혹은 Label묶음의 크기변화에 모두 반응하는 cell을 구현
|    ||
| :------------------: | :--------------: | 
| ![](https://i.imgur.com/JXdq3gU.png) | ![](https://i.imgur.com/ttKMjSK.png) |



### 모든 화면에 Dynamic Type을 적용
1. UI객체 Dynamic Type 설정
    - UI객체들 Dynamic Type 적용하였습니다. 스토리보드에 있는 UI객체는 아래와 같이 인스펙터 창에서 Dynamic Type 체크 설정
![](https://i.imgur.com/P5s29vy.png)
    - 코드로 작성한 UI객체는 `adjustsFontForContentSizeCategory`프로퍼티를 `true`로 설정

2. Label이 있는 UI객체 `numberOfLines`프로퍼티 0으로 설정
    - 글씨가 커지는 경우 레이블 텍스트가 여러줄로 표현될 수 있도록 `numberOfLines`를 0으로 설정

3. Label `lineBreak` 설정
    - 텍스트가 화면을 넘어가 짤리는 경우 ...으로 표현되는 것을 방지하기 위해 `lineBreak`을 `TrunkCase`에서 `Word Wrap` 또는 `Character Wrap` 으로 설정
    - 현재는 문자단위로 짤리는 `Character Wrap`으로 설정. 단어단위로 짤려야 하는게 좀 더 가독성이 좋은 경우는 `Word Wrap`을 사용할 예정

4. 실행화면
![](https://i.imgur.com/rI6fhk1.gif)


## ⏰ 타임라인


<details>
<summary>Step1 타임라인</summary>
<div markdown="1">       
    
- 221018: json포맷의 데이터와 매칭할 타입 구현
- 221019: Decode UnitTest 추가 및 Assets import
    
</div>
</details>

<details>
<summary>Step2 타임라인</summary>
<div markdown="1"> 
    
- 221019: 메인 뷰 구현
    - scrollView 내부에 stackView구현
- 221019: stackView내부에 코드를 통해 UI 추가
    - UILabel
    - UIImageView
    - UIButton 
- 221021: koreanItems 뷰 구현
    - tableView 데이터 연동
- 221021: segue를 통해 메인 -> koreanItems 뷰로 화면전환 구현
- 221021: itemDetail 스토리보드 추가
    - itemDetail 뷰 구현 Autolayout 제약 추가
    - VC 인스턴스 생성을 통한 화면전환
- 221025: Exposition모델의 가공된 프로퍼티 extension으로 분리
- 221025: jsonDecoder, numberFormatter namespace화
- 221025: decode() 메서드 제네릭을 활용해 통일
    
    
</div>
</details>

<details>
<summary>Step3 타임라인</summary>
<div markdown="1">       
    
- 221026: 커스텀 셀 itemCell 추가
- 221026: autolayout 설정
- 221026: NavigationController 클래스 추가
    - 뷰별로 orientation 설정
- 221026: 모든 화면에 DynamicType 적용
    
</div>
</details>


## 📱 실행 화면
| 네비게이션 이동   |  가로 / 세로 모드        | 다이나믹 타입   | 
| :------------------: | :--------------: | :--------------:  |
| ![](https://i.imgur.com/IA0sjhx.gif) | ![가로모드 테스트](https://user-images.githubusercontent.com/73284068/198534965-dd10dc16-1aa1-429d-a65a-677417cafaba.gif) |    ![다이나믹타입 테스트](https://user-images.githubusercontent.com/73284068/198534983-3b28e844-0f04-4bf6-b2af-d9934d07726a.gif)
 


## ❓ 트러블 슈팅 & 어려웠던 점

 
### 클로저를 사용해서 속성을 한번에 정의할지, 객체를 생성한 후 속성을 설정하는게 좋은지 고민
> ### 💡 트러블슈팅
> 자주 바뀌지 않은 하는 속성일 경우(폰트와 폰트 사이즈 등) 클로저를 사용하여 객체를 생성하고, 레이블처럼 나중에 변경될 경우가 있는 속성일 경우 클로저 밖에서 설정.

```swift
let label: UILable = {
    let label = UILable()
    label.font = UIFont.preferredFont(forTextStyle: textStyle)
    
    return label
}()

label.text = text
```
### 화면전환 과정에서의 Optional Binding 처리에 관한 의문
VC객체를 생성해서 화면전환을 할 때 보통 optional binding을 해주라고 하는데, 스토리보드상의 뷰컨트롤러를 쓰려고 하면 왜 옵셔널을 처리해주지 않아도 되는건지 궁금했다. `instantiateViewController()`메서드의 기능은 identifier에 해당하는 뷰컨트롤러를 찾아 생성한다. 해당 identifier를 가진 뷰컨트롤러가 존재하지 않을 가능성도 있기 때문에 옵셔널타입이고 이를 binding해준다고 생각했다.
그럼 2번째 case처럼 UIStoryboard를 통해 인스턴스를 생성해줄 때, 그 안의 원하는 컨트롤러를 찾을 때에도 1번째 case와 마찬가지로 옵셔널 처리를 해주어야하지 않을까??

```swift
// 같은 스토리보드 내에서 VC를 생성해줄 때,
// itemDetailViewController를 옵셔널 바인딩처리해줘야 함
guard let itemDetailViewController = storyboard?.instantiateViewController(withIdentifier: "ItemDetailViewControllerID") else {
    return 
}
self.navigationController?.pushViewController(itemDetailViewController, animated: true)
```

```swift
// 다른 스토리보드 내에서 VC를 생성해줄 때,
// storyboard, itemDetailViewController가 옵셔널 타입이 아님
// 빌드는 문제없이 되지만, identifier를 잘못 입력할 경우 runtime 오류 발생
let storyboard = UIStoryboard(name: "ItemDetail", bundle: Bundle.main)
let itemDetailViewController = storyboard.instantiateViewController(withIdentifier: "ItemDetailViewControllerID")
self.navigationController?.pushViewController(itemDetailViewController, animated: true)
```
> ### 💡 트러블슈팅
> 공식문서를 살펴보면 `instantiateViewController()`의 리턴타입은 `옵셔널이 아니다`. 그 말은 옵셔널 바인딩을 해주는 이유가 `instantiateViewController()`때문은 아니라는 말.
>
> 위의 case에서 보여지는 차이점은 storyboard가 옵셔널인지 아닌지의 차이 뿐이다. 결국 storyboard가 nil이라면, 하위 메서드인 `instantiateViewController()` 또한 nil이 되기 때문에 결국 옵셔널 바인딩을 해주는 이유는 storyboard가 nil일 가능성이 있기 때문이다.


### 오토레이아웃 constraint 오류 발생
테이블뷰 화면에서만 세로모드에서 가로모드로 변경할 때 콘솔창에 긴 메세지가 출력 시뮬레이터가 멈추거나 런타임오류가 발생하는 건 아니지만 에러메세지로 보여짐.
![](https://i.imgur.com/ARg2ogz.gif)

> ### 💡 트러블슈팅
> 오류 메세지의 NSLayoutConstraint 을 복붙해서 [WTF Autolayout](https://www.wtfautolayout.com/) 에 넣어보고 어떤 오류인지 파악하기
> ![](https://i.imgur.com/2GBFfKq.png)





### tableCell을 선택해 상세페이지로 이동 후, 다시 tableView로 돌아왔을 때 여전히 회색으로 선택되어있는 문제
> ### 💡 트러블슈팅
> UITableViewDelegate에서 상세페이지로 넘어갈 때 해당 indexPath에 `deselectRow()`메서드를 호출

| deselect 전   |    deselect 후      |
| :------------------: | :--------------: | 
| ![](https://i.imgur.com/VzprqjZ.gif)| ![](https://i.imgur.com/lUtAV0Z.gif)

---

## 📖 참고 링크

[UITableView](https://developer.apple.com/documentation/uikit/uitableview) <br>
[Table Views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views) <br>
[Filling a Table with Data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data) <br>
[Configuring the Cells for Your Table](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table) <br>
[JSON](https://ko.wikipedia.org/wiki/JSON) <br>
[JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
<br> - [Using JSON with Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)
<br> - [Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
[LLDB 정복하기](https://yagom.net/courses/start-lldb/) <br>
[Swift Language Guide - Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html) <br>
[Swift Language Guide - Extentions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html) <br>
[Swift Language Guide - Closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html) <br>
[NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter) <br>

[🔝 맨 위로 이동하기](#-만국박람회-)
