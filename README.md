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
- 2023.02.27 : refactoring(컨벤션, Custom TableViewCell 적용, JSONDecoder 기능 분리)
- 2023.02.28 : Storyboard를 통한 오토레이아웃 수정, 첫 번째 화면 portrait orientation으로 고정
- 2023.03.01 : refactoring(NameSpace 전역 -> Nested type으로 변경)
- 2023.03.02 : Accessibility 추가 구현 및 오토레이아웃 refactoring
- 2023.03.03 : README.md 수정, refactoring
<br/>


# 프로젝트 구조

<details>
    <summary><big>UML</big></big></summary>

![ExopUML](https://i.imgur.com/QF8D1Db.jpg)

</details>

<br>
<details>
    <summary><big>File Tree</big></big></summary>

```
└── Expo1900
    ├── Model
    │   └── JSON
    │       ├── ExpoUniverselle
    │       └── Item
    ├── View
    │   └── CustomTableViewCell
    └── ViewController
    │   ├── ExpoViewController 
    │   ├── ItemEntryViewController
    │   ├── DescriptionViewController
    │   └── DecodeManager
    ├── App
    │   ├── AppDelegate
    │   └── SceneDelegate
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
#### 📱 iPhone 12 mini 
| 앱 실행| Dynamic Type 적용| 화면 회전|
|:---:|:---:|:---:|
| <img src="https://user-images.githubusercontent.com/114971172/222661318-13dd3618-64b8-4a3d-946e-0bbc5d5f8713.gif" width="150"> | <img src = "https://user-images.githubusercontent.com/114971172/222661661-01246808-a48b-49a8-824b-aad5520f7e9b.gif" width="150"> | <img src="https://i.imgur.com/JSEb3yd.gif" width ="300"> |


#### 📱 iPhone SE

|앱 실행|Dynamic Type 적용|화면 회전|
|:---:|:---:|:---:|
|<img src="https://user-images.githubusercontent.com/114971172/222661672-789ff840-390b-48f9-9234-2a6f8b49f81e.gif" width="150">|<img src = "https://i.imgur.com/av3yqfF.gif" width="150">|<img src="https://i.imgur.com/QQ1tCfr.gif" width="300">|


<br/>

# 트러블 슈팅
## 1️⃣ Image Size
### 🔍 문제점
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

### ⚒️ 해결방안
- TableViewCell의 style을 custom 이외의 다른 것을 사용하는 경우 오토레이아웃을 적용할 수 없어 CustomTableViewCell을 정의하여 오토레이아웃을 통해 image size를 조정하였습니다. 

```swift
import UIKit

final class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
}
```

**오토레이아웃**
- `imageView width`와 `stackView width`의 비율을 multiplier 0.2로 주고 `imageView`의 ratio를 1:1로 지정하여 크기를 조정하였습니다.

<img src="https://i.imgur.com/CRKNMHB.png" width="400">

<br/>


----

<br/>

## 2️⃣ DescriptionViewController에 데이터 전달 방법
### 🔍 문제점
처음 데이터 전달은 Delegation 패턴을 사용하기 위해 `ContentsDataSource` 프로토콜을 추가로 정의하고 `DescriptionViewController`가 `delegate` 프로퍼티를 갖도록 구현했습니다.

이때, 아래 코드에서 확인할 수 있듯 외부에서 DescriptionViewController의 프로퍼티에 값을 직접 주입하고 있습니다.

```swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let nextViewController = self.storyboard?.instantiateViewController(
        withIdentifier: Identifier.descriptionViewController
    ) else { return }

    nextViewController.delegate = self
    self.navigationController?.pushViewController(nextViewController, animated: true)
    self.tableView.deselectRow(at: indexPath, animated: true)
}
```

외부에서 주입하는 것이 가능한데도 protocol에 의해 코드에 추가적인 depth가 생기는 문제가 있었습니다.

### ⚒️ 해결방안
ViewController에 지정이니셜라이저를 정의하여 화면 전환 시 생성할 인스턴스에 이니셜라이저를 통한 주입으로 해결하였습니다.
이니셜라이저를 통한 주입을 구현함으로써 `DescriptionViewController`에 `Item`이 반드시 필요하다는 점도 명확하게 나타난다고 생각합니다.

```swift
init?(item: Item, coder: NSCoder) {
    self.item = item
    super.init(coder: coder)
}
    
