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
│   │   │   ├── KoreanEntriesViewController.swift
│   │   │   └── MainViewController.swift
│   │   ├── Extensioin
│   │   │   └── String+.swift
│   │   ├── Info.plist
│   │   ├── Model
│   │   │   ├── ExhibitionEntry.swift
│   │   │   ├── ExpoConstant.swift
│   │   │   └── ExpositionUniverselle.swift
│   │   ├── SceneDelegate.swift
│   │   └── View
│   │       └── Base.lproj
│   │           └── Main.storyboard
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
    - [textView 공식문서](https://developer.apple.com/library/archive/documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/UsingTextClasses/UsingTextClasses.html)에서 large amounts of text를 사용할 때는 textView를 사용하라고 되어있어서 `editable`, `scrolling enabled`를 해제하고 textView를 사용하였습니다.
- 방문객, 개최지, 개최기간 등 텍스트 특정 부분만 사이즈 바꾸기
    - 해당 부분을 구현하기 위해 label을 2개로 분리하여 따로 표시하는 방법과 attributedText를 이용해서 특정 문자열에 속성을 부여하는 방법이 있었습니다.
    - `attributedString`에 대해 공부해 보고 이번 프로젝트에 적용해보고 싶어서 사용하였습니다.
- 문자열 "방문객 : ~명"을 "방문객" + expositionUniverselle.formattedVisitor + "명"으로 만드는 것이 가독성이 좋지 않았습니다.
    - 이 문제를 computed property를 이용하여 해결하였습니다.
- 홈 화면에서 네비게이션 바를 노출되지 않게 하는 방법을 고민해 보았습니다.
- 방문객 숫자를 보여줄 때 Numberformatter를 사용하여 `,`를 추가하여 주었는데, 여러번 호출하는 경우 매번 각각의 인스턴스를 생성해야 해서 싱글톤 패턴으로 만들어야 하는지 고민해 보았습니다.
    - 이번 프로젝트에서는 아직까지는 한번만 사용되고 있어서 싱글턴으로 파일분리 할 필요는 없는 것 같아 메서드로 구현하였습니다.

### Step 3

- 내용
    - 상세
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
    
### Step 2

- **221019**
    - 메인화면 스크롤 뷰 레이아웃 구성, MainViewController IBOulet 연결
    - json파일에서 expo정보를 불러오는 fetchExpoInformation 메서드 구현
    - 화면에 보여질 텍스트를 설정하는 setTextToDisplay() 메서드 구현
    - 한국의 출품작 KoreanEntriesViewController 생성하고 IBOutlet 설정
    - JSON 파일에서 한국의 출품작을 불러오는 fetchKoreanEntries() 메서드 구현
    - KoreanEntriesViewController UITableViewDataSource required 메서드 구현
    - 출품작 상세 뷰 컨트롤러 EntryDetailViewController 구현 및 아울렛 연결
    - 출KoreanEntriesViewController 뷰 컨트롤러에서 디테일 뷰 컨트롤러로 이동하는 메서드 구현
    - EntryDetail View로 데이터 전달을 위한 prepare() 메서드 구현
    - EntryDetailViewController에서 상세정보를 보여주는 setViewToDisplay() 메서드 구현
    - UIViewController verticalStackView height constraint 생성
    - MainViewController에서 NavigationBar 나타나지 않도록 수정
    - 특정 텍스트만 font 크기 변경기능 attributedText 이용하여 구현
    - MainViewController에서 방문자 수  NumberFormatter적용
    - titleLabel 텍스트 줄바꿈 및 크기 변경
    - String+ createAttributed() 메서드 구현
    - ExpoConstant name space 추가 및 수정
    - MVC, extension 폴더 생성하고 파일 재배치
    - JSON디코딩 코드 중복을 줄이기 위해 JSONDecodingManager 클래스 구현
    - Step2 PR 리뷰 요청
        - [PR보러가기](https://github.com/yagom-academy/ios-exposition-universelle/pull/214)
</details>
 
<details>
<summary>Step 3 타임라인</summary>   
    
### Step 3


    
 </details>
    
## 📱 실행 화면

- 실행화면 넣기

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

- 홈화면에서 "개최지 : 프랑스 파리" 등으로 레이블 텍스트와 JSON에서 가져온 데이터를 함께 보여줄 때 폰트 사이즈가 달라 처리하는 방식에 대해 고민했습니다.
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

- 내용
    - 상세

## 🔗 참고 링크

[Swift Doc - UITableView](https://developer.apple.com/documentation/uikit/uitableview)  
[Swift Doc - Table views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)  
[Filling a table with data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)  
[Configuring the cells for your table](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table)  
[prepareForReuse()](https://developer.apple.com/documentation/uikit/uitableviewcell/1623223-prepareforreuse)  
[JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)  
[Using JSON with Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)  
[Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)  
[WWDC17 - Modern cell configuration](https://developer.apple.com/videos/play/wwdc2020/10027/)  
[iOS 부스트코스 - 기상정보 애플리케이션](https://www.boostcourse.org/mo326/joinLectures/12973?isDesc=false)  
[Label의 부분 글자 크기/폰트/색상 변경방법](https://zeddios.tistory.com/m/300)  

---

[🔝 맨 위로 이동하기](#-만국박람회)
