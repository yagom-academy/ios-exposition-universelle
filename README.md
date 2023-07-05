
# 🇰🇷 만국박람회 _ 최고래👍🏻🐋

## 📖 목차
🍀 [소개](#-소개) <br>
👨‍💻 [팀원](#-팀원) <br>
⏱️ [타임라인](#-타임라인) <br>
💻 [실행 화면](#-실행-화면) <br>
🔍 [구조적 고민](#-구조적-고민) <br>
🧨 [트러블 슈팅](#-트러블-슈팅) <br>
📚 [참고 링크](#-참고-링크) <br>

</br>

## 🍀 소개
프랑스 만국박람회에 대한 정보와 출품작 리스트를 보여주는 프로젝트입니다. <br>
JSON 형태로 주어진 DataAsset을 변환하고, ImageAsset과 함께 테이블뷰로 나타냅니다.

</br>

## 👨‍💻 팀원
| 🐬Whales🐬 | 🤖maxhyunm🤖 |
| :--------: | :--------: |
| <Img src = "https://github.com/WhalesJin/ios-exposition-universelle/assets/124643545/391a211d-cf10-4e0a-99b4-2518d2de33e9" width="200"> | <Img src = "https://hackmd.io/_uploads/rk62zRiun.png" width="200"> |
|[Github Profile](https://github.com/WhalesJin) |[Github Profile](https://github.com/maxhyunm) |



</br>

## ⏱️ 타임라인
|날짜|내용|
|:--:|--|
|2023.06.27| - Items 구조체 및 테스트 생성 <br> - ExpositionUniverselle 구조체 및 테스트 생성 <br> - NumberFormatter를 거친 formattedVisitors 프로퍼티 생성 <br> - test로 누락된 numberStyle 설정 발견하여 추가 |
|2023.06.28| - NavigationController 생성 및 연결  <br> - JSON Decoding을 위한 setUpEntity 메서드 생성 <br> - ScrollView, StackView 생성 및 하위 요소 구현 <br> - StackView 구성을 위한 메서드 생성 |
|2023.06.29| - ExpositionViewController UI 레이아웃 수정<br> - ExpositionItemViewController 생성 및 ViewController 전환을 위한 메서드 연결 <br> - ExpositionItemTableViewCell 커스텀 타입을 통한 TableView 구현<br> - ExpositionItemDetailViewController 구현<br> - 오류처리 메서드 구현<br> - Namespace 생성하여 매직리터럴 수정 |
|2023.06.30| - DecodingManager 구조체 생성<br> - MainStackView 분리 <br> - ExpositionInformationStackView 분리 <br> -ChangeViewButtonStackView 분리 <br> - addSubView와 constraint 처리 메서드 분리 |

</br>

## 💻 실행 화면

| 스크롤 정상 화면 | 화면 전환 | 포스터 누락 | Items 누락 |
| :--------: | :--------: | :--------: | :--------: |
| <img src = "https://github.com/WhalesJin/ios-exposition-universelle/assets/124643545/2e9a4a55-569d-4f15-9df3-3c74f3d41316" width = "200"> | <img src = "https://github.com/WhalesJin/ios-exposition-universelle/assets/124643545/6a4a3f58-f302-4e19-9a05-16b58f5742a8" width = "200"> | <img src = "https://github.com/WhalesJin/ios-exposition-universelle/assets/124643545/8891b83c-1c28-4185-a8b2-f706e751e723" width = "200"> | <img src = "https://github.com/WhalesJin/ios-exposition-universelle/assets/124643545/a79426e1-9aaa-4103-8145-6a15b376ccb0" width = "200"> |

</br>

## 🔍 구조적 고민
### Model
#### 🔹 Codable / Decodable / Encodable
`JSON` 인코딩/디코딩을 위해서는 `Codable`, `Decodable`, `Encodable` 프로토콜 중 선택하여 채택해야 하는 것으로 이해하고 있습니다. 데이터를 받기와 보내기가 모두 이루어지는 경우라면 `Codable`을 활용해야 하지만, 만국박람회의 경우 저장된 `JSON 데이터`를 불러오기만 하는 것으로 생각되어 `Decodable`을 선택하였습니다.

#### 🔹 let / var
처음에는 `ExpositionUniverselle`과 `Items` 구조체의 프로퍼티를 모두 `var`로 생성하려고 했습니다. 하지만 한 번 불러온 데이터를 수정할 일이 있을까?라는 생각이 들었습니다. 결과적으로 만국박람회 데이터는 특별히 전처리를 거치며 수정할 내용이 없고, 기존의 데이터를 보여주기만 하면 충분한 것으로 판단하여 `let`으로 결정하게 되었습니다.

#### 🔹 CodingKey
데이터셋에 포함된 `JSON 파일`은 스위프트와 달리 `스네이크 케이스`로 작성되어 있었습니다. 때문에 `카멜 케이스` 형식으로 변환하기 위하여 중첩 `CodingKey` `Enum`을 구현했습니다

#### 🔹 UIImage
`Items` 구조체에서 `imageName`을 활용하여 `UIImage`를 불러오는 연산 프로퍼티를 추가하려고 했습니다. 하지만 이번 요구사항은 모델 타입을 구현하는 것이고, `UIImage`를 불러오는 로직은 테이블 뷰에서 수행하는 게 맞는 것 같다는 생각이 들어 추후로 미뤄두었습니다.

#### 🔹 NumberFormatter  
숫자 타입으로 되어있는 방문객 수를 천단위 구분기호가 들어간 `String` 타입으로 리턴하기 위해 `NumberFormatter`를 사용했습니다. 처음에는 `NumberFormatter`를 위한 파일을 구분하려 했는데, 다음과 같은 이유에서 `ExpositionUniverselle` 구조체 내부에서 연산 프로퍼티로 처리했습니다.
- 프로젝트 내부에서 달리 포매터가 사용되는 것이 없음
- 만약 박람회가 여러 개로 확장이 되더라도 디코딩시 동일한 타입을 사용하게 된다면 해당 프로퍼티로 충분히 활용 가능

---
### View

#### 🔹 UI 구현 - Storyboard vs Code
🤔 스토리보드는 이미 많은 부분을 자동으로 해주고 있어서 참 편리한 친구라고 생각하지만 스토리보드로만 할 수 있는 부분에 대해서는 한계가 있기에 코드로 구현하는 부분들을 더 활용하고 싶어서 공부를 하고 적용해 보았습니다.
- 스토리보드와 코드를 비교했을 때 코드의 장점
    - 나중에 소스로 볼 때
        - 스토리보드 : XML이라 보기 힘들다
        - 코드 : 코드로 적은 거라 더 깔끔하고 이해하기 좋다
    - 빌드
        - 스토리보드 -> 코드 -> 시뮬레이터
        - 코드 -> 시뮬레이터 (빌드 속도가 좀 더 빠르다)
- 코드베이스로 구현한 이유
    - 커스텀으로 `TableViewCell`과 `View`들을 만들어 적용해보기 위해(`View` 파일 분리)
    - 기존에 스토리보드 형태로만 작업을 해 보았기 때문에 새로운 학습을 위해 시도
- 스토리보드 삭제 진행 과정
    - 삭제할 항목
        - Main.storyboard
        - info.plist -> ... -> Storyboard Name
        - info.plist -> Main storyboard file base name

🚨 필요한 항목을 삭제하고 나니 앱이 가장 처음 보여줄 `ViewController`를 찾지 못해 빌드 오류가 발생했습니다.

💡 `SceneDelegate`의 `scene 메서드` 내부에 다음 코드를 삽입하여 해결하였습니다.(`NavigationController`를 위한 추가 구현 포함)
```swift
guard let windowScene = (scene as? UIWindowScene) else { return }
window = UIWindow(windowScene: windowScene)
let mainViewController = ViewController()
let navigationController = UINavigationController (rootViewController: mainViewController)
window?.rootViewController = navigationController
window?.makeKeyAndVisible()
```

#### 🔹 ViewController 기능 분리
🤔 요소를 구현할 때마다 관련 인스턴스를 생성하여 추가하고 제약조건을 넣다 보니 ViewController가 너무 무거워지는 것을 느꼈습니다. 때문에 아래 방법들로 ViewController의 정리 및 기능 분리를 시도했습니다.
- View 파일 분리
    - 내부 요소로 추가되는 중첩 `StackView`를 커스텀 `StackView`로 분리했습니다.
        - `MainStackView`
        - `ExpositionInformationStackView`
        - `ChangeViewButtonStackView`
    - 데이터 형태에 맞춰 `TableViewCell`을 유연하게 관리하기 위해 커스텀 Cell을 만들어 분리했습니다.
        - `ExpositionItemTableViewCell`
- DecodingManager 분리
    - 데이터를 불러오는 작업만을 `DecodingManager`로 분리하여 어디에서든 접근 가능하도록 만들었습니다.
- 제약조건 설정 메서드 분리
    - 제약조건 관련 내용을 하나의 메서드에 담아 `ExpositionViewController`의 `extension`으로 분리해 추가했습니다.
- Namespace 생성
    - 매직리터럴로 작성된 파일명이나 타이틀명 등을 추후 유지보수를 위하여 분리했습니다.
        - `ViewControllerTitleNamespace`
        - `AssetNamespace`
        - `LabelTextNamespace`
        - `IdentifierNamespace`

#### 🔹 ViewController 간 데이터 전달방법
🤔 출품작 목록에서 출품작 상세 내용으로 이동할 때 해당 출품작에 대한 정보를 새로운 `ViewController`로 전달해야 했습니다. 이때 데이터를 전달할 방법에 대해 아래와 같은 방법들을 고려했습니다.
1. `init`으로 전달
    ```swift
    // ExpositionItemDetailViewController.swift (세번째 화면)
    init(expositionItemDetail: ExpositionItemEntity) {
        self.expositionItemDetail = expositionItemDetail
        super.init(nibName: nil, bundle: nil)
    }
    ```
    ```swift
    // ExpositionItemViewController.swift (두번째 화면)
    let detailViewController = ExpositionItemDetailViewController(expositionItemDetail: expositionItemEntity[indexPath.row])
    ```
    - 새로운 `ViewController`에서 데이터를 전달받을 수 있도록 `init`을 생성하여 전달받는 방법이 비교적 간단하다고 생각되었습니다.
2. 새로운 `ViewController` 객체에 `setter`를 만들거나 프로퍼티 자체에 접근해서 데이터 전달
    ```swift
    let detailViewController = ExpositionItemDetailViewController()
    detailViewController.expositionItemDetail = expositionItemEntity[indexPath.row]
    ```
    - 간단한 방법이지만 한 `ViewController`에서 다른 `ViewController`의 객체에 직접 접근하는 방식이 바람직한지에 대한 의구심이 들었습니다.
3. `delegate` 패턴으로 전달
    - `ItemDetailView`에서 이전 화면인 `ItemView`에 접근하여 데이터를 가져오는 것 자체는 가능하지만, 현재 `TableView` 내부에서 선택된 데이터가 무엇인지 특정하는 것이 불가능하다 판단하였습니다.

💡 결과적으로 1번(init으로 전달하는 방법)을 선택하였습니다.

#### 🔹 errorLabel
- 처음에는 데이터를 받아오지 못한 경우 화면에 "데이터를 불러오지 못했습니다"라는 Label을 표시하도록 구현했습니다.
    ```swift
    private func configureErrorLabel() {
        let errorLabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text ="데이터를 불러오지 못했습니다."
            return label
        }()
    }
    ```

    <img src = "https://github.com/WhalesJin/ios-exposition-universelle/assets/124643545/2707c8c0-b17d-46aa-a802-4ae5dca98a39" width = "200">
- 데이터의 일부 파일만 Decoding 되었을 때는 Decoding 된 파일은 보이는 게 더 적절하다고 판단하여 수정하였습니다
    - 실행화면 예시 : 

    | 정상 화면 | 박람회 정보 데이터 누락 | 포스터 누락 |
    | :--------: | :--------: | :--------: |
    | <img src = "https://github.com/WhalesJin/ios-exposition-universelle/assets/124643545/bcefae4f-f695-4c24-b33e-c83a221ac82d" width = "200"> | <img src = "https://github.com/WhalesJin/ios-exposition-universelle/assets/124643545/f2f4bda1-afb9-4370-b8a2-2cb4e75f824e" width = "200"> | <img src = "https://github.com/WhalesJin/ios-exposition-universelle/assets/124643545/1de0918e-6abf-4622-b969-08fa6e05455c" width = "200"> |

</br>

## 🧨 트러블 슈팅

1️⃣ **레이아웃 관리** <br>
- **`StackView` 내부 요소가 화면 영역보다 커지는 경우** <br>
    🚨 **문제점** <br>
    - `StackView`의 `leftAnchor`, `rightAnchor`를 맞추었음에도 불구하고 `StackView` 내부 요소가 커지면 상위 요소들이 함께 늘어나는 것을 확인했습니다. <br>
    <img src="https://hackmd.io/_uploads/S1xJxAj_h.png" width="200">

    💡 **해결방법** <br>
    - `StackView`의 `width`를 지정하여 해결하였습니다.
        ```swift
        mainStackView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, constant: -40)
        ```

- **`StackView` 내부 요소가 잘리거나 사라지는 경우** <br>

    🚨 **문제점** <br>
    - `horizontal`로 지정된 `StackView`에서 하나의 요소가 커지면 다른 요소가 잘리거나 사라지는 것을 확인했습니다. <br>
        <img src="https://hackmd.io/_uploads/HJCCJCsOn.png" width="200">
        
    💡 **해결방법** <br>
    - `setContentCompressionResistancePriority` 설정으로 텍스트버튼의 resistance 우선순위를 높였습니다.
    - 태극기의 높이를 버튼 높이와 맞추고, 태극기의 가로 길이는 높이와 비율을 계산하여 맞추어 해결하였습니다.
<br>

## 📚 참고 링크
- [🍎Apple Docs: Codable](https://https://developer.apple.com/documentation/swift/codable)
- [🍎Apple Docs: JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
- [🍎Apple Docs: Using JSON with Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)
- [🍎Apple Docs: Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
- [🍎Apple Docs: TableView](https://developer.apple.com/documentation/uikit/uitableview)
- [🍎Apple Docs: TableViewCell](https://developer.apple.com/documentation/uikit/uitableviewcell)
- [🍎Apple Docs: setContentCompressionResistancePriority](https://developer.apple.com/documentation/uikit/uiview/1622526-setcontentcompressionresistancep)
- [🍎Apple Docs: UIStackView](https://developer.apple.com/documentation/uikit/uistackview)
- [📗Wikipedia: JSON](https://developer.apple.com/documentation/foundation/jsondecoder)
- <Img src = "https://github.com/mint3382/ios-calculator-app/assets/124643545/56986ab4-dc23-4e29-bdda-f00ec1db809b" width="20"/> [부스트코스: 기상정보 어플리케이션](https://www.boostcourse.org/mo326/joinLectures/12973?isDesc=false)
- <Img src = "https://hackmd.io/_uploads/ByTEsGUv3.png" width="20"/> [blog: 연산 프로퍼티](https://babbab2.tistory.com/119)
