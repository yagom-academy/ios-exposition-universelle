# 만국박람회

## 📖 목차
1. [소개](#-소개)
2. [타임라인](#-타임라인)
3. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
4. [실행 화면](#-실행-화면)
5. [트러블 슈팅](#-트러블-슈팅)
6. [참고 링크](#-참고-링크)

## 🌱 소개

|Gundy|Dragon|
|:-:|:-:|
|||

`Gundy`와 `Dragon`의 iOS 만국박람회 프로젝트입니다. 
테마는 1900년도에 실제로 프랑스에서 진행된 Exposition universelle de 1900의 한국 전시입니다.
아래 나열된 기술들을 적용하여 프로젝트를 진행하였습니다.

- **핵심적으로 다뤄본 기술**
    - 테이블뷰
    - JSONDecoder
    - 화면간 데이터 전달(Segue)
    - AttributedString
    - 화면 Orientation 설정
    - AutoLayout
    - Dynamic Type
    - Navigation Bar
    - NameSpace

## 📆 타임라인

<details>
<summary>STEP 1</summary>

221018
- Exposition
    - exposition_universelle_1900.json 파일과 매칭할 구조체 Exposition 구현
- Exhibition
    - items.json 파일과 매칭할 구조체 Exhibition 구현
- 폴더 정리
    - MVC 패턴의 시각에서 폴더 분류
</details>
<details>
<summary>STEP 1 Feedback 반영</summary>

221020
- 네이밍
    - 직관적이지 못한 네이밍 수정
- 접근제어자
    - 아직 사용하지 않는 프로퍼티들 모두 private 적용
</details>
<details>
<summary>STEP 2</summary>

221020
- InformationViewController
    - 스토리보드 상에서 기본 레이아웃 설정 및 IBOutlet 연결
    - JSONDecoder를 통해 Expoosition 타입의 인스턴스 생성
    - Exposition 인스턴스의 프로퍼티를 통해 레이블의 텍스트를 할당
    - NavigationController 임베드
    - NavigationBar hidden 처리 및 화면 전환시 hidden 해제
    - Segue를 통해 화면전환 구현
- ExhibitionListViewController
    - 스토리보드 상에서 테이블뷰와 프로토타입셀 추가하고 tableView 프로퍼티와 연결
    - JSONDecoder를 통해 [Exbibition] 타입의 인스턴스 생성
    - extension을 통해 UITabelViewDataSource 및 UITableViewDelegate 프로토콜 채택
    - 각 셀별로 기본설정을 해 주는 confogureCells 메서드 구현
    - Segue를 통해 화면전환 구현
    - 다음 화면에 넘겨줄 데이터를 위한 prepare 메서드 내부 코드 작성
- ExhibitionViewController
    - 스토리보드 상에서 기본 레이아웃 설정 및 IBOutlet 연결
    - 이전 화면에서 받아온 데이터를 통해 레이블과 이미지 및 네비게이션 타이틀 설정
    
221021
- refactoring
    - 컨벤션 통일
    - 기능이 많은 메서드 분리 및 연산 프로퍼티 작성
    - 네이밍 수정
    - 은닉화
</details>
<details>
<summary>STEP 2 Feedback 반영</summary>
    
221025
- InformationViewController
    - JSONDecoder 관련 코드 간략화
- ExhibitionListViewController
    - 테이블뷰 관련 메서드 분리
    - 메서드 네이밍 복수형 수정
    - cellIdentifier 프로퍼티 삭제
    - prepare 메서드 구현부 수정
    - JSONDecoder 관련 코드 간략화
    - 메서드 선언부 위치 수정
- ExhibitionListTableViewCell
    - cellIdentifier 프로퍼티 추가
    - initializer를 통해 cellIdentifier 할당
    - nameLabel의 text를 반환하는 연산 프로퍼티 text 추가
- ExhibitionViewController
    - 메서드 분리
- JSONDecoder + Extension
    - 데이터에셋의 name과 변환할 타입을 받아 디코딩을 수행하는 타입 메서드 decodeAsset 구현
- 기타
    - 각 타입별 프로퍼티 및 메서드 은닉화
    - 컨벤션 정리
    - namespace 역할을 하는 Constant 타입 생성
</details>
<details>
<summary>STEP 3</summary>

221026
- StoryBoard
    - 첫 번째 화면(InformationViewController) 요구사항 구현
    - 두 번째 화면(ExhibitionListViewController) 요구사항 구현
    - 세 번째 화면(ExhibitionViewController) 요구사항 구현
    - 요구사항에 맞게 화면이 보이는 위치를 디바이스 맨 아래부분까지로 제약 수정
    - 각종 레이블 및 버튼에 DynamicType 적용
- 기타
    - 최종 구현이 완료된 클래스에 final 키워드 적용
</details>
<details>
<summary>STEP 3 Feedback 반영</summary>
    
221028
- 은닉화
    - `@IBOutlet private weak var`로 컨벤션 수정
    - 프로퍼티 은닉화할 수 있도록 메서드 캡슐화
- identifier
    - 보다 구체적인 identifier를 사용하기 위해 cell의 타입 이름 "ExhibitionListTableViewCell" 사용
</details>
    
## 👀 시각화된 프로젝트 구조

```
[Expo1900]
 ├── Info.plist
 ├── Source
 │   ├── App
 │   │   ├── AppDelegate.swift
 │   │   └── SceneDelegate.swift
 │   ├── Model
 │   │   ├── Exhibition.swift
 │   │   ├── Exposition.swift
 │   │   ├── JSONDecodeExtension.swift
 │   │   └── Constant.swift
 │   ├── View
 │   │   └── Base.lproj
 │   │   │   └── Main.storyboard
 │   │   └── ExhibitionListTableViewCell.swift
 │   └── Controller
 │       ├── InformationViewController.swift
 │       ├── ExhibitionListViewController.swift
 │       ├── ExhibitionViewController.swift
 │       └── OrientationMaskController.swift
 └── Resource
     ├── Assets.xcassets
     │   ├── AppIcon.appiconset
     │   │   └── Contents.json
     │   ├── AccentColor.colorset
     │   │   └── Contents.json
     │   ├── expo_assets
     │   │   └── Contents.json
     │   └── Contents.json
     └── Base.lproj
         └── LaunchScreen.storyboard
```

## 💻 실행 화면

|1번화면|2번화면|
|:-:|:-:|
|1번설명|2번설명|
|3번화면|4번화면|
|3번설명|4번설명|
|5번화면|6번화면|
|5번설명|6번설명|
|7번화면|8번화면|
|7번설명|8번설명|

## ❓ 트러블 슈팅

- #### 테이블뷰 셀
    두 번째 화면(출품작 리스트 테이블뷰)에서 사용할 프로토타입 셀에서 필요한 것은 좌측의 이미지, 타이틀, 간단한 설명의 두 레이블이라고 생각했습니다. 이는 subtitle 스타일의 셀과 유사하다고 생각해 처음에는 기본 셀의 subtitle을 사용하였습니다. 그런데 액세서리뷰를 설정하는 순간부터 스크롤이 튀는 버그가 있고, 일정한 이미지 사이즈를 맞추는 것이 적절한 것 같아 커스텀 셀을 사용하는 것으로 변경하였습니다.
- #### 매직리터럴 vs 네임스페이스
    `InformationViewController`파일에 작성된 코드 중 `"exposition_universelle_1900"`,`"메인"`와 같이 매직리터럴 사용하는 방식에서 휴먼에러 방지를 위해 enum을 사용하여 namespace 설정을 해야하나 고민해봤으나, 재사용되는 것이 아니기에 STEP2는 매직리터럴을 사용하였습니다.
- #### 크기가 다른 문자열
    첫 화면의 방문객 수, 개최지, 개최기간 등은 콜론(:)을 기준으로 왼쪽과 오른쪽의 폰트 사이즈가 다릅니다. 해당 사항을 가장 쉽게 구현하는 것은 StackView에 Label을 두 개 넣는 것이라고 생각했는데, attributedLabel을 사용하면 단일 레이블로도 같은 결과를 낼 수 있었습니다. 더 직관적이고 간단한 방법으로 작업하기 위해 attributedLabel을 사용하기로 결정하였습니다.
- #### View vs StackView
    오토레이아웃을 적용하면서 stackView가 제약 잡는 데에 더 까다로운 부분들이 있어서 view가 더 편한 것은 아닌가? 하는 생각이 들었습니다. 이 부분은 경험이 더 축적되야 판단이 설 수 있는 문제로 인지하였습니다. 추후에 View와 StackView를 어떤 경우에 사용해줘야 하는지에 대한 판단의 기준을 알게되면 추가로 내용 첨부하겠습니다.
    > 피드백 받은 의견 : StackView가 아무래도 꽤 편하게 레이아웃을 잡게 해주는 친구라고 저는 생각하는데🤔 뭐 이것도 개인마다 다르지않을까 싶네요ㅎㅎ
    > 저는 그래서 StackView를 사용할 수 있는 레이아웃이면 그렇게 하고, StackView로는 안되는 뷰들은 오토레이아웃을 딱딱 잡는것 같아요!!
    > 이건 정말 정답이 없고 스타일 차이라고 생각합니다:)
    > 둘다 가능한 상황이면 더 선호하는 방법을 택하거나! 성능 같은것들도 한번 고려해볼 수 있겠죠~? 근데 지금 같은 뷰에서는 성능 같은건 딱히 고민해볼 필요가 없을것 같아요! (시간되실때 StackView 성능 한번 검색 해보세용)
- #### AutoLayout
    원하는대로 배치가 이루어지지 않아 많이 고생한 부분입니다. 이번에 오토레이아웃을 경험해보면서 느낀점은 개발자 성향에 따라 오토레이아웃 방법이 다양하게 나올 수 있다는 것이였습니다. 그러하여, 뷰를 구성할때 기본적으로 오토레이아웃을 잡아주는 부분들은 통일된 방법이 있는지 궁금해져서 추후에 추가 학습을 통해 알게된 정보가 있다면 내용 첨부하겠습니다.
    > 피드백 받은 의견 : 기본적인 개념들만 충실히 알고 있는 상태로 연습을 하다보면 패턴?들이 보이게 될겁니다! 너무 규칙화된 방법을 외우려고하면 나중에 복잡한 오토레이아웃을 다뤄야될때 오히려 발목을 잡힐 수도 있을것 같아요!
        
## 🔗 참고 링크

- Apple Developer Documentation
    - [UITableView](https://developer.apple.com/documentation/uikit/uitableview)
    - [TableViews](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)
    - [Filling a table with data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)
    - [Configuring the cells for your table](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table)
    - [JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
        - [Using JSON with Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)
        - [Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
- WWDC
    - [Accessibility Inspector (WWDC 2019)](https://developer.apple.com/videos/play/wwdc2019/257/)
    - [Writing Great Accessibility Labels (WWDC 2019)](https://developer.apple.com/videos/play/wwdc2019/254/)
- 위키백과
    - [JSON](https://ko.wikipedia.org/wiki/JSON)
- 야곰닷넷
    - [LLDB 정복하기](https://yagom.net/courses/start-lldb/)

---

[🔝 맨 위로 이동하기](#만국박람회)
