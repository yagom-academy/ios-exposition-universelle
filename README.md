# 🇰🇷 만국박람회

## 📖 목차
1. [소개](#-소개)
2. [Tree](#-tree)
3. [고민한 점](#-고민한-점)
4. [타임라인](#-타임라인)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)

## 🌱 소개

`Hamo`와 `mene` 가 만든 만국박람회 앱입니다.

- JSON을 디코딩하여 1900 만국박람회 정보를 TableView 화면에 보여줍니다.
- 메인 화면과 한국의 출품작 목록, 상세화면으로 구성되어 있습니다.
- **KeyWords**
  - `UITableView`
      - `UITableViewDataSource`, `UITableViewDeligate`, `prepareforreuse`
  - `JSON`
      - `DTO`, `CodingKey`, `keyDecodingStrategy`, `convertFromSnakeCase`
      - `Codable`, `Encodable`, `Decodable`
  - `NSMutableAttributedString`
  - `Accessbility`
      - `Dynamic Type`


## 💻 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()


## 🧑 팀원
<img src = "https://avatars.githubusercontent.com/u/84453688?v=4" width=160>|<img src="https://i.imgur.com/ydRkDFq.jpg" width=200>|
|:--:|:--:|
|[Mene](https://github.com/JaeKimdev)|[하모](https://github.com/lxodud)|

## 🌲 Tree

```
├── Expo1900
│   ├── ExhibitionEntryTests
│   ├── Expo1900
│   │   ├── AppDelegate.swift
│   │   ├── Assets.xcassets
│   │   │   ├── Contents.json
│   │   │   └── expo_assets
│   │   ├── Base.lproj
│   │   │   └── LaunchScreen.storyboard
│   │   ├── Controller
│   │   │   ├── EntryDetailViewController.swift
│   │   │   ├── ExpositionUniverselleViewController.swift
│   │   │   └── KoreanEntriesViewController.swift
│   │   ├── Extensioin
│   │   ├── Info.plist
│   │   ├── Model
│   │   │   ├── ExhibitionEntry.swift
│   │   │   ├── ExpoConstant.swift
│   │   │   ├── ExpoError.swift
│   │   │   ├── ExpositionUniverselle.swift
│   │   │   └── JSONDecodingManager.swift
│   │   ├── SceneDelegate.swift
│   │   └── View
│   │       ├── Base.lproj
│   │       │   └── Main.storyboard
│   │       └── EntryTableViewCell.swift
└── README.md
```
 
## 👀 고민한 점

### Step 1

- Codable 프로토콜을 채택할지, Decodable만 채택할지 고민해 보았습니다.
    - 이번 프로젝트에서는 Encoding이 필요하지 않았고 다른 사람이 보았을 때에도 명확하게 Decoding만 하는 프로젝트라는 것을 알 수 있게 되기 때문에 모델타입에 Decodable만을 채택하였습니다.
- Naming시, 확장성을 고려하였습니다.
    - 지금은 `1900년 Expo`의 정보만 존재하지만 추후 다른 년도의 Expo가 추가될 수도 있지 않을까?라는 생각을 해 보았고 `한국의 출품작` 역시 다른 참가국의 정보가 추가될 가능성이 있어 확장성을 고려하여 `ExpositionUniverselle`과 `ExhibitionEntry`로 지정하였습니다.

### Step 2

- 메인페이지의 Title을 구성할 때 label과 textView중에 어떤 것을 사용할 지 고민해 보았습니다.
    - Label의 경우 numberOfLines를 0으로 할당하여 여러줄의 텍스트를 표현할 수 있습니다.
    - [textView 공식문서](https://developer.apple.com/library/archive/documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/UsingTextClasses/UsingTextClasses.html)에서 large amounts of text를 사용할 대는 textView를 사용하라고 되어있어서 `editable`, `scrolling enabled`를 해제하고 textView를 사용하였습니다.
- 방문객, 개최지, 개최기간 등 텍스트 특정 부분만 사이즈를 다르게 보여주기 위해 고민해 보았습니다.
    - 해당 부분을 구현하기 위해 label을 2개로 분리하여 따로 표시하는 방법과 attributedText를 이용해서 특정 문자열에 속성을 부여하는 방법이 있었습니다.
    - `attributedString`에 대해 공부해 보고 이번 프로젝트에 적용해보고 싶어서 사용하였습니다.
- 문자열 "방문객 : ~명"을 "방문객" + expositionUniverselle.formattedVisitor + "명"으로 만드는 것이 가독성이 좋지 않았습니다.
    - 이 문제를 computed property를 이용하여 해결하였습니다.
- 홈 화면에서 네비게이션 바를 노출되지 않게 하는 방법을 고민해 보았습니다.
- 방문객 숫자를 보여줄 때 Numberformatter를 사용하여 `,`를 추가하여 주었는데, 여러번 호출하는 경우 매번 각각의 인스턴스를 생성해야 해서 싱글톤 패턴으로 만들어야 하는지 고민해 보았습니다.
    - 이번 프로젝트에서는 아직까지는 한번만 사용되고 있어서 싱글턴으로 파일분리 할 필요는 없는 것 같아 메서드로 구현하였습니다.

### Step 3

- 첫번째 뷰만 세로모드로 고정하기 위한 방법을 고민해 보았습니다.
    - delegate를 self로 지정하여 재정의한 `supportedInterfaceOrientations`를 리턴하여 각 뷰에서 사용하는 방법과 AppDelegate의 `UIInterfaceOrientationMask`를 사용하는 방법, UINavigationController의 subClass를 구현하여 `supportedInterfaceOrientations`를 재정의하는 방법 중 어떤 것을 사용할 지 고민했습니다.

- AttributedString에 Dynamic Type 적용시 한쪽만 적용되는 문제가 있어 해결방법을 고민해 보았습니다.
    - Dynamic Type을 적용하고 확인해 보니 AttributedString이 적용된 Text에만 Dynamic Type이 적용되고 뒤쪽 Text에는 적용되지 않는 문제가 있어 해결방법을 찾기 위해 고민해 보았습니다.

- description 레이블에서 단어 단위로 줄바꿈 되도록 고민해 보았습니다.
    -  Label의 lineBreak를 `Word Wrap`으로 설정하여 주었습니다.
    -  iOS 14 이상에서 적용할 수 있는 `lineBreakStrategy`의 `hangulWordPriority`도 함께 공부하였으나 이번 프로젝트에는 적용하지는 않았습니다.

- 첫번째 View 하단 `한국의 출품작 보러가기` 버튼에 Dynamic Type 적용시 스택뷰 바깥으로 벗어나는 문제 해결을 위해 고민해 보았습니다.
    - 해당 버튼이 속해있는 스택뷰의 높이가 50으로 지정되어 있어, Dynamic Type를 적용했을 때 텍스트가 버튼의 사이즈를 벗어나는 문제가 있었습니다.
    - 이 문제를 해결하기 위해서 버튼의 `Hugging Priority`를 1000으로 주어서 늘어나지 않도록 하여 해결하였습니다.

- TableViewCell의 재사용을 위한 identifier를 UITalbeViewCell의 타입 프로퍼티로 구현하기 위해 고민해 보았습니다.
    - TableViewCell을 재사용할 때 작성하는 cell identifier를 String literal이 아닌 다른 방식으로 구현하는 방법에 대해 고민하였습니다.
    - String literal을 사용했을 경우 해당 Cell 타입이 여러번 사용되었을 때 유지보수측면에서 좋지않고, human error를 유발할 가능성도 존재한다고 생각됩니다.
    - 각 TableViewCell에 타입프로퍼티로 identifier를 리턴하는 computed property를 구현하고 identifier를 클래스의 네이밍으로 하는 방법을 사용해보았습니다.
        ```swift
        final class EntryTableViewCell: UITableViewCell {
            static var reuseIdentifier: String {
                return String(describing: self)
            }
        ```
    - 만약에 재사용될 View가 더 많아졌을 때 identifier가 필요한 모든 타입에 computed property를 구현해주기 보다 프로토콜을 이용하는 방법도 고민해보았습니다.
        ```swift
        protocol Reusable { }

        extension Reusable where Self: UIView {
            static var reuseIdentifier: String {
                return String(describing: self)
            }
        }

        extension UITableViewCell: Reusable { }
        ```
    - 이번 프로젝트에서는 하나의 테이블 뷰만 사용하고 있어 해당 작업이 오버엔지니어링이라고 생각되어 적용하지 않았습니다.

- EntryDetailViewController의 initializer 구현
    - EntryDetailViewController에서 사용할 데이터를 담고있는 프로퍼티들의 구현부가 아래와 같았습니다.
        ```swift
        var entryImage: UIImage?
        var entryDescription: String?
        ```
    - 문제는 외부에서 해당 프로퍼티에 접근해서 값을 할당해주는 것이었습니다. 이는 객체지향적으로 좋지않은 방법이라고 생각되어 프로퍼티에 직접 접근하지않고 메서드를 통해서 해당 프로퍼티에 값을 지정해 주는게 더 좋다고 생각하였습니다.
        ```swift
        func setupData(image: UIImage, description: String) {
            entryImage = image
            entryDescription = description
        }
        ```
    - 여기서 두 가지가 더 눈에 띄었는데 `var`와 `옵셔널`이었습니다. 해당 View에서 데이터를 담고있는 프로퍼티들은 한번 할당되고 값이 변할일이 없는 상수입니다. <br>여기서 `var`와 `optional`을 사용한 이유는 값을 외부에서 할당하는 시점이 초기화단계가 아니기 때문에 옵셔널을 이용해서 초기값을 nil로 할당해주고 이후에 값을 할당해주기 위해서 var로 선언한 것이었습니다.<br>그러면 초기화 시점에서 프로퍼티에 값을 할당해준다면 옵셔널과 var를 `let`으로 바꿔줄 수 있다고 생각되어 initializer를 구현하고 사용하였습니다.
        ```swift
        // 구현한 이니셜라이저
        init?(entryInformation: ExhibitionEntry, coder: NSCoder) {
            self.entryInformation = entryInformation
            super.init(coder: coder)
        }
        ```
        ```swift
        // 해당 ViewController 인스턴스화
        guard let entryDetailViewController = storyboard?.instantiateViewController(
                identifier: "EntryViewController",
                creator: { coder in
                    return EntryDetailViewController(entryInformation: self.koreanEntries[indexPath.row],
                                                     coder: coder)
                }) else {
                return
            }
        ```
        
## ⏰ 타임라인

<details>
<summary>Step 1 타임라인</summary>
    
- **221018**
    - Asset 추가
    - ExibitionEntry 구조체 구현
    - ExpositionUniverselle 구조체 구현
    - Step1 PR 리뷰 요청
        - [PR보러가기](https://github.com/yagom-academy/ios-exposition-universelle/pull/203)

</details>
    
<details>
<summary>Step 2 타임라인</summary>   
    
- **221019**
    - 메인화면 스크롤 뷰 레이아웃 구성, MainViewController IBOulet 연결
    - json파일에서 expo정보를 불러오는 fetchExpoInformation 메서드 구현
    - 화면에 보여질 텍스트를 설정하는 setTextToDisplay() 메서드 구현
    - 한국의 출품작 KoreanEntriesViewController 생성하고 IBOutlet 설정
    - JSON 파일에서 한국의 출품작을 불러오는 fetchKoreanEntries() 메서드 구현
    - KoreanEntriesViewController UITableViewDataSource required 메서드 구현
    - 출품작 상세 뷰 컨트롤러 EntryDetailViewController 구현 및 아울렛 연결
    - KoreanEntriesViewController 뷰 컨트롤러에서 디테일 뷰 컨트롤러로 이동하는 메서드 구현
    - EntryDetail View로 데이터 전달을 위한 prepare() 메서드 구현
    - EntryDetailViewController에서 상세정보를 보여주는 setViewToDisplay() 메서드 구현
    
- **221020**
    - UIViewController verticalStackView height constraint 생성
    - MainViewController에서 NavigationBar 나타나지 않도록 수정
    - 특정 텍스트만 font 크기 변경기능 attributedText 이용하여 구현
    - MainViewController에서 방문자 수 NumberFormatter적용
    - String+ createAttributed() 메서드 구현
    - ExpoConstant name space 추가 및 수정
    
- **221021**
    - JSON디코딩 코드 중복을 줄이기 위해 JSONDecodingManager 클래스 구현
    - Step2 PR 리뷰 요청
        - [PR보러가기](https://github.com/yagom-academy/ios-exposition-universelle/pull/214)
    - String extension MainViewController로 이동하고 fileprivate 설정
    - createAttributed() 메서드 확장성을 위해 파라미터 수정
    - 데이터를 잘못가져왔을 때 descriptionTextView.text 오류 메세지 표시
    
</details>
 
<details>
<summary>Step 3 타임라인</summary>
    
- **221026**
    - ExpositionUniverselleVC에서 세로모드만 지원하도록 NavigationVC delegate 구현
    - EntryTableViewCell 구현 및 constraints 코드로 적용
    - UI요소 Dynamic Type 적용
    - ExpositionUniverselleViewController 세로로 고정되게 코드 추가
    - Step3 PR 리뷰 요청
        - [PR보러가기](https://github.com/yagom-academy/ios-exposition-universelle/pull/232)

- **221027**
    - EntryTableViewCell의 reuseIdentifier를 String literal을 사용하지 않고 타입명을 사용하도록 수정
    - 호출부가 길어지지 않도록 `makeLabelString` 메서드 생성하고 내부에서 createAttributed() 호출하도록 수정
    - EntryDetailViewController 프로퍼티 private let으로 변경하고 이니셜라이저를 이용하여 생성/연결하도록 수정
    - KoreanEntriesVC에서 indexPath.row 호출 시 safe 키워드 사용하여 subScript 구현
    - 에러가 발생했을 때 띄울 alert를 생성하는 showErrorAlert() 메서드 구현
    
    
 </details>
    
## 📱 실행 화면

|만국박람회<br>1900 정보|한국의 출품작<br>정보 테이블| 출품작 상세화면 |
|:--:|:--:|:--:|
|![](https://i.imgur.com/li3xFxH.png)|![](https://i.imgur.com/u9Q3aqn.png)|![](https://i.imgur.com/IsMjcOl.png)|

- 다양한 사이즈의 iPhone을 대응하도록 Auto Layout을 적용하였습니다.

|iPod touch|iPhone 12 mini|iPhone 13 Pro Max|
|:--:|:--:|:--:|
|![dVbw7k7](https://user-images.githubusercontent.com/85005933/198513623-db2532d3-071d-464c-8ea6-2a8c9eadfe58.gif)|![](https://i.imgur.com/D5UxXqn.gif)|![FXtTpTw](https://user-images.githubusercontent.com/85005933/198513651-6d794734-428c-4dfa-b88e-74a503a4d63c.gif)|



- 첫 번째 View에서는 세로모드만 지원하고 네비게이션 바가 노출되지 않고, 나머지 View에서는 가로/세로 모드를 지원합니다.
![WBnkhlU](https://user-images.githubusercontent.com/85005933/198513349-712d259b-0ca6-4de8-96d5-578da511c7ea.gif)

- Dynamic Type을 적용하여 디바이스의 글씨 크기 설정을 적용하여 보여줍니다.
![G86DrVJ](https://user-images.githubusercontent.com/85005933/198513365-703a929e-470e-4b11-970d-c67bbbf1e654.gif)

- 데이터 파싱을 실패했을 때 사용자에게 alert를 이용하여 실패하였음을 보여줍니다.
<center><img src = "https://i.imgur.com/PtRmRmt.png" width=200></center>

## ❓ 트러블 슈팅

### Step 1

- STEP 1은 JSON 포맷의 데이터와 매칭되는 모델 타입을 구현하는 간단한 요구사항이어서 트러블 슈팅 내용이 없습니다.

### Step 2

- 홈 화면에서 네비게이션 바를 노출되지 않게 하는 방법
   - `self.navigationController?.isNavigationBarHidden = true`를 viewDidLoad() 메서드에서 사용하여 네비게이션 바를 노출되지않게 해보았을 때 같은 계층에있는 View들 전부 네비게이션 바가 노출되지않는 문제가 발생하였습니다.
   - `self.navigationController?.isNavigationBarHidden = false`를 홈 화면이 사라질 때 사용하여 다시 네비게이션 바가 나타날 수 있게 구현해보았습니다.
   - 해당 코드를 viewDidAppear에서 네비게이션 바가 다시 나타나는 시점이 다음 View로 push된 후에 나타나게 되어서 이를 해결하기 위해 viewWillAppear에서 해당 코드를 사용하였습니다.
   
- JSONDecodingManager 타입을 구현할 때 여러 타입의 값을 디코딩할 수 있게 구현하기
    - JSONDecoder를 생성하고 decode 메서드를 통해서 디코딩하는 코드가 중복되어서 해당 기능을 묶어주는 작업을 하였습니다.
    - 해당 기능을 묶었을 때 여러가지 타입으로 디코딩되어야 하는 기능을 어떻게 구현해야 할지 고민하였습니다.
    - 해당 문제를 제네릭타입을 이용하여 여러 타입에 대응할 수 있게 구현하였습니다.
    ```swift
    func decode<T: Decodable>(dataAsset: String) throws -> T {
        guard let dataAsset: NSDataAsset = NSDataAsset(
            name: dataAsset) else {
            throw ExpoError.dataAssetError
        }
        
        let data = try jsonDecoder.decode(T.self, from: dataAsset.data)
        
        return data
    }
    ```

- 홈화면에서 "개최지 : 프랑스 파리" 등으로 레이블 텍스트와 JSON에서 가져온 데이터를 함께 보여줄 때 폰트 사이즈를 처리하는 방식
    - 간단한 방법으로는 Label을 2개로 나누고, 각각의 레이블 텍스트를 다른 크기로 주어 해결할 수 있었지만, 방법을 찾아보던 중에 `attributedString`에 대해 알게 되었고 이번 프로젝트에서 적용해 보았습니다.
    - 처음 시도한 방법
    ```swift
        let fontSize = UIFont.systemFont(ofSize: 20)

        let location: String = "개최지 : " + expositionUniverselle.location
        let locationAttributed = NSMutableAttributedString(string: location)
        let locationRange = (location as NSString).range(of: "개최지")

        locationAttributed.addAttribute(.font, value: fontSize, range: locationRange)

        locationLabel.text = "개최지 : " + expositionUniverselle.location
        locationLabel.attributedText = locationAttributed
    ```
    - 리팩토링 시 String extension에서 메서드로 처리
    ```swift
     func createAttributed(target: String) -> NSAttributedString {
        let fontSize = ExpoConstant.mediumFont
        let attributed: NSMutableAttributedString = NSMutableAttributedString(string: self)
        let targetRange = (self as NSString).range(of: target)
        attributed.addAttribute(.font, value: fontSize, range: targetRange)
        
        return attributed
    }
    ```

### Step 3

- 첫번째 View만 세로모드로 고정하기 위한 방법
    - ExpositionUniverselleViewController에서 navigationViewController의 delegate를 self로 지정한 후
        ```swift
        func navigationControllerSupportedInterfaceOrientations(
        _ navigationController: UINavigationController
        )
        ```
        메서드를 구현하여 재정의한 ` supportedInterfaceOrientations`을 리턴하여 각 화면마다 지원하는 방향을 설정해주었습니다.
    - 이외에도 UINavigationController의 subClass를 구현하여 ` supportedInterfaceOrientations`를 재정의하는 방법과 AppDelegate의 메서드인 
        ```swift
        func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask
        ```
        를 구현하여 설정해주는 방법을 함께 고민하였습니다.
        
    - 처음에는 ExpositionUniverselleViewController의 `viewDidLoad`에서 메서드를 호출하였다가 다음 View로 넘어갔다가 다시 돌아오는 경우에 첫번째 View가 가로로 회전하는 문제가 있었는데 `viewWillAppear`로 이동한 후 해결되었습니다.
        
- 첫번째 View에서 시뮬레이터를 가로로 눕혀고 다음 View로 전환하였을 때 두번째 View가 Landscape로 present되지 않음
    - 현재 디바이스의 물리적인 방향을 읽어와서 View가 표시되었을 때 그 값을 기준으로 방향을 정해주고 싶었는데 Landscape left와 right를 구분하는 것을 실패했습니다.  
    ![](https://i.imgur.com/GDqqJ8d.gif)
    - 현재 상태의 코드에서 `XCode 14` 버전을 사용하고 있는 리뷰어와 다른 캠퍼들은 해당 현상이 나타나지 않고 가로로 눕힌 상태에서 다음 View로 이동하면 Landscape로 변경되어 노출된다고 해서 `XCode 13` 버전의 버그이지 않을까..로 마무리 되었습니다.

- AttributedString에 Dynamic Type 적용 시, 한쪽만 적용되는 문제
    - Dynamic Type을 적용하고 확인해 보니 AttributedString이 적용된 Text에만 Dynamic Type이 적용되고 뒤쪽 Text에는 적용되지 않는 문제가 있었습니다.
    - [애플문서](https://developer.apple.com/documentation/uikit/uilabel/1620542-attributedtext)에서 attributedText가 적용되는 시점에 첫 번째 문자의 스타일 정보로 UILable의 스타일 관련 프로퍼티를 업데이트 하는 것으로 이야기 하고 있어서, `createAttributed` 메서드에서 2개의 parameter를 받아 zip 함수를 이용해서 각각 다른 크기로 AttributeString을 만들고 합쳐서 보여주도록 구현하였습니다.

- 첫번째 View 하단 `한국의 출품작 보러가기` 버튼에 Dynamic Type 적용 시 , 스택뷰를 벗어나서 노출되는 문제
    - 해당 버튼이 속해있는 스택뷰의 높이가 50으로 지정되어 있어서 Dynamic Type를 적용했을 때 텍스트가 버튼의 사이즈를 벗어나서 노출되었습니다.
    - 해당 스택뷰의 높이 제약 조건을 지우면 스택뷰의 높이가 늘어나는 문제가 발생했습니다.
    <center><img src="https://i.imgur.com/41mQaCk.png" width="300" height="300"></center>
    
    - 이 문제를 해결하기 위해서 버튼의 `Hugging Priority`를 1000으로 주어서 늘어나지 않도록 하여 해결하였습니다.

|수정 전|수정 후|
|:--:|:--:|
|![](https://i.imgur.com/yVctJUP.png)|![](https://i.imgur.com/NJMbkyE.png)|


## 🔗 참고 링크

[Swift Doc - UITableView](https://developer.apple.com/documentation/uikit/uitableview)   
[Swift Doc - Table views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)  
[Filling a table with data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)  
[Configuring the cells for your table](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table)  
[prepareForReuse()](https://developer.apple.com/documentation/uikit/uitableviewcell/1623223-prepareforreuse)  
[JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)  
[Using JSON with Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)  
[Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)  
[WWDC2017 - Modern cell configuration](https://developer.apple.com/videos/play/wwdc2020/10027/)  
[iOS 부스트코스 - 기상정보 애플리케이션](https://www.boostcourse.org/mo326/joinLectures/12973?isDesc=false)  
[Label의 부분 글자 크기/폰트/색상 변경방법](https://zeddios.tistory.com/m/300)  
[WWDC 2019 - Accessibility Inspector ](https://developer.apple.com/videos/play/wwdc2019/257/)  
[WWDC 2019 - Writing Great Accessibility Labels ](https://developer.apple.com/videos/play/wwdc2019/254/)  
[Easy to Use Cell Reuse Extensions](https://stephenfeuerstein.com/tutorials/easy-to-use-cell-reuse-extensions)  
[Safe (bounds-checked) array lookup in Swift](https://stackoverflow.com/questions/25329186/safe-bounds-checked-array-lookup-in-swift-through-optional-bindings/30593673#30593673)  

---

[🔝 맨 위로 이동하기](#-만국박람회)
