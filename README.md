# 🇰🇷 만국박람회 🇫🇷

> 프로젝트 기간 :  2023.06.26 ~ 2023.07.07


## 📖 목차

1. [소개](#1.)
2. [팀원](#2.)
3. [타임라인](#3.)
4. [다이어그램](#4.)
5. [실행 화면](#5.)
6. [트러블 슈팅](#6.)
7. [참고 링크](#7.)
8. [팀 회고](#8.)

<br>

<a id="1."></a>

## 1. 📢 소개

파리 만국 박람회에 대한 설명 페이지 하단에 **🇰🇷한국의 출품작🇰🇷**을 확인할 수 있습니다!
한국에서 **출품한 목록 리스트**와 **출품작의 상세페이지**를 확인해 보세요😄
    
    - 주요 개념: `UITableView`, `CustomTableViewCell`, `JSON`, `Coordinator Pattern`, `Dynamic Type`

<br>

<a id="2."></a>

## 2. 👤 팀원

| [Serena 🐷](https://github.com/serena0720) | [Zion 🐨](https://github.com/LeeZion94) |
| :--------: | :--------: | 
| <Img src = "https://i.imgur.com/q0XdY1F.jpg" width="300"/>| <Img src = "https://avatars.githubusercontent.com/u/24710439?v=4" width="300"/>|

<br>

<a id="3."></a>
## 3. ⏱️ 타임라인

|날짜|내용|
|:---:|---|
| **2023.06.26** |▫️ JSON Asset 추가 <br> ▫️ DTO ExpositionItem 생성 <br> ▫️ DTO ParisExpositionInformation 생성 <br> |
| **2023.06.27** |▫️ CodingKey 접근제어자 생성 <br> |
| **2023.06.28** |▫️ StoryBoard로 전체 화면 구현 <br> ▫️ CodeBase로 MainView 및 MainViewController 구현 및 AutoLayout 지정 <br>|
| **2023.06.29** |▫️ CodeBase로 KoreaEntryViewController 구현 <br> ▫️ KoreaEntryViewController의 TableView AutoLayout 지정 <br> ▫️ CodeBase로 EntryDetailViewController 구현 및 AutoLayout 지정 <br> ▫️ KoreaEntryDataSource 구현 <br> ▫️ UINavigationBarApperance 사용하여 NavigationBar 설정 <br> ▫️ Decoder 생성 <br> |
| **2023.06.30** |▫️ String Extension 생성 <br> ▫️ addAttributeBigFontForKeyword 함수 적용 <br> ▫️ CustomTableViewCell 추가 <br> ▫️ NavigatorBar Alpha값 조정 <br> |
| **2023.07.02** |▫️ CellIdentifiable 프로토콜 추가 <br> ▫️ 함수 명 수정 <br>|
| **2023.07.04** |▫️ 화면회전 제한 설정 <br> ▫️ Dynamic Type 적용되게 수정 <br> ▫️ CommonLabel 추가 <br> ▫️ ScrollView AutoLayout 수정 <br> ▫️ setBackgroundColor 추가 <br>|
| **2023.07.05** |▫️ MainViewController의 View를 CustomView로 대체 <br>  |
| **2023.07.06** |▫️ 화면회전 제한 로직 수정 <br> ▫️ Coordinator Pattern 적용 <br> |
| **2023.07.07** |▫️ 컨벤션 수정 <br> ▫️ TableViewCell AutoLayout 수정 <br> |

<br>

<a id="4."></a>
## 4. 📊 다이어그램
<Img src = "https://hackmd.io/_uploads/rJ7QHXBFh.png" width="700"/>


<br>

<a id="5."></a>
## 5. 📲 실행 화면

| 만국 박람회 동작 화면 | Dynamic Type 적용 |
| :--------------: | :-------: | 
| <Img src = "https://postfiles.pstatic.net/MjAyMzA3MDdfMTAx/MDAxNjg4NzA4NjIzODk4.4YuI1qp7LQf0236bATCVRWrQidzJOA2D7pY1WUrdxWMg.xWTWAgt7EVJ5jcGP6GmzlvHfEebeTxrG5aXXpPpLtC8g.GIF.sha0720/sdf.gif?type=w773" width="400"/> | <Img src = "https://postfiles.pstatic.net/MjAyMzA3MDdfNTUg/MDAxNjg4NzA3ODk0MTIy.332aXitqiKwrk0IqlghUcLrNLn3Y5_GvGgvZplStRu0g.FV0w_yJqOfuLPQMjeAcPbsWQVATAgNE4fIbp3eR51UIg.GIF.sha0720/KakaoTalk_Photo_2023-07-07-14-31-03.gif?type=w773" width="400"/>  |

| 화면 회전 | 
| :--------------: |
| <Img src = "https://postfiles.pstatic.net/MjAyMzA3MDdfMTIz/MDAxNjg4NzA3ODk0MjE4.j873RpDqqS5X-9rBsUhmUvoMGrJIVCJStDmrPJvStXMg.gAHcHoSCXXyJ-U3IPywHt-JonrSaxnEIRinfv443aVAg.GIF.sha0720/KakaoTalk_Photo_2023-07-07-14-30-41.gif?type=w773" width="800"/> |

<br>

<a id="6."></a>
## 6. 🛎️ 트러블 슈팅
## 고민한 부분
### 🔥 Item DTO Naming에 대한고민
DTO 중 한국 박람회의 출품 요소 각각의 정보를 담고 있는 Item DTO의 네이밍에 대해 고민했습니다.

제시된 Items.json에서의 네이밍대로 Items의 네이밍을 그대로 가져가볼까 싶었지만, 각각의 Item들에 대한 정보를 배열로 가지고 있는 json 키 값이 따로 존재하지 않았습니다. 따라서 각각의 Item에 대한 정보를 담고있을 수 있는 Item DTO를 만들어서 이를 Decoding시 [Item].self 와 같은 형태로 받아서 사용하기 위해서 Item DTO를 만들어서 관리하게되었습니다.

### 🔥 UITableViewCell vs. CustomCell
- step2의 조건사항중 `TableView`를 이루고잇는 `Cell`을 구현하기 위해서 `UITableViewCell`을 이용하려고 했지만 `ImageView`와 `Label` 사이의 `Spacing`을 원하는대로 각각의 `Cell`에 `Alignment`가 맞게 설정하는 방법이 따로 없어서 `CustomCell`을 만들어서 구현하게 되었습니다.

    `Modern Cell Configuration`을 참고하여 `UITableViewCell`을 이용해 Step2의 `Cell`을 구현하고자 했습니다. 하지만 `Configuration`을 통해 부여할 수 있는 옵션중 `imageView`와 `Label`사이의 `Spacing`을 동일하게 가져가거나, `imageView`의 크기를 고정시킬 수 있는 옵션이 따로 존재하지 않았습니다.

    따라서 Step2에서 요구하는 형상을 가진 `CustomCell`을 따로 만들어서 위의 문제를 해결할 수 있었습니다.

    기존의 사용하려 했던 Congifuration Code는 아래와 같습니다.
    ```swift
    func setExpositionEntryCell(information: ExpositionItem) {
        var content = defaultContentConfiguration()

        content.text = information.name
        content.secondaryText = information.shortDescription
        content.image = UIImage(named: information.imageName)
        content.imageProperties.maximumSize.width = 70
        content.imageProperties.maximumSize.height = 70

        contentConfiguration = content
        accessoryType = .disclosureIndicator
    }
    ```

### 🔥 Navigationbar Appearance
```swift
navigationController?.navigationBar.barTintColor = .red
```

- `UINavigationBar`의 배경색을 지정하기위해 위와 같이 코드를 작성했지만 원하는 동작을 얻을 수 없었습니다.(iOS 16.4 환경) 따라서 다른 지정방법이 있는지 구글링을 하던 도중 `UINaviagtioanBarAppearance` 항목을 발견하고 알게되었습니다.

    iOS 15 버전 부터는 위와 같은 일반적인 방법으로는 `NavigationBar`의 배경색을 지정해 줄 수 없다는 사실을 알게 되었고 iOS 14 버전의 시뮬레이터를 통해 확인해본 결과 사실임을 확인할 수 있었습니다.
    
    따라서 `UINavigationAppearance`를 상태에 맞게 지정하고 넣어줌에 따라서 원하는 배경색을 지정할 수 있습니다.

### 🔥 Coordinator Pattern 적용
`ViewController(이후 VC)`의 재사용성 및 `VC`의 `Serial`한 의존관계를 없애고자 `Coordinator Pattern`을 적용해봤습니다.

`MainVC` -> `KoreaEntryVC` -> `EntryDetailVC`로 의존하고 있는 기존 구조에서는 `MainVC`, `KoreaEntryVC`에서 넘어가는 다음 화면에 대해 불필요하게 알고있고 화면전환 자체를 부모에 해당하는 `NavigationController`를 통해 시키는 것이 옳아보이지 않았습니다. 따라서 프로그램 시작시 화면전환을 담당해주는 `AppCoordinator`을 두어 화면전환 및 `VC`를 생성하기 위해 사용하는 데이터를 주입해주는 역할을 담당하게 했고 그 결과 `VC` 모델을 들고있는 것이 아닌 전부 주입받아 `VC` 갱신하고 있기 때문에 `VC`의 재사용성 또한 증가했습니다.

### 🔥 LoadView 시점에 View 갈아끼기
`MainVC`에서 불필요한 `View` 계층을 없애주기위해 `ViewController.view`를 `MainView`로 갈아끼웠습니다.

현재 `MainVC`에서 `MainView` 이외의 `View Component`가 따로 존재하지 않으므로 `MainVC`에서는 불필요한 `View` 계층이 하나 존재하는 상태였습니다. 따라서 이러한 불필요한 `View` 계층을 삭제하고자 했습니다. 현재 `Interface Builder`를 통해 `View`를 만들고 있지 않으므로 `LoadView`를 `override` 하여 해당 타이밍에 `View`를 `MainView`로 바꿔줬습니다.

그 이유는 `LoadView`의 타이밍이 `View`를 만들어주는 타이밍이기도 하고 `ViewDidLoad`가 호출되기 전 즉, 메모리에 올라가있기 전 타이밍이기 때문에 해당 시점이 `View`를 바꿔주는데 가장 적당한 타이밍이라고 생각했습니다. 그 결과 불필요한 `View` 계층을 삭제하고 원하는 화면 `UI` 또한 구현할 수 있었습니다.

### 🔥 화면 회전 제한 설정
```swift
final class CommonNavigationController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let orientation = topViewController?.supportedInterfaceOrientations else {
            return self.supportedInterfaceOrientations
        }
        
        return orientation
    }
}
```
해당 `property`를 `override`하여 화면회전 제한을 설정했습니다.
현재 App의 구조상 최상위 `VC`를 `NavigationController`가 담당하고 있기 때문에 각 `VC`에서 정의한 화면 회전 제한 설정을 최상위 `VC`인 `NavigationController`에서 받아와서 제한을 각각의 `VC`에 맞게 설정해줄 수 있도록 했습니다. 

따라서 위와 같은 방식을 사용하게 될 경우 `supportedInterfaceOrientations` 값에 대한 `override`가 필요했으므로 `CommonNavigationController`라는 `Custom` `UINavigationController`를 구현하게되었습니다.

<br>


<a id="7."></a> 
## 7. 🔗 참고 링크
- [🍎 Apple Developer: API Design GuideLine](https://www.swift.org/documentation/api-design-guidelines)
- [🍎 Apple Developer: UILabel](https://developer.apple.com/documentation/uikit/uilabel)
- [🍎 Apple Developer: UITextView](https://developer.apple.com/documentation/uikit/uitextview)
- [🍎 Apple Developer: NSMutableAttributedString](https://developer.apple.com/documentation/foundation/nsmutableattributedstring)
- [🍎 Apple Developer: UIScrollView](https://developer.apple.com/documentation/uikit/uiscrollview)
- [🍎 Apple Developer: UINavigationBarappearance](https://developer.apple.com/documentation/uikit/uinavigationbarappearance)
- [🍎 Apple Developer: supportedInterfaceOrientations](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621435-supportedinterfaceorientations?changes=_2)
- [📘 BLOG: attributedText, NSMutableAttributedString](https://ios-development.tistory.com/359)
- [📘 BLOG: UINavigationBarappearance](https://developer.apple.com/documentation/uikit/uinavigationbarappearance)
- [📘 BLOG: How to allow landscape for single screen in your UIKit app](https://nemecek.be/blog/181/how-to-allow-landscape-for-single-screen-in-your-uikit-app)
- [📘 BLOG: iOS Device 방향 처리](https://velog.io/@wonhee010/특정-ViewController에서-화면-회전-처리)
- [📘 BLOG: Coordinator Pattern](https://zeddios.medium.com/coordinator-pattern-bf4a1bc46930)
- [📘 BLOG: UIViewController의 view를 CustomView로 대체하기](https://minsone.github.io/mac/ios/ios-replace-view-of-viewcontroller-to-customview)


<br>

<a id="8."></a>
## 8. 💭 팀 회고

<details>
<summary>팀 회고</summary>

### 👏🏻 우리 팀의 잘한 점
- 각자 프로젝트에 대한 이해를 선행한 후 함께 프로젝트를 진행하였습니다.
- 새로운 패턴을 적용해보고자 적극적으로 공부하였습니다.
- 안주하지 않고 새로운 것을 적용해보고자 끊임없이 고민하였습니다.

### 💜 서로에게 좋았던 점 피드백
- Dear. Serena 🐷
    - 많은 시간을 들여 노력하고 공부합니다.
    - 배움에 대한 열의가 강하고 이해가 될 때까지 공부합니다.
    
- Dear. Zion 🐨
    - 같이 공부할 수 있는 환경을 만들어줬습니다.
    - 어려운 개념도 이해하기 쉽게 설명해줬습니다.
    - 팀원을 세밀하게 잘 챙겨 줍니다.
    - 유쾌합니다😆
    
