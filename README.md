# iOS 커리어 스타터 캠프
# 만국박람회
> 대한민국의 1900 파리 만국박람회 출품작을 소개하는 어플리케이션
> 
> 프로젝트 기간: 2023.02.20 ~ 2023.03.03
> 

## 팀원
| Rowan | 리지 |
| :--------: |  :--------: | 
| <Img src = "https://i.imgur.com/S1hlffJ.jpg" width="200" height="200"/>      |<Img src ="https://user-images.githubusercontent.com/114971172/221088543-6f6a8d09-7081-4e61-a54a-77849a102af8.png" width="200" height="200"/>
| [Github Profile](https://github.com/Kyeongjun2) |[Github Profile](https://github.com/yijiye)


## 목차
1. [타임라인](#타임라인)
2. [프로젝트 구조](#프로젝트-구조)
3. [실행화면](#실행화면) 
4. [트러블 슈팅](#트러블-슈팅) 
5. [핵심경험](#핵심경험)
6. [팀 회고](#팀-회고)
7. [참고 링크](#참고-링크)


# 타임라인 
- 2023.02.20 : JSON Model 구현
- 2023.02.21 : ExpoViewConroller 구현, Model refactorng
- 2023.02.22 : ItemsEntryViewController, DescriptionViewController 구현
- 2023.02.23 : ViewController refactoring
- 2023.02.24 : refactoring, README.md 작성
<br>


# 프로젝트 구조

<details>
    <summary><big>UML</big></big></summary>
    
![ExopUML](https://i.imgur.com/wccGcUV.jpg)

</details>

<br>
<details>
    <summary><big>File Tree</big></big></summary>

```
└── Expo1900
    ├── App
    │   ├── AppDelegate
    │   └── SceneDelegate
    ├── Common
    │   └── NameSpace
    ├── Model
    │   └── JSON
    │       ├── ExpoUniverselle
    │       └── Item
    └── ViewController
    │   ├── DescriptionViewController
    │   ├── ExpoViewController
    │   └── ItemEntryViewController
    ├── Assets
    │   ├── AccentColor
    │   ├── AppIcon
    │   └── expo_assets
    ├── Base
    │   ├── LaunchScreen.storyboard
    │   └── Main.storyboard
    └── Info.plist
```



</details>

   
# 실행화면

- step3 완성 후 업데이트 예정입니다!

<br/>

# 트러블 슈팅
## Image Size
### 문제점
- `ItemEntryViewController`에서 이미지와 설명이 들어가는데, 이미지 사이즈가 다 제각각이여서 그걸 맞춰주는 것이 필요했습니다.
프로젝트 초기, 커스텀 셀을 구현한 것이 아니라 subtitle style의 셀을 사용하여 오토레이아웃을 사용할 수 없어 `UIGraphicsBeginImageContext(_:)`메서드로 이미지 자체의 크기를 다시 조정하여 만들어주도록 구현했습니다. 

```swift
  private func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage? {
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        image.draw(in: CGRectMake(0, 0, newWidth, newHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    
        return newImage
    }
```
- 이러한 image 자체의 사이즈를 조정하는 방법은 auto layout이 적용되지 않아 어플리케이션을 사용하는 기기가 바뀌었을 때 고정된 image size 때문에 화면의 크기와 맞지 않는 이미지가 출력될 것으로 예상됩니다.

<br/>

### 해결방안
- 추가예정

<br/>


----

## NavigationBar 관련 이슈

### 1️⃣ 화면전환시 첫 번째 화면에 navigationBar가 다시 나타나는 문제
NavigationBar를 숨기기 위해 `isNaviagtionBarHidden` 프로퍼티를 구현하여 사라지도록 `viewDidLoad()` 에서 설정하였습니다.
두 번째 화면에서 다시 첫 번째 화면으로 돌아올 때, navigationBar가 사라지지 않는 문제가 있었습니다. 

#### isNavigationBarHidden
- navigation bar를 보여줄지 숨길지 나타내는 Bool 타입

```swift
var isNavigationBarHidden: Bool { get set }
```
- default는 false이며 true면 navigation bar가 사라집니다.
- `setNavigationBarHidden(_: animated: )`를 사용하여 animated를 추가할 수도 있습니다.


### 해결방안

- view의 생명주기를 생각해보았습니다. 첫 번째 화면에서 `isNavigationBarHidden`의 설정을 `viewDidLoad` 메서드에서 했습니다. 이후 화면전환이 일어나면 `viewDidLoad`는 다시 실행되지 않기 때문에 NavigationBar가 사라지지 않았습니다. 따라서, `isNavigationBarHidden`의 설정을 첫 번째 화면이 screen에 표시되기 직전 호출되는 `viewWillAppear`에 구현하여 문제를 해결하였습니다.

### 2️⃣ backButton title 수정 문제
두 번째 혹은 세 번째 화면에서 이전 화면으로 돌아가려면 `navigationBar`의 `backButton`을 누르면 되는데, 이 버튼의 이름을 기본 `back`이 아닌 다른 이름으로 수정하고자 했습니다.
처음에 `backButton`이 보여지는 화면에서 `navigationItem.title`에 접근하여 수정하였는데, title이 수정되지 않는 문제가 있었습니다.

### 해결방안
- `back button`은 이전 화면의 navigationBar title로 설정되기 때문에 이전 화면의 `navigationItem.title`에 접근하여 수정하여 해결했습니다.


---
<br/>

# 핵심경험 

<details>
    <summary><big>1️⃣ JSON</big></summary>

JSON을 처음 활용하며 추가적으로 학습했던 내용입니다.

### Contents.json
다운로드한 zip 파일에서 Imageset 폴더안에있는 contents.json 파일이 어떤 목적으로 있는지 고민했습니다. 그래서 contents.json 파일에 대해 찾아보았습니다.

- ✏️ **Contents.json** : 개별 리소스 파일에 대한 **메타데이터**, 온디맨드 리소스 태그, 앱 슬라이싱 property 및 attribute
- ✏️ **metadata** : 데이터를 설명해주는 데이터. 대량의 정보 가운데에서 찾고 있는 정보를 효율적으로 찾아내서 이용하기 위해 일정한 규칙에 따라 콘텐츠에 대하여 부여되는 데이터이다. 구조화된 정보를 분석, 분류하고 부가적 정보를 추가하기 위해 그 데이터 뒤에 함께 따라가는 정보를 말한다.

처음에는 Contents.json 파일도 따로 타입을 정의해줘야 하는지 고민했으나 메타데이터이기 때문에 코드에서 활용할 일이 없다고 생각하여 타입을 정의하지 않았습니다.

---
<br/>

### imageset, dataset 파일의 차이
확장자가 imageset, dataset으로 나뉘어 있어 둘의 차이점에 대해 고민해보았습니다.

- ✏️ **dataset**
Xcode에서 생성된 장치 실행 코드(Mach-O)를 제외한 모든 종류의 데이터를 포함하는 파일의 집합.
프로젝트 JSON 파일을 Asset에 등록하여 사용하기 위해서 dataset으로 생성,삽입해야 합니다. 이후, 코드에서 dataset에 저장된 data를 사용하려면 `NSDataAsset` 타입 인스턴스를 생성해야 합니다.

- ✏️ **imageset**
UIImage 및 NSImage 인스턴스에 사용되는 named image asset의 그래픽 이미지 파일들.
프로젝트에 사용할 Image 파일을 Asset에 등록하여 사용하기 위해서 imageset으로 생성, 삽입해야 합니다. 이후, 코드에서 imageset에 저장된 image를 사용하려면 `UIImage`, `NSImage` 인스턴스를 생성해야 합니다.

```swift
// SwiftUI
let image = Image("ImageName")

// UIKit
let image = UIImage(named: "ImageName")

// AppKit
let image = NSImage(named: "ImageName")
```

---
<br/>

### Decodable
`JSON`파일을 변환할 수 있도록 일반적으로 `Codable` protocol을 채택합니다. `Codable` protocol의 구조를 확인해보면
```swift
typealias Codable = Decodable + Encodable
```
이므로 큰 차이는 없지만 JSON 파일을 디코딩하는 목적으로만 사용하기 때문에 `Decodable`만 채택하여 디코딩의 목적이라는 것을 명확하게 보여줄 수 있었습니다.

    
</details>

<details>
    <summary><big>2️⃣ 화면 간 데이터 공유</big></summary>

`DescriptionViewController`에서 선택된 셀의 `imageItem`, `description` 데이터가 필요했는데 JSON decode를 `DescriptionViewController`에서 다시 해주게 되면 선택된 셀의 데이터를 사용할 수 없었습니다. 그래서 다시 decoding을 하는것이 아니라 화면간 데이터 공유방법 중 하나인 `delegation` 패턴을 활용하여 `ItemEntryViewController`에서 데이터를 전달받았습니다.  `delegation` 패턴을 사용하면서 그 역할에 대해 다시 한 번 학습하였습니다.


### Delegation Pattern
iOS 개발에 자주 사용되는 디자인 패턴으로, UIKit에 구현된 class들에 기본적으로 구현이 되어 있는 경우가 있습니다. (UITableView, NSWindow 등)

Delegation 패턴을 사용하기 위해서는 Protocol의 사용이 필수적입니다. [Swift Language Guide - Protocol](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols/) 문서에서도 Delegation에 대한 설명을 확인할 수 있습니다. 

> _delegation_ 은 클래스 또는 구조체가 일부 책임을 다른 타입의 인스턴스에 전달(또는 위임) 할 수 있도록 하는 디자인 패턴이다. 이 디자인 패턴은 위임된 책임을 캡슐화하는 프로토콜을 정의하여 구현되며, 프로토콜을 준수하는 타입(`delegate`)이 위임된 기능을 제공하도록 보장된다. Delegation은 특정 작업에 응답하거나 해당 소스의 기본 타입을 알 필요 없이 외부 소스에서 데이터를 검색하는 데 사용할 수 있다.

<br/>

**▪️ Delegate의 역할**
Delegate의 역할은 크게 두 가지입니다.
* 데이터 공급 - protocol의 naming을 `...DataSource`로 한다.
* 이벤트 처리 - protocol의 naming을 `...Delegate`로 한다.

필요한 역할에 따라 protocol의 naming과 채택할 객체를 잘 설정해야 합니다.

<br/>

### 적용 방법
```swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let nextViewController = self
        .storyboard?
        .instantiateViewController(
            withIdentifier:"descriptionViewController"
        ) as? DescriptionViewController else { return }
        
    self.selectedItem = items[indexPath.row]
    nextViewController.dataSource = self
        
    self.navigationController?.pushViewController(nextViewController, animated: true)
    ...
}
```
1. 화면 전환할 때 생성한 `nextViewController` 인스턴스를 `DescriptionViewController`로 다운캐스팅.
2. 현재 선택된 셀의 `Item`을 `selectedItem` 프로퍼티에 할당.
3. `ItemEntryViewController`를 nextViewController의 `dataSource`로 할당. 

---
</details>
    
<details>
    <summary><big>3️⃣ Label 일부 크기 조정</big></summary> 

- 첫번째 화면에서 방문객, 개최지, 개최기간등 일부 Label의 크기가 달라 이를 조정할 필요가 있었습니다. Label의 일부를 변경하는 메서드가 있어 아래의 내용을 적용해보았습니다.

### NSMutableAttributedString
> 텍스트의 일부에 대한 관련 속성(예: 시각적 스타일, 하이퍼링크 또는 접근성 데이터)이 있는 변경 가능한 문자열.

```swift
private func convertTextSize(of label: UILabel, range: NSRange) {
        guard let target = label.text else { return }
        
        let fontSize = UIFont.systemFont(ofSize: 20)
        let attributedString = NSMutableAttributedString(string: target)
        
        attributedString.addAttribute(.font, value: fontSize, range: range)
        label.attributedText = attributedString
    }
```
- 텍스트의 일부 속성을 변경하기위해 `NSMutableAttributedString(String:)`을 attributedString 상수로 선언합니다.
- `addAttribute(_:value:range:)` 인스턴스 메서드를 사용하여 지정된 범위의 문자에 주어진 이름과 값을 가진 속성을 추가합니다.

<img src="https://i.imgur.com/vq2Cn9N.png" width="400">

- 띄워줄 label에 `attributedText` 메서드를 사용하여 변경된 속성을 부여해줍니다.
- range의 경우 index로 접근할수도 있고 특정 문자열을 입력하여 접근할 수도 있습니다.
   - NSMakeRange(Int,Int) : Int 부터 Int까지의 문자열, 지정된 값에서 새 NSRange를 만드는 메서드
   - range: (text as NSString).range(of: "특정문자열")
</details>
    

<details>
    <summary><big>4️⃣ UITableView - Modern Cell Configuration 적용</big></summary>

처음에`TableViewCell`에 올려져 있는 Label, detailTextLabel, imageView의 속성을 변경하기 위해 직접 접근하였습니다. 그러나 iOS 14 부터 `UIContentConfiguration`을 이용하도록 변경되어 기존 접근 방식을 권장하지 않는다는 것을 알게되어 `modern cell configuration`을 적용하였습니다.


### 적용방법

- cell에 defaultContentConfiguration()을 호출합니다.
- text, secondaryText, image를 설정하여 원하는 조건을 줍니다.
- cell의 contentConfiguration에 첫 번째 변수로 생성한 content를 넣어줍니다.

```swift
 private func setContents(of cell: UITableViewCell, at indexPath: IndexPath) {
    var customConfiguration = cell.defaultContentConfiguration()
        
    customConfiguration.secondaryText = items[indexPath.row].shortDescription
    customConfiguration.secondaryTextProperties.font = UIFont.systemFont(ofSize: 18)
    customConfiguration.secondaryTextProperties.numberOfLines = 0
    customConfiguration.secondaryTextProperties.lineBreakMode = .byWordWrapping
        
    cell.contentConfiguration = customConfiguration
    cell.accessoryType = .disclosureIndicator
}
```
</details>

<details>
    <summary><big>추가 학습</big></summary>

## View의 생명주기 override, super는 필수적인가?
- UIViewController의 메서드를 상속해서 사용하고 거기에 있는 viewWillAppear를 override(재정의) 하였습니다. 그리고 바로 아래와 같이 정의하였는데 오류가 나지 않았습니다.

```swift
override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
```
- 생각해보니 `override`를 하면 `super.`을 하여 부모클래스의 메서드를 마무리 지어야 했는데 왜 오류가 나지 않았지? 의문이 들었습니다.
- 공식문서를 찾아보니, `If you override this method, you must call super at some point in your implementation.` 반드시 `super`를 호출해야한다고 나와있어 정의해주는 것으로 수정하였습니다. 
- 반면 선택적으로 호출할 수 있는 메서드도 있고 이는 공식문서에서 확인할 수 있었습니다.

</details>

----
# 팀 회고

- step3 완성 후 업데이트 예정입니다!

----

# 참고 링크
* [Apple Developer Documentation - Asset Catalog Format Reference](https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_ref-Asset_Catalog_Format/ImageSetType.html#//apple_ref/doc/uid/TP40015170-CH25-SW1)
* [Apple Developer Documentation - TableViews](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)
* [Filling a table with data - Apple Developer Documentation Article](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)
* [Apple Developer Documentation - JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
* [Apple Developer Documentation Sample Code - Using JSON with Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)
* [Apple Developer Documentation - decode(_:from:)](https://developer.apple.com/documentation/foundation/jsondecoder/2895189-decode)
* [Apple Developer Documentation - DecodingError](https://developer.apple.com/documentation/swift/decodingerror)
* [Apple Developer Documentation - NSMutableAttributedString](https://developer.apple.com/documentation/foundation/nsmutableattributedstring)
* [Apple Developer Documentation - NSMakeRange(_: _:)](https://developer.apple.com/documentation/foundation/1417188-nsmakerange)
* [Apple Developer Documentation - viewAillAppear](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621510-viewwillappear)
* [Apple Developer Documentation - isNavigationBarHidden](https://developer.apple.com/documentation/uikit/uinavigationcontroller/1621850-isnavigationbarhidden)
* [fluffy.es - Solving duplicated / repeating cells in Table view](https://fluffy.es/solve-duplicated-cells/)
* [Swift Language Guide - Protocols](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols/)
* [Apple Developer Documentation - UIContentConfiguration](https://developer.apple.com/documentation/uikit/uicontentconfiguration)
* [WWDC2020 - Modern Cell Configuration](https://developer.apple.com/videos/play/wwdc2020/10027/)
