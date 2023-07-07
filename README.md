
# 🇰🇷 만국박람회 _ 최고래👍🏻🐋


## 📖 목차
🍀 [소개](#소개) </br>
👨‍💻 [팀원](#팀원) </br>
⏱️ [타임라인](#타임라인) </br>
👀 [시각화된 프로젝트 구조](#시각화된_프로젝트_구조) </br>
💻 [실행 화면](#실행_화면) </br>
🧨 [트러블 슈팅](#트러블_슈팅) </br>
📚 [참고 링크](#참고_링크) </br>
👥 [팀 회고](#팀_회고) </br>

</br>

## 🍀 소개<a id="소개"></a>
1900년 프랑스 만국박람회에 대한 정보와 한국 출품작 리스트를 보여주는 프로젝트입니다.

🫣 손 쉬운 사용 탭에 가시면 더 큰 글씨로 볼 수 있어요(👌🏻🤚🏻) 🫣

</br>

## 👨‍💻 팀원<a id="팀원"></a>
| 🐬Whales🐬 | 🤖maxhyunm🤖 |
| :--------: | :--------: |
| <Img src = "https://hackmd.io/_uploads/ByCERrEYn.png" width="200"> | <Img src = "https://hackmd.io/_uploads/rk62zRiun.png" width="200"> |
|[Github Profile](https://github.com/WhalesJin) |[Github Profile](https://github.com/maxhyunm) |

</br>

## ⏱️ 타임라인<a id="타임라인"></a>
|날짜|내용|
|:--:|--|
|2023.06.27| - Items 구조체 및 테스트 생성 <br> - ExpositionUniverselle 구조체 및 테스트 생성 <br> - NumberFormatter를 거친 formattedVisitors 프로퍼티 생성 <br> - test로 누락된 numberStyle 설정 발견하여 추가 |
|2023.06.28| - NavigationController 생성 및 연결  <br> - JSON Decoding을 위한 setUpEntity 메서드 생성 <br> - ScrollView, StackView 생성 및 하위 요소 구현 <br> - StackView 구성을 위한 메서드 생성 |
|2023.06.29| - ExpositionViewController UI 레이아웃 수정<br> - ExpositionItemViewController 생성 및 ViewController 전환을 위한 메서드 연결 <br> - ExpositionItemTableViewCell 커스텀 타입을 통한 TableView 구현<br> - ExpositionItemDetailViewController 구현<br> - 오류처리 메서드 구현<br> - Namespace 생성하여 매직리터럴 수정 |
|2023.06.30| - DecodingManager 구조체 생성<br> - MainStackView 분리 <br> - ExpositionInformationStackView 분리 <br> -ChangeViewButtonStackView 분리 <br> - addSubView와 constraint 처리 메서드 분리 |
|2023.07.03| - Namespace 생성하여 매직넘버 수정<br> - inputDataToCell 메서드 생성<br> - 데이터 전처리를 위한 String 확장|
|2023.07.04| - MainStackView 타입 삭제<br> - DecodingManager 싱글톤 패턴 적용<br> - ErrorLabel 타입 생성<br> - FlagImageView를 생성하는 메서드 구현 |
|2023.07.05| - 첫 화면 세로 고정 구현<br> - 제약조건을 추가하여 레이아웃 조절<br> - 이미지와 레이블에 DynamicType 적용 |
|2023.07.06| - 파일 구조 변경 |

</br>

## 👀 시각화된 프로젝트 구조<a id="시각화된_프로젝트_구조"></a>

### 🎨 화면구성안
<img src="https://hackmd.io/_uploads/SyzEeVBK2.jpg" width="500">

### ℹ️ File Tree
    ┌── Expo1900
    │   ├── Expo1900
    │   │   ├── App
    │   │   │   ├── AppDelegate
    │   │   │   └── SceneDelegate
    │   │   ├── Extension
    │   │   │   ├── String+
    │   │   │   └── UInt+
    │   │   ├── Model
    │   │   │   ├── DecodingError
    │   │   │   ├── DecodingManager
    │   │   │   ├── ExpositionEntity
    │   │   │   └── ExpositionItemEntity
    │   │   ├── View
    │   │   │   ├── ChangeViewButtonStackView
    │   │   │   ├── ErrorLabel
    │   │   │   ├── ExpositionInformationStackView
    │   │   │   └── ExpositionItemTableViewCell
    │   │   ├── Controller
    │   │   │   ├── ExpositionItemDetailViewController
    │   │   │   ├── ExpositionItemViewController
    │   │   │   └── ExpositionViewController
    │   │   ├── Namespace
    │   │   │   ├── AssetNamespace
    │   │   │   ├── ConstraintsNamespace
    │   │   │   ├── IdentifierNamespace
    │   │   │   ├── LabelTextNamespace
    │   │   │   ├── MultiplierNamespace
    │   │   │   ├── SpacingNamespace
    │   │   │   └── ViewControllerTitleNamespace
    │   │   ├── Assets
    │   │   ├── Info
    │   │   └── LaunchScreen
    │   └── Expo1900ModelTests
    │       ├── Expo1900ExpositionEntityTests
    │       ├── Expo1900ExpositionItemEntityTests
    │       └── Expo1900UIntTests
    │
    └── README.md

### 📐 Diagram
<p align="center">
    
<img width="800" src= "https://hackmd.io/_uploads/HJ28i7EF3.png"> <br>
    
<details> <summary> 1. ExpositionViewController </summary>
    <div markdown = "1">
        <img width="800" src= "https://hackmd.io/_uploads/r1nUiQNtn.png">
    </div>
</details> <br>
        
<details> <summary> 2. ExpositionItemViewController </summary>
    <div markdown = "1">
        <img width="500" src= "https://hackmd.io/_uploads/HkhIi7VFh.png">
    </div>
</details> <br>

<details> <summary> 3. ExpositionItemDetailViewController </summary>
    <div markdown = "1">
        <img width="500" src= "https://hackmd.io/_uploads/HJnUjQVF2.png"> <br>
    </div>
</details> <br>

</p>

## 💻 실행 화면<a id="실행_화면"></a>

| 실행화면(세로) | 디코딩 오류시 | 폰트 크기 변경 |
| :--------: | :--------: | :--------: |
| <img src = "https://github.com/WhalesJin/ios-exposition-universelle/assets/124643545/d0b64e3c-f56a-45f7-b6cc-f3ed35358f38" width = "200"> | <img src = "https://github.com/WhalesJin/ios-exposition-universelle/assets/124643545/a8dc7248-1853-4168-a05f-c053e8ff6a04" width = "200"> | <img src = "https://github.com/WhalesJin/ios-exposition-universelle/assets/124643545/e395b82c-08a1-41d6-80b6-70da8f7a0e2e" width = "200"> |

</br>

| 실행화면(가로) |
| :--------: |
| <img src = "https://github.com/WhalesJin/ios-exposition-universelle/assets/124643545/7db59119-4705-4e1a-a609-5e93d6f54286" height = "200"> |

| 폰트 크기 변경 |
| :--------: |
| <img src = "https://github.com/WhalesJin/ios-exposition-universelle/assets/124643545/782736e2-d823-4107-87af-13d858045f34" height = "200"> |

</br>

## 🧨 트러블 슈팅<a id="트러블_슈팅"></a>

### 0️⃣ UI 구현 - Storyboard vs Code
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

🚨 **문제점** <br>

- 필요한 항목을 삭제하고 나니 앱이 가장 처음 보여줄 `ViewController`를 찾지 못해 빌드 오류가 발생했습니다.

<br>

💡 **해결방법** <br>
- `SceneDelegate`의 `scene 메서드` 내부에 다음 코드를 삽입하여 해결하였습니다.(`NavigationController`를 위한 추가 구현 포함)
- 
    ```swift
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: windowScene)
    let mainViewController = ViewController()
    let navigationController = UINavigationController (rootViewController: mainViewController)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    ```

### 1️⃣ ViewController 기능 분리

🚨 **문제점** <br>

- 요소를 구현할 때마다 관련 인스턴스를 생성하여 추가하고 제약조건을 넣다 보니 `ViewController`가 너무 무거워지는 것을 느꼈습니다.

<br>

💡 **해결방법** <br>
- 아래 방법들로 `ViewController`의 정리 및 기능 분리를 시도했습니다.
    - `View` 파일 분리
        - 내부 요소로 추가되는 중첩 `StackView`를 커스텀 `StackView`로 분리했습니다.
            - `ExpositionInformationStackView`
            - `ChangeViewButtonStackView`
        - 데이터 형태에 맞춰 `TableViewCell`을 유연하게 관리하기 위해 커스텀 `Cell`을 만들어 분리했습니다.
            - `ExpositionItemTableViewCell`
    - `DecodingManager` 분리
        - 데이터를 불러오는 작업만을 `DecodingManager`로 분리하여 어디에서든 접근 가능하도록 만들었습니다.
    - 제약조건 설정 메서드 분리
        - 제약조건 관련 내용을 하나의 메서드에 담아 `ExpositionViewController`의 `extension`으로 분리해 추가했습니다.
    - `Namespace` 생성
        - 매직리터럴로 작성된 파일명이나 타이틀명 등을 추후 유지보수를 위하여 분리했습니다.
            - `ViewControllerTitleNamespace`
            - `AssetNamespace`
            - `LabelTextNamespace`
            - `IdentifierNamespace`
            - `SpacingNamespace`
            - `ConstraintsNamespace`
            - `MultiplierNamespace`

### 2️⃣ ViewController 간 데이터 전달방법
🚨 **문제점** <br>
- 출품작 목록에서 출품작 상세 내용으로 이동할 때 해당 출품작에 대한 데이터를 전달할 방법에 대해 아래와 같은 방법들을 고려했습니다.
    1. 새로운 `ViewController`에서 데이터를 전달받을 수 있도록 `init`을 생성하여 전달받는 방법
    2. 새로운 `ViewController` 객체에 `setter`를 만들거나 프로퍼티 자체에 접근해서 데이터 전달
    3. `delegate` 패턴으로 전달

    2번은 간단한 방법이지만 한 `ViewController`에서 다른 `ViewController`의 객체에 직접 접근하는 방식이 바람직한지에 대한 의구심이 들었습니다.
    3번의 경우 데이터 전달에 용이한 디자인패턴이지만, 한 번 데이터를 받아오기 위해 `delegate` 객체를 만들고 선택된 `row`를 확인하는 과정이 들어가는 것이 다소 비효율적이라고 판단되었습니다.

<br>

💡 **해결방법** <br>
- 결과적으로 1번이 가장 효율적이고 적절하다고 판단되어, 생성자를 이용한 방식으로 구현하였습니다.
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

<br>

### 3️⃣ errorLabel

| 일부 데이터만 보여지는 경우 |
| :--------: | 
| <img src = "https://hackmd.io/_uploads/SyFwJUNF2.png" width = "200">  |

🚨 **문제점** <br>
- `JSON 데이터`를 디코딩하는 과정에서 오류가 날 경우 일부 내용만 정상적으로 그려졌습니다.
예를 들어, 박람회 정보의 디코딩 오류가 생긴다면 아래 화면처럼 포스터와 레이블의 텍스트, 버튼은 정상적으로 구현이 되고 박람회 정보가 들어가는 곳만 누락 현상이 생깁니다. 하나의 정보라도 디코딩에 실패한다면 화면 구성이 안되는 게 맞다고 판단하여 수정하였습니다.
    

<br>

💡 **해결방법** <br>
- 예외처리를 위한 에러타입을 만들어, 예외가 발생했을 경우 `viewDidLoad`에서 다른 화면을 그리지 않고 해당 에러메시지만 띄울 수 있도록 구현하였습니다.
    ```swift
    // DecodingError.swift

    enum DecodingError: Error {
        case failedDecoding
        case unknown

        var message: String {
            switch self {
            case .failedDecoding:
                return "데이터를 불러오지 못했습니다."
            case .unknown:
                return "알 수 없는 오류입니다."
            }
        }
    }
    ```
    ```swift
    // ExpositionViewController.swift

    do {
          ...

    } catch DecodingError.failedDecoding {
        ErrorLabel(DecodingError.failedDecoding.message, frame: view.frame).configureUI(view)
    } catch {
        ErrorLabel(DecodingError.unknown.message, frame: view.frame).configureUI(view)
    }
    ```

<br>

### 4️⃣ `StackView` 내부 요소가 화면 영역보다 커지는 경우 <br>
| 요소가 영역을 벗어나는 경우 |
| :--------: | 
| <img src="https://hackmd.io/_uploads/S1xJxAj_h.png" width="200">  |

🚨 **문제점** <br>
- `StackView`의 `leftAnchor`, `rightAnchor`를 맞추었음에도 불구하고 `StackView` 내부 요소가 커지면 상위 요소들이 함께 늘어나는 것을 확인했습니다.


<br>

💡 **해결방법** <br>
- `StackView`의 `width`를 지정하여 해결하였습니다.
    ```swift
    mainStackView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, constant: -40)
    ```

### 5️⃣ `StackView` 내부 요소가 잘리거나 사라지는 경우 <br>

| 요소가 사라지는 경우 |
| :--------: | 
| <img src="https://hackmd.io/_uploads/HJCCJCsOn.png" width="200">  |

🚨 **문제점** <br>
- `horizontal`로 지정된 `StackView`에서 하나의 요소가 커지면 다른 요소가 잘리거나 사라지는 것을 확인했습니다.

<br>

💡 **해결방법** <br>
- `setContentCompressionResistancePriority` 설정으로 텍스트버튼의 `resistance` 우선순위를 높였습니다.
- 태극기의 높이를 버튼 높이와 맞추고, 태극기의 가로 길이는 높이와 비율을 계산하여 맞추어 해결하였습니다.
```swift
changeViewButton.setContentCompressionResistancePriority(.required, for: .horizontal)
changeViewButton.setContentCompressionResistancePriority(.required, for: .vertical)

NSLayoutConstraint.activate([
    rightFlagView.widthAnchor.constraint(equalTo: leftFlagView.widthAnchor),
    leftFlagView.heightAnchor.constraint(equalTo: changeViewButton.heightAnchor)
])
```

<br>

### 6️⃣ Cell 내부 레이아웃

| 하단 label 높이 오류 |
| :--------: | 
| <img src = "https://hackmd.io/_uploads/S1g8JhzF3.png" width = "200">  |

🚨 **문제점** <br>
- `TableView의 Cell` 내부에 `imageView`와 `informationStackView`가 들어가도록 구현하였는데, `Cell`의 높이를 적용하는데 있어 어려움을 겪었습니다. 처음에는 `imageView`의 높이와 `informationStackView`의 높이를 모두 `contentView`와 맞추었는데, 이렇게 하니 `image` 높이가 늘어날 경우 `stackView`의 `shortDescriptionLabel` 높이가 함께 늘어나며 해당 `label` 위/아래로 공백이 생기는 문제가 발생했습니다.
```swift
NSLayoutConstraint.activate([
    ...
    informationStackView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
    image.heightAnchor.constraint(equalTo: contentView.heightAnchor),
    ...
])
```

<br>

💡 **해결방법** <br>
- 고민 끝에 `imageView` `informationStackView` 양쪽 모두 `topAnchor`를 `greaterThanOrEqualTo`로, `bottomAnchor`를 `lessThanOrEqualTo`로 수정하여 해결하였습니다.
이렇게 조절을 하면 상하여백이 유동적으로 움직일 수 있게 되기 때문에 사이즈에 변동이 생길 경우 위아래에만 추가 여백이 발생하게 됩니다. 덕분에 내부 요소의 크기가 불필요하게 늘어나는 상황을 방지할 수 있었습니다.

```swift
NSLayoutConstraint.activate([
    image.topAnchor.constraint(
        greaterThanOrEqualTo: contentView.topAnchor,
        constant: ConstraintsNamespace.imageViewFromCellTop
    ),
    image.bottomAnchor.constraint(
        lessThanOrEqualTo: contentView.bottomAnchor,
        constant: ConstraintsNamespace.imageViewFromCellBottom
    ),

    ...

    informationStackView.topAnchor.constraint(
        greaterThanOrEqualTo: contentView.topAnchor,
        constant: ConstraintsNamespace.stackViewFromCellTop
    ),
    informationStackView.bottomAnchor.constraint(
        lessThanOrEqualTo: contentView.bottomAnchor,
        constant: ConstraintsNamespace.stackViewFromCellBottom
    ),

    ...

])
```

<br>

### 7️⃣ 비율에 맞게 이미지 사이즈 조절
| 위/아래 공백 발생 | 
| :--------: | 
|  <img src = "https://hackmd.io/_uploads/r1--2oGt2.png" width = "200"> ||


🚨 **문제점** <br>
- `Cell` 내부 `imageView` 사이즈를 조절하는 과정에서, `width`는 `Cell`의 `width`의 `0.2` 비율로 잡아서 맞출 수 있었지만 `height`은 특정할 수 있는 기준이 없었습니다. 처음에는 `contentView`의 `height`을 기준으로 설정을 했었습니다.(step 2 진행 시점 기준) 하지만 여기에 `Aspect Fit` 모드를 사용하니 보여지는 `image` 비율만 유지되고 `imageView` 영역 자체에는 위/아래로 큰 공백이 생겼습니다.

<br>

💡 **해결방법** <br>
- `imageView`의 높이를 너비보다 커지지 못하도록 제한을 두어 해결하였습니다.
```swift
    ...
NSLayoutConstraint.activate([
    image.heightAnchor.constraint(lessThanOrEqualTo: image.widthAnchor),

    ...
])
```

<br>

### 8️⃣ DynamicType 구현
🚨 **문제점** <br>
- 처음에는 각 `Label`에 `preferredFont` 설정만을 추가하였고, 따라서 정상적으로 `DynamicType`이 적용되지 않았습니다.

<br>

💡 **해결방법** <br>
- 텍스트와 이미지에 `DynamicType`을 적용하기 위하여 `ImageView`와 `Label`에 각각 아래 코드를 추가하였습니다.
```swift
imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
```
```swift
label.numberOfLines = .zero
label.font = .preferredFont(forTextStyle: .body)
label.adjustsFontForContentSizeCategory = true
```

<br>


### 9️⃣ NumberFormatter 
🚨 **문제점** <br>
- 숫자 타입으로 되어있는 방문객 수를 천단위 구분기호가 들어간 `String` 타입으로 리턴하기 위해 `NumberFormatter`를 사용했습니다.
    처음에는 해당 로직을 `ExpositionUniverselle` 구조체 내부에서 연산 프로퍼티로 처리하였습니다. 하지만 이 방법은 `Formatter`의 재사용성을 고려했을 때 옳지 못한 방향이라고 생각되었습니다.

<br>

💡 **해결방법** <br>
- `UInt` 타입을 확장하여 메서드를 생성하는 방향으로 변경하였습니다.
    ```swift
    extension UInt {
        func formatToDecimal() -> String {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal

            guard let result = numberFormatter.string(for: self) else {
                return String(self)
            }

            return result
        }
    }
    ```
    
<br>

### 🔟 ExpositionItemEntity
- `Codable / Decodable / Encodable`
    - 이 프로젝트의 경우, 저장된 `JSON 데이터`를 불러오기만 하는 것으로 생각되어 `Decodable 프로토콜`을 채택하였습니다.
        - `Decodable` : 데이터를 받기만 하는 경우
        - `Encodable` : 데이터를 주기만 하는 경우
        - `Codable` : 데이터를 주고 받는 경우

- `CodingKey`
    - 데이터셋에 포함된 `JSON 파일`은 `스네이크 케이스`로 작성되어 있었습니다. 때문에 `카멜 케이스` 형식으로 변환하기 위하여 중첩 `CodingKey` `Enum`을 구현했습니다

- 코드
    ```swift
    struct ExpositionItemEntity: Decodable, Equatable {
        let name: String
        let imageName: String
        let shortDescription: String
        let description: String

        private enum CodingKeys: String, CodingKey {
            case name
            case imageName = "image_name"
            case shortDescription = "short_desc"
            case description = "desc"
        }
    }
    ```

<br>

## 📚 참고 링크<a id="참고_링크"></a>
#### 🔄 JSON Decoding
- [🍎Apple Docs: Codable](https://https://developer.apple.com/documentation/swift/codable)
- [🍎Apple Docs: JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
- [🍎Apple Docs: Using JSON with Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)
- [🍎Apple Docs: Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
- [🍎Apple Docs: JSONDecoder.KeyDecodingStrategy](https://developer.apple.com/documentation/foundation/jsondecoder/keydecodingstrategy)
- [📗Wikipedia: JSON](https://developer.apple.com/documentation/foundation/jsondecoder) </br>
#### 🗂️ TableView
- [🍎Apple Docs: TableView](https://developer.apple.com/documentation/uikit/uitableview)
- [🍎Apple Docs: TableViewCell](https://developer.apple.com/documentation/uikit/uitableviewcell)
- [🍎Apple Docs: Configuring The Cell](https://https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table)
- [🍎Apple Docs: UIStackView](https://developer.apple.com/documentation/uikit/uistackview)
- <Img src = "https://github.com/mint3382/ios-calculator-app/assets/124643545/56986ab4-dc23-4e29-bdda-f00ec1db809b" width="20"/> [부스트코스: 기상정보 어플리케이션](https://www.boostcourse.org/mo326/joinLectures/12973?isDesc=false) </br>
#### 📊 Layout
- [🍎Apple Docs: setContentCompressionResistancePriority](https://developer.apple.com/documentation/uikit/uiview/1622526-setcontentcompressionresistancep)
- [🍎Apple Docs: setContentHuggingPriority](https://developer.apple.com/documentation/uikit/uiview/1622485-setcontenthuggingpriority)
#### 🔀 Dynamic Type
- [🍎Apple Docs: adjustsFontForContentSizeCategory](https://developer.apple.com/documentation/uikit/uicontentsizecategoryadjusting/1771731-adjustsfontforcontentsizecategor)
- [🍎Apple Docs: adjustsImageSizeForAccessibilityContentSizeCategory](https://developer.apple.com/documentation/uikit/uiaccessibilitycontentsizecategoryimageadjusting/2890929-adjustsimagesizeforaccessibility)
- [🍎Apple Docs: BackButtonDisplayMode](https://developer.apple.com/documentation/uikit/uinavigationitem/backbuttondisplaymode)


</br>

## 👥 팀 회고<a id="팀_회고"></a>
- [팀 회고 링크](https://github.com/WhalesJin/ios-exposition-universelle/wiki/🇰🇷-만국박람회-_-최고래👍🏻🐋)
