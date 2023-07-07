# 만국박람회
> 1900년 파리 만국박람회에 한국 출품작을 보여주는 앱입니다.</br>
> 한국 출품작에 대한 리스트를 볼 수 있습니다.</br>
> 한국 출품작 사진, 이름, 간단한 설명을 볼 수 있습니다.</br>
> 한국 출품작을 선택했을 경우 상세화면을 보여줍니다.</br>
> 상세화면에서는 출품작 이름, 사진, 상세한 설명을 보여줍니다.</br>

## 📚 목차
- [팀원소개](#-팀원-소개)
- [타임라인](#-타임라인)
- [시각화 구조](#-시각화-구조)
- [실행화면](#-실행화면)
- [트러블 슈팅](#-트러블-슈팅)
- [프로젝트 회고](#-프로젝트-회고)
- [참고자료](#-참고자료)

## 🧑‍💻 팀원 소개
| <img src="https://i.imgur.com/8mg0oKy.jpg" width="130" height="165"/> | <img src="https://github.com/devKobe24/BranchTest/blob/main/IMG_5424.JPG?raw=true" width="200" height="200"/> |
| :-: | :-: |
| [<img src="https://hackmd.io/_uploads/SJEQuLsEh.png" width="20"/> **Mary**](https://github.com/MaryJo-github) | [<img src="https://hackmd.io/_uploads/SJEQuLsEh.png" width="20"/> **Kobe**](https://github.com/devKobe24) |

## ⏰ 타임라인
프로젝트 진행 기간 | 23.06.26.(월) ~ 23.07.07.(금)

| 날짜 | 진행 사항 |
| -------- | -------- |
| 23.06.26.(월)     | 만국박람회 전체적인 구성 파악 및 학습|
| 23.06.27.(화)     | asset 데이터 decoding을 위한 DTO 생성<br/>Decoding unit test 추가<br/> |
| 23.06.28.(수)     | DTO의 CodingKey 삭제 및 keyDecodingStrategy 프로퍼티 변경 |
| 23.06.29.(목)     | 만국박람회 첫 화면 및 ExpoViewController 구현<br/>|
| 23.06.30.(금)     | UInt 확장 메서드 추가<br/> 첫 화면 오토레이아웃 제약 추가<br/> 출품작 목록 화면 및 KoreaEntryListViewController 구현<br/> 출품작 상세 화면 및 EntryDetailViewController 구현<br/> navigationBarHidden 프로퍼티 변경<br/> 뷰 간 데이터 전달 구현<br/> CustomCell 악세서리 타입 추가<br/>
| 23.07.03.(월)     |  Cell의 prepareForReuse 메서드 재정의<br/> DecodeError 타입 생성<br/>JSONDecode 구조체 생성<br/>ViewControllerTitleNameSpace 타입 생성<br/>JSONDataNameSpace 타입 생성<br/>|
| 23.07.04.(화)     | ViewController Title 추가<br/>|
| 23.07.05.(수)     | init 메서드 생성으로 인한 의존성 주입 구현<br/>화면 전환 방법 및 데이터 전송 방법 변경<br/> tableViewDelegate 추가<br/>configureCell 메서드 생성<br/>Segue 삭제 및 StoryboardIdentifier 추가<br/>접근 제한자 추가<br/>decodeJSON 메서드에 isSnakeCase 매개변수 추가<br/>|
| 23.07.06.(목)     |application(_:supportedInterfaceOrientationsFor:) 메서드 생성 및 restrictRotation 프로퍼티 생성<br/>AppDelegate의 restrictRotation 모드 변경 코드 생성<br/>dynamic type 적용<br/>|
| 23.07.07.(금)     | 한국의 출품작 버튼 Dynamic type 적용<br/>|

## 👀 시각화 구조
```
.
├── Expo1900
│   ├── Model
│   │   ├── Decoder.swift
│   │   ├── ExpoModel.swift
│   │   ├── ItemsModel.swift
│   │   └── Enum
│   │       └── DecodeError.swift
│   ├── View
│   │   ├── Base.lproj
│   │   │   ├── LaunchScreen.storyboard
│   │   │   └── Main.storyboard
│   │   └── KoreaEntryTableViewCell.swift
│   ├── Controller
│   │   ├── EntryDetailViewController.swift
│   │   ├── ExpoViewController.swift
│   │   ├── KoreaEntryListViewController.swift
│   │   └── Enum
│   │       ├── JSONDataNameSpace.swift
│   │       └── ViewControllerTitleNameSpace.swift
│   ├── Extension
│   │   └── UInt+.swift
│   ├── Resource
│   │   ├── AppDelegate.swift
│   │   ├── Assets.xcassets
│   │   └── SceneDelegate.swift
│   └── Info.plist
├── ExpoModelTests
│   └── ExpoModelTests.swift
├── ItemsModelTests
│   └── ItemsModelTests.swift
└── TestPlan.xctestplan
```

## 📺 실행화면
- 만국박람회 실행 화면 <br/>
<img src= "https://github.com/devKobe24/images/blob/main/%E1%84%86%E1%85%A1%E1%86%AB%E1%84%80%E1%85%AE%E1%86%A8%E1%84%87%E1%85%A1%E1%86%A8%E1%84%85%E1%85%A1%E1%86%B7%E1%84%92%E1%85%AC.gif?raw=true">

## 🔨 트러블 슈팅 

1️⃣ **뷰 간 데이터 전달.** <br/>
🔒 **문제점** <br/>
출품작 상세 화면에서 출품작의 이름과 상세 설명을 화면에 나타내기 위해서는 출품작 목록 화면에서 데이터를 전달해주어야했습니다.

🔑 **해결방법 1** <br/>
화면 전환 이전에 실행되는 segue의 prepare 메서드를 이용하여 데이터를 전달해주었습니다. 출품작 상세 화면에서 데이터를 전달받을 프로퍼티(`koreanEntryImage`, `entryDescription`, `entryTitle`)를 옵셔널타입으로 생성하고, prepare 메서드 안에서 데이터를 넣어주는 것으로 구현하였습니다.
이 때, 사용자가 선택한 출품작을 알기위해 선택된 셀의 인덱스를 TableView의 `indexPathForSelectedRow`프로퍼티를 이용하여 가져왔습니다.

<details>
<summary>Code 보기</summary>
<div markdown="1">   

```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let destination = segue.destination as? EntryDetailViewController,
          let selectedIndex = self.entryListTableView.indexPathForSelectedRow?.row,
          let itemsModel = itemsModel else {
        return
    }

    destination.koreanEntryImage = UIImage(named: itemsModel[selectedIndex].imageName)
    destination.entryDescription = itemsModel[selectedIndex].desc
    destination.entryTitle = itemsModel[selectedIndex].name
}
```
</div>
</details> <br/>

🔑 **해결방법 2** <br/>
출품작 상세 화면 뷰 컨트롤러의 초기화 메서드에 매개변수를 추가하고, 셀이 선택되었을 때 호출되는 UITableViewDelegate의 `tableView(_:didSelectRowAt:)` 메서드에서 `instantiateViewController`메서드의 `creator`를 이용하여 출품작 데이터를 주입해주었습니다.

<details>
<summary>Code 보기</summary>
<div markdown="1">  

```swift
// KoreaEntryListViewController
extension KoreaEntryListViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let itemsModel = itemsModel else { return }
		guard let entryDetailViewController = storyboard?.instantiateViewController(identifier: Identifier.entryDetailViewController,
											  creator: { (coder) in
			return EntryDetailViewController(itemsModel: itemsModel[indexPath.row], coder: coder)
		}) else {
			return
		}
		
		self.navigationController?.pushViewController(entryDetailViewController, animated: true)
		
		tableView.deselectRow(at: indexPath, animated: false)
	}
}
```
```swift
// EntryDetailViewController
final class EntryDetailViewController: UIViewController {
	private let itemsModel: ItemsModel
	
	init?(itemsModel: ItemsModel, coder: NSCoder) {
		self.itemsModel = itemsModel
		super.init(coder: coder)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
    ...
}
```
</div>
</details> <br/>

🔑 **최종 선택** <br/>
segue의 prepare 메서드를 활용하면 출품작 상세 화면 뷰 컨트롤러에 데이터를 넣어줄 옵셔널타입의 프로퍼티를 추가로 만들어주거나 출품작 상세 화면 뷰 컨트롤러의 객체에 직접적으로 값을 넣어주어야합니다. 첫 번째 방법은 불필요한 작업이 추가되기 때문에 번거로워졌으며, 두 번째 방법은 객체지향 관점에서 맞지 않았습니다.
또한 데이터를 주입하는 방식을 이용하면 DIP도 지킬 수 있으므로, 최종적으로 두 번째 방식을 적용하였습니다.

---

2️⃣ **첫 화면 세로 고정.** <br/>
🔒 **문제점** <br/>
첫 화면을 세로로 고정시키기 위한 방법을 찾아보다가 UIApplicationDelegate의 `application(:supportedInterfaceOrientationsFor:)` 메서드에 대해 알게되었습니다. 이 메서드를 이용하면 특정 window에서 뷰 컨트롤러에 사용할 인터페이스 방향을 설정해줄 수 있습니다.
하지만 해당 메서드의 반환값을 `.portrait`으로 고정하면 두 번째, 세 번째 화면도 모두 세로 모드로 설정되었습니다.

<details>
<summary>Code 보기</summary>
<div markdown="1">   

```swift
func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    return .portrait
}
```
</div>
</details> <br/>
    
🔑 **해결방법** <br/>
AppDelegate 타입에 `restrictRotation` 프로퍼티를 만들어주어 해결하였습니다. 먼저 해당 프로퍼티의 기본값을 세로방향(portrait)으로 설정하였습니다. 그리고 다른 뷰컨트롤러로 이동했을 때 다시 가로방향 모드가 가능하도록 첫 화면 뷰 컨트롤러의 `viewWillDisappear` 메서드 내에서 `restrictRotation` 값을 `.all`로 변경해주었고, 다른 뷰컨트롤러에서 다시 첫 화면으로 돌아왔을 때에 세로방향 모드로 변경하도록 `viewWillAppear` 메서드 내에서 `restrictRotation` 값을 `.portrait`으로 변경해주었습니다.

<details>
<summary>Code 보기</summary>
<div markdown="1">    

```swift
// AppDelegate
var restrictRotation: UIInterfaceOrientationMask = .portrait

func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    return self.restrictRotation
}
```
```swift
// ExpoViewController (첫 화면)
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    self.title = ViewControllerTitleNameSpace.expo
    navigationController?.setNavigationBarHidden(true, animated: false)
    appDelegate?.restrictRotation = .portrait
}

override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    navigationController?.setNavigationBarHidden(false, animated: false)
    appDelegate?.restrictRotation = .all
}
```
</div>
</details> <br/>

---

3️⃣ **Dynamic Type.** <br/>
🔒 **문제점** <br/>
Dynamic Type을 적용하자 오토레이아웃이 어긋나는 현상이 발생하였습니다.

🔑 **해결방법** <br/>
[Dynamic Type](https://developer.apple.com/design/human-interface-guidelines/typography#Specifications) 문서를 참고하여 font를 정적으로 정하지 않고 title1 또는 title2와 같은 system font를 사용하여 어떤 기종에도 Dynamic type이 적용될 수 있도록 하였습니다.

---

4️⃣ **오토레이아웃.** <br/>
🔒 **문제점** <br/>
각 콘텐츠에 대한 priority에 대한 개념이 확실하게 잡혀있지 않은 상태에서 오토레이아웃 제약을 주다보니 여러 시행착오를 겪었습니다.
화면을 눕히거나 세웠을 때의 이미지의 비율이 잡혀지지 않는 문제점이 있었습니다.

🔑 **해결방법** <br/>
priority와 content hugging priority 그리고 content compression resistance priority에 대한 학습을 통해 개념을 잡고 비율과 우선 순위를 각각의 콘텐츠에 오토레이아웃 제약을 줌으로 인해 해결하게 되었습니다.

---

### 🤔 **고민했던 점** <br/>
오토레이아웃의 제약을 주는 것에 대한 개념이 아직 확실하게 잡혀 있지 않아 여러 시행착오가 있었습니다.
데이터 전달에 대한 많은 방법이 있다는 것을 알게 되었습니다.
SOLID 원칙을 아직 제대로 사용하지 못하는 것 같습니다.

## 👥 프로젝트 회고
### 잘한 부분
- 그라운드 룰을 잘 지켰습니다.
- 서로에 대한 배려와 존중을 지켜주었습니다.
- 주장과 논리에 확실한 근거가 있으면 서로의 의견을 통합하고 더 좋은 방향으로 이끌어 나갔습니다.
- 이해가 가지 않는 부분은 서로가 서로에게 질문하고 답하기를 반복하며 공부했습니다.
- 기억보단 기록에 포커스를 두어서 최대한 기록하려 노력했습니다.

### 부족한 부분 
- 오토레이아웃에 대한 개념이 확실하게 잡혀있지 않은 상태로 프로젝트에 도입하려 했습니다.
- 도큐먼트를 확실하게 읽으려하지 않았습니다.
- 시간에 쫓겨 개념을 확고히 파고들지 않았습니다.


## 📑 참고자료
- [JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
- [Using JSON with Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)
- [Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
- [Dynamic Type](https://developer.apple.com/design/human-interface-guidelines/typography#Specifications)
- [UINavigationController](https://developer.apple.com/documentation/uikit/uinavigationcontroller)
- [UINavigationBar](https://developer.apple.com/documentation/uikit/uinavigationbar)
- [UITableView](https://developer.apple.com/documentation/uikit/uitableview)
- [UITableViewDelegate - tableView(_:didSelectRowAt:)
](https://developer.apple.com/documentation/uikit/uitableviewdelegate/1614877-tableview) 
- [UIApplicationDelegate - application(_:supportedInterfaceOrientationsFor:)](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1623107-application)

