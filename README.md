# 🇰🇷 만국박람회 🇰🇷

## 📖 목차

1. [소개](#-소개)
2. [Tree](#-tree)
3. [고민한 점](#-고민한-점)
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


## 🌲 Tree


```
<Expo1900>
├── AppDelegate.swift
├── Assets.xcassets
├── Base.lproj
│   └── LaunchScreen.storyboard
├── Controllers
│   ├── ItemDetailViewController.swift
│   ├── KoreanItemsViewController.swift
│   └── MainViewController.swift
├── Info.plist
├── Models
│   ├── Exposition.swift
│   └── Item.swift
├── SceneDelegate.swift
└── Views
    ├── Base.lproj
    │   └── Main.storyboard
    └── ItemDetail.storyboard

```

## 👀 고민한 점

### 1. 프로젝트 디렉토리 정리
- MVC별로 폴더를 정리할 때, appDelegate, sceneDelegate, Assets, LaunchScreen이건 어디에 넣어야 할지 고민했다.

### 2. json데이터 디코딩하는 함수 네이밍
- exposition, item을 디코딩하려고 할 때 함수명을 fetch...() 혹은 decode...() 중 어떤 네이밍을 더 적절한지 고민했다.
 
### 3. 클로저를 사용해서 속성을 한번에 정의할지, 객체를 생성한 후 속성을 설정하는게 좋은지 고민했다.

```swift
let posterImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "poster")
    
    return imageView
}()

let label = UILabel()
label.text = text
label.font = UIFont.preferredFont(forTextStyle: textStyle)
label.numberOfLines = numberOfLines
return label
```
### 4. 화면전환 과정에서의 Optional Binding 처리
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
    
</div>
</details>

<details>
<summary>Step3 타임라인</summary>
<div markdown="1">       
    
- 
- 
    
</div>
</details>


## 📱 실행 화면
추후 작성 예정

## ❓ 트러블 슈팅 & 어려웠던 점



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