required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
```
해당 지정이니셜라이저를 호출하기 위해서는 `instantiateViewController(identifier:creator:)` 메서드가 필요했습니다.
creator의 타입은 `((NSCoder) -> ViewController?)?` 로 클로저입니다. creator 클로저 내부 코드블록에서 지정 이니셜라이저를 호출하여 프로퍼티에 원하는 값을 주입할 수 있었습니다.

   - `required`는 `UIViewController`가 `NSCoding` 프로토콜을 채택하고 있기 때문에 해당 프로토콜에 정의된 이니셜라이저를 구현하면 붙는 키워드입니다.
새로운 지정 이니셜라이저를 정의하기 위해서는 required init을 반드시 정의할 필요가 있었습니다. 

----

<br/>

## 3️⃣ Generic 메서드 구현
### 🔍 문제점

JSON 데이터를 디코딩하는 기능을 ViewController에서 분리하기 위해 `DecodeManager` 객체를 따로 정의하였습니다. 
데이터를 디코딩하는 메서드를 정의할 때, 리턴 값의 타입이 두 가지 였습니다. 저희는 Decoding할 값의 타입이 달라도 하나의 메서드만 사용해서 decode 할 수 있도록 Generic을 활용하였습니다.
그런데 Generic 함수를 구현하는 과정에서 몇 가지 오류가 발생하였습니다.

◾️ **Error #1 Generic parameter 'T' could not be inferred.** 

<img src="https://i.imgur.com/A7pcpiQ.png" width="400">
<br/>
<br/>

- JSONDecoder의 decode 메서드를 확인해보면 `_ type: T.Type` 파라미터가 필요한 것을 알 수 있습니다. 해당 파라미터는 제공된 JSON 객체에서 디코딩할 값의 타입을 뜻합니다. 즉, 디코딩한 반환값의 Type을 의미하며 구체적인 타입 명시가 필요합니다.

<br/>

<img src="https://i.imgur.com/vJq3W9K.png" width="600">
<br/>

<br/>

- 함수를 호출할 때 디코딩할 객체의 타입을 명시하지 않아도 되지만 이 경우, 컴파일러가 디코딩할 객체의 타입을 알 수 없기 때문에 디코딩할 객체의 타입이 일치하지 않는 경우 런타임 오류(Runtime Error)가 발생할 가능성이 있습니다. swift 는 type-safety 언어이기 때문에 구체적인 타입을 명시한다면 디코딩할 객체의 타입이 일치하지 않는 경우 컴파일 단계에서 오류를 발생시켜 예방할 수 있습니다.

**따라서 Generic 함수의 반환 값의 타입이 Generic이라면, 정확한 타입을 매개변수로 받아야 합니다.**

<br/>

◾️ **Error #2 Cannot explicitly specialize a generic function.** 

- generic 메서드를 호출할 때, "<>"를 통해 타입을 써줘야한다고 착각하여(`decodeData<ExpoUniverselle>(of: AssetName.expo)`), 호출할 때 꺽쇠를 사용해 오류가 발생하였습니다. -> **generic 메서드 호출 시 "<>" 사용하지 않기**
  

#### 기존 코드 

```swift
static func decodeData<T: Decodable>(of name: String) -> T? {
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: name) else { return nil }

        do {
            let result = try jsonDecoder.decode(T.self, from: dataAsset.data)

            return result
        } catch {
            print(error.localizedDescription)

            return nil
        }
    }
```



### ⚒️ 해결방안
#### 수정 코드

```swift
enum DecodeManager {
    static func decode<T: Decodable>(of name: String, returnType: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: name) else { return nil }

        do {
            let result = try jsonDecoder.decode(returnType, from: dataAsset.data)

            return result
        } catch {
            print(error.localizedDescription)

            return nil
        }
    }
}
```

- decode 메서드의 파라미터타입으로 returnType을 받아 구체적인 타입을 명시하도록 수정하였습니다.


----
<br/>

## 4️⃣ NavigationBar 관련 이슈

### 🔍 화면전환시 첫 번째 화면에 navigationBar가 다시 나타나는 문제
NavigationBar를 숨기기 위해 `isNaviagtionBarHidden` 프로퍼티를 구현하여 사라지도록 `viewDidLoad()` 에서 설정하였습니다.
두 번째 화면에서 다시 첫 번째 화면으로 돌아올 때, navigationBar가 사라지지 않는 문제가 있었습니다. 

#### isNavigationBarHidden
- navigation bar를 보여줄지 숨길지 나타내는 Bool 타입

```swift
var isNavigationBarHidden: Bool { get set }
```
- default는 false이며 true면 navigation bar가 사라집니다.
- `setNavigationBarHidden(_: animated: )`를 사용하여 animated를 추가할 수도 있습니다.


### ⚒️ 해결방안

- view의 생명주기를 생각해보았습니다. 첫 번째 화면에서 `isNavigationBarHidden`의 설정을 `viewDidLoad` 메서드에서 했습니다. 이후 화면전환이 일어나면 `viewDidLoad`는 다시 실행되지 않기 때문에 NavigationBar가 사라지지 않았습니다. 따라서, `isNavigationBarHidden`의 설정을 첫 번째 화면이 screen에 표시되기 직전 호출되는 `viewWillAppear`에 구현하여 문제를 해결하였습니다.

<br/>

### 🔍 backButton title 수정 문제
두 번째 혹은 세 번째 화면에서 이전 화면으로 돌아가려면 `navigationBar`의 `backButton`을 누르면 되는데, 이 버튼의 이름을 기본 `back`이 아닌 다른 이름으로 수정하고자 했습니다.
처음에 `backButton`이 보여지는 화면에서 `navigationItem.title`에 접근하여 수정하였는데, title이 수정되지 않는 문제가 있었습니다.

### ⚒️ 해결방안
- `back button`은 이전 화면의 navigationBar title로 설정되기 때문에 이전 화면의 `navigationItem.title`에 접근하여 수정하여 해결했습니다.


---
<br/>

# 핵심경험 

<details>
    <summary><big>✅ JSON</big></summary>

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
    <summary><big>✅  Label 일부 크기 조정</big></summary> 

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
    <summary><big>✅  UITableView - Modern Cell Configuration 적용</big></summary>

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
    <summary><big>✅ 첫 번째 화면 세로 고정</big></summary>
특정 화면만 portrait orientation으로 고정하기 위해 여러가지 방법을 찾아보았습니다. 저희는 그 중에서 화면의 orientation에 대한 상태에 응답하는 것이 중요한 부분이라고 생각하여 AppDelegate를 활용한 방법을 선택하여 구현해 보았습니다.

```swift
class AppDelegate: UIResponder, UIApplicationDelegate {

