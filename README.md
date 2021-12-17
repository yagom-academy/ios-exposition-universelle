# 만국박람회 프로젝트

## 프로젝트 소개
만국박람회와 관련된 세 가지 화면을 구성했습니다. 첫 번째 화면에는 박람회 정보, 두 번째 화면에는 출품작 목록, 세 번째 화면에는 품목 상세 설명으로 구성했습니다.

|Dynamic Type 적용 전|Dynamic Type 적용 후|
|---|---|
|![만국박람회1 gilf](https://user-images.githubusercontent.com/90880660/146507536-4ee4a231-fcb6-4c80-823f-3246aafe8cbd.gif)|![만국박람회2](https://user-images.githubusercontent.com/90880660/146507705-87212bc5-b2d2-4aaa-9eba-f7e394c30c38.gif)|



## 1️⃣ STEP1 (1주차)
### 🤔 구현 내용 및 고민한 점
#### 1. JSON 데이터를 `Asset Catalog`에 추가하고, JSON 데이터를 Decoding 하기 위해 매칭할 Model 타입을 구현했습니다.

#### 2. JSON 데이터 및 Swift 객체 간에 Encoding 및 Decoding을 하기 위해 `Codable` 프로토콜을 채택했습니다.

#### 3. `ExpositionItem` 파일에서 `Swift API Guidelines`을 준수하기 위해 `CodingKey` 프로토콜을 채택하여 카멜케이스로 변수명을 작성했습니다. (Ex: image_name -> imageName)

#### 4. Model 폴더의 `Exposition` 및 `ExpositionItem` 타입을 구조체로 지정했습니다. Swift에서 상속 또는 참조 기능을 사용하지 않을 경우, 기본적으로 클래스보다는 구조체를 사용할 것을 권장하고 있고, 연관된 값의 집합을 표현할 때에도 구조체를 사용하는 것이 적절하다고 판단했습니다.

#### 5. `ExpositionItem`타입의 네이밍을 할 때, 처음에는 `한국 출품작`에 초점을 맞췄으나 추후 확장성을 고려하여 이를 포괄할 수 있는 `ExpositionItem`으로 네이밍을 했습니다.

#### 6. decode 메서드에 대해서 Asset Catalog에 파일이 없는 경우 오류를 반환하는지, 파일이 있는 경우 오류를 반환하지 않고 Decoding이 잘 되는지 테스트 케이스를 작성했습니다. 


### 🗝 키워드
- JSON, Codable, Data Parsing, NSDataAsset, CodingKey

<br>

## 2️⃣ STEP2 (1주차)
### 🤔 구현 내용 및 고민한 점

#### 1. 의존성 주입(생성자 주입)을 사용했습니다.

화면 간 데이터 전달 방식 중에서 Notification Center, 클로저, delegate 패턴, KVC/KVO은 뒷화면에서 앞화면으로 전환할 때 적합하다고 알고 있습니다.<br>
따라서 두번째 화면에서 세번째 화면으로의 데이터 전달은 의존성 주입이 적합할 것으로 판단했습니다. 생성자 주입, 프로퍼티 주입, 메서드 주입 방식 중에서 생성자 주입이 가장 적절하다고 판단하여 적용해봤습니다.<br>
그 이유는 아래 단점을 가지고 있지 않기 때문입니다. 

||프로퍼티 주입|메서드 주입|
|---|-------------------------|--------------------------|
|단점|1. 해당 프로퍼티가 외부에 공개되게 된다.<br>2. 해당 프로퍼티의 타입이 옵셔널이거나 불필요한 기본값을 갖게 된다.|해당 프로퍼티의 타입이 옵셔널이거나 불필요한 기본값을 갖게 된다.|

#### 2. 현업에서 사용하는 것처럼 스토리보드를 화면마다 분할하여 관리했습니다.

#### 3. Model 부분에서 `Foundation` 대신 `UIKit`을 import 해도 괜찮을지 고민했습니다.
`JSONParser` 열거형의 decode 메서드에서 `NSDataAsset`을 초기화하기 위해 `UIKit`이 필요했습니다.

일단 MVVM 관점에선 Model 부분에 UIKit을 import하지 않는 것이 가장 바람직하다고 판단했습니다. 
하지만 `JSONParser`의 경우 Model의 기능보단 JSON 파일을 단순히 Parsing하는 역할만 수행하기 때문에 단순히 Util로 볼 수 있다고 판단했습니다. 
따라서 Util로 파일을 분리하고 UIKit을 사용하는 방향으로 해결했습니다. 

#### 4. JSONParser 열거형에서 Generic의 타입 매개변수를 Item으로 네이밍했습니다.

처음에는 exposition 및 ExpositionItem의 구조체 인스턴스를 반환하는 내용이므로 Information, ExpoInfo, Data 등을 고려했는데, Generic의 타입 매개변수로 사용하기에 어색하다고 판단했습니다. 
결론적으로 JSONParser가 Util인 만큼 일반적으로 사용하는 네이밍인 Item으로 결정하는 것이 맞다고 판단했습니다. 

### 💡 문제점 및 해결방법

#### 1. Codable 프로토콜을 채택한 타입의 인스턴스 생성 방법
parsing된 데이터를 담아줄 동일한 타입의 빈 인스턴스가 필요했는데, 구조체가 Codable을 채택하고 있어 빈 인스턴스를 생성할 수 없었습니다. 이에 프로퍼티마다 기본값을 추가하여 초기화를 했습니다.

하지만 `ExpositionViewController`에서 사용했던 `Exposition`과는 다르게, `ExpositionItem` 구조체 프로퍼티의 초기값을 부여했을 때 `ExpositionItemTableViewController`에서 데이터를 제대로 가져오지 못하고 기본값으로 유지되고 있는 문제가 있었습니다.

따라서 인스턴스를 생성할 때 기본값을 갖지 않도록 하고 옵셔널 타입으로 선언했습니다. 

### 📝 피드백 반영
#### 1. 하드 코딩을 개선하기 위해 Namespace와 팩토리 패턴을 적용했습니다.
ExpositionItemViewController 를 초기화하기위해 "ExpositionItem" 과 "expositionItem" 같은 상수를 알아야하는 것이 부담이 된다고 생각했습니다.

이는 직접 String으로 적어주지 않고 Namespace를 따로 만들어 관리할 수 있도록 구현했습니다. 
또한 Factory Pattern을 활용하여 해결했습니다. 

#### 2. IBOutlet 변수는 nil이 될 수 있기 때문에 암시적 추출 옵셔널(`!`)이 아닌 옵셔널(`?`) 타입으로 선언했습니다.
일단 IBOutlet이 nil이 될 수 있는 상황은 해당 outlet이 속해있는 ViewController가 아직 메모리에 로드되지 않았는데 외부에서 outlet에 접근하려고 할 때 발생한다고 생각합니다. 
현재 코드 상에선 IBOutlet에 직접 접근하는 경우가 없어서 nil이 되는 상황이 발생하지 않을 수도 있지만, 비즈니스 로직은 언제든 바뀔 수 있기 때문에 모든 IBOutlet을 optional 타입으로 표시하도록 수정했습니다.

#### 3. 명확하지 않은 네이밍 수정했습니다.
기존에 NumberFormatter를 활용해 .decimal로 formatting한 값을 담는 변수를 `formattedString`으로 네이밍을 했었습니다. 하지만 어떤 값으로 formatting되었는지 명확하게 보여주기 위해 `formattedDecimalString`로 수정했습니다. 

### 🗝 키워드
- TableView (UITableViewController, Content Configuration), 의존성 주입 (생성자 주입), Factory Pattern, 코드로 화면 전환, ViewController 간의 데이터 전달, NSCoder, Scroll View, Navigation Controller, Namespace, Utility
 
<br> 
 
##  STEP3 (2주차)
### 🤔 구현 내용 및 고민한 점
#### 1. 기기의 방향에 따라 화면 방향 전환이 작동하도록 구현했습니다.

요구사항에 따라 첫 화면만 .portrait을 지원하도록 하고, 나머지 화면은 기기의 방향에 맞게 모두 화면 방향 전환이 되도록 구현했습니다. 

화면 방향 전환에 대한 관리는 각각의ViewController 에서 supportedInterfaceOrientations를 재정의하여 설정해주었습니다.

#### 2. Larger Accessibility Sizes 속성에 따라 레이아웃을 변경했습니다.

기기의 폰트 크기가 Larger Accessibility Sizes를 활성화하고, 특정 폰트 크기를 넘어서는 경우 isAccessibilityCategory를 활용하여 코드를 분기하고 레이아웃을 잡아주도록 했습니다. 폰트 크기가 커지는 경우는 스택뷰의 axis를 .vertical로 바꾸어 공간을 확보했고, 일반적인 폰트 크기일 경우에는 .horizontal로 두어 기존 화면을 유지하도록 구현했습니다.

#### 3. Custom Cell을 구현했습니다.

기존에는 기본적으로 제공되는 스타일의 cell을 사용했었는데, 이미지 크기 등 원하는 레이아웃을 잡기에 어려움이 있어서 커스텀 셀로 구현했습니다. 

#### 4. Dynamic Type을 구현했습니다.

기본적으로 화면에 나타나는 이미지를 제외한 UI요소들에 대해 dynamic type을 지원하도록 구현했습니다. 아이폰 기본 앱(ex. 설정)에서도 별도로 이미지의 사이즈를 늘려주지 않는 것을 보고, 이미지에 대해서는 dynamic type을 구현해주지 않았습니다. 

여러 개의 view controller에서 dynamic type 적용이 필요했기에 각 UI요소를 extension하여 dynamic type을 적용해 줄 수 있는 메서드를 구현했습니다. 

#### 5. Voice Over를 구현했습니다.

Voice Over를 구현하면서 Accessibility Inspector Audit의 대응이 불필요하다고 생각되는 일부 경고 메시지를 무시했습니다.

실제로 Voice Over를 Apple Store 등에 사용해봤더니, Cell의 이미지는 읽지 않고, title 및 subtitle 등 정보를 묶어서 button으로 읽고, accessoryView는 읽어주지 않는 것을 확인했습니다. 화면 전환 등의 이벤트에 대한 정보를 알려주는 것이 Voice Over의 주요 목적이라고 판단했고 프로젝트에도 동일하게 적용했습니다.

### 💡 문제점 및 해결방법

#### 1. 시스템 폰트 크기가 커지는 경우 레이아웃을 변경해주었습니다.

우선 isAccessibilityCategory의 값을 기준으로 서로 다른 레이아웃을 주기 위해 분기하였습니다. StackView의 axis를 활용하여 기존에 한 줄에 놓여있던 UILabel들의 텍스트 크기가 커짐에 따라 axis를 vertical로 바꾸어 두 줄로 배치하여 글씨가 잘리지 않도록 했습니다. 시스템 설정이 바뀌는 알림을 받는 것은 NotificationCenter를 통해 구현했습니다.

#### 2. 두 개의 국기 이미지 사이에 버튼이 있을 때, 시스템 폰트 크기가 커지면 이미지가 잘리는 문제를 해결했습니다.

Dynamic Type을 지원함에 따라 UIButton의 크기가 커지게 되어 양 옆 이미지가 사라지는 문제가 있었습니다. 이에 stack view의 distribution과 content hugging/resistance priority를 조정했고, 버튼과 이미지의 너비 비율을 맞춰줌으로써 버튼이 특정 크기 이상으로 커지지 않도록 구현했습니다. 

### 📝 피드백 반영

#### 1. Accessibility 코드를 분리했습니다.

Accessibility의 경우 보조적인 성격이 강하기 때문에, 메인 UI 코드와 나눠주기 위해 메서드를 분리하여 구현했습니다. 

#### 2. 코드의 간결성을 개선했습니다.

반복되는 코드들을 고차함수로 표현하고, 축약할 수 있는 조건문의 경우 삼항 연산자를 사용하여 조금 더 간결하게 표현했습니다.

### 🗝 키워드
- Accessibility (Voice Over, Dynamic Type, Text Style), Custom Cell, Cell Reuse/Configuration, Stack View, Interface Orientation, Notification Center, AutoLayout