    var shouldSupportAllOrientation = true

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        shouldSupportAllOrientation == true ? .all : .portrait
    }
}
```

```swift
final class ExpoViewController: UIViewController {
   
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
}
```
</details>


<details>
    <summary><big>✅ TableViewCell Contents Accessibility </big></summary>

테이블 뷰에 VoiceOver를 실행해보니 Cell을 통째로 인식해서 내부의 Label Title이 모두 합쳐져 cell.accessibilityLabel에 설정되어 있는 것을 확인했습니다.

cell 내부의 정보를 사용자에게 VoiceOver를 통해 들려주는 것이 바람직하다고 생각하여 해결 방법을 찾아보았습니다.

비공식 프로토콜 `UIAccessibilityContainer`를 채택하고 있는 클래스는 해당 클래스의 subview를 선택적으로 accessibiliyElement로 만들어줄 수 있는 메서드 / 프로퍼티를 제공하고 있습니다. 그 중에서 `var accessibilityElements: [Any]?`을 이용하였습니다.

1. cell 자체에 VoiceOver가 접근하지 못하도록 해준다.
2. cell.accessibilityElements에 label, imageView를 추가한다.
3. 각각의 subview들의 accessibilityProperty를 설정한다.

```swift
func setAccessibilityProperties(itemName: String, shortDescription: String) {
    self.itemNameLabel.accessibilityLabel = itemName
        
    self.shortDescriptionLabel.accessibilityLabel = "짧은 설명"
    self.shortDescriptionLabel.accessibilityValue = shortDescription
        
    self.itemImageView.isAccessibilityElement = true
    self.itemImageView.accessibilityLabel = itemName
    self.itemImageView.accessibilityTraits = .image
    self.itemImageView.accessibilityHint = "현재 셀을 선택하면 상세 화면으로 이동합니다."
        
    self.isAccessibilityElement = false
    self.accessibilityElements = [
        self.itemNameLabel!,
        self.shortDescriptionLabel!,
        self.itemImageView!
    ]
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

<br/>
    
## 화면 간 데이터 공유(Refactoring 전)

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

</details>

----
    
# 팀 회고

### 잘한 점
  - 문제를 해결할 때 단순히 해결만 하는 것이 아니라 적용한 개념에 대해 서로 이해할 수 있도록 많은 토론이 이루어졌다.
  - 프로젝트의 요구사항을 정확히 이해하고 적용하려고 노력했다.
### 개선할 점
  - 앞으로는 그라운드룰 설정을 하면 좋겠다.
  - 코드 작성할 때 코드 컨벤션에 대해 더 명확한 기준을 가지면 좋겠다.
  - 로완 토론할 때 조금 더 차분한 목소리로 친절하게 대답합시다 🙏

### 서로 칭찬하기 
  - 리지가 Rowan에게
     - 프로젝트 진행시 Rowan이 생각하는 부분을 명확하게 설명해주고, 저의 의견도 참고하여 같이 프로젝트를 진행하려고 노력하는 모습이 좋았습니다!
     - 코드를 해석하는데 어려움이 있을 때, 공식문서를 하나씩 같이 살펴보며 설명해주어 덕분에 많은 공부를 할 수 있었습니다 👍
     - 응원의 말로 자존감을 높여주었습니다 😁
  - Rowan이 리지에게
     - 문법적 / 구조적 개념에 대해 이해하려고 노력하는 모습이 멋있습니다 🔥
     - 문제가 발생했을 때 해결 방안을 고안하는 속도가 빠릅니다 💫
     - 토론식 대화가 잘 이루어질 수 있도록 답변해주셔서 좋았습니다 👍
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
* [Accessibility-WWDC2019](https://developer.apple.com/videos/play/wwdc2019/257/) 
* [Accessibility-WWDC2019](https://developer.apple.com/videos/play/wwdc2019/254/)
* [Apple Developer Documentation - instantViewController(identifier:creator:)](https://developer.apple.com/documentation/uikit/uistoryboard/3213989-instantiateviewcontroller) 
* [Swift Language Guide - Protocols; Initializer Requirements](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols/#Initializer-Requirements)
* [Swift Language Guide - Initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization)
* [Swift Language Guide - Generic; Generic Functions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/#Generic-Functions)
    
