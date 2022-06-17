# iOS 커리어 스타터 캠프

## 프로젝트 저장소
> 프로젝트 기간: 2022-06-13 ~ 2022-06-24</br>
> 팀원: [브래드](https://github.com/bradheo65), [그루트](https://github.com/Groot-94)</br>
> 리뷰어: [@ryan-son](https://github.com/ryan-son)</br>
> 그라운드롤: [GroundRole](https://github.com/bradheo65/ios-exposition-universelle/blob/Step02/Docs/GroundRole.md)</br>
## 📑 목차
- [🙋🏻‍♂️ 개발자 소개](#🙋🏻‍♂️-개발자-소개)
- [📈 프로젝트 소개](#📈-프로젝트-소개)
- [🚀 UML](#🚀-UML)
- [📱 구현내용](#📱-구현내용)
- [💡 키워드](#💡-키워드)
- [📝 핵심경험](#📝-핵심경험)
- [🎥 기능설명](#🎥-기능설명)
- [1️⃣ STEP 1](#1️⃣-STEP-1)
    - [Questions](#STEP-1-Questions)
    - [Answers](#STEP-1-Answers)
    - [Debugging](#STEP-1-Debugging)
    - [Concepts](#STEP-1-Concepts)
    - [Reviews](#STEP-1-Reviews)
    - [Updates](#STEP-1-Updates)
- [2️⃣ STEP 2](#2️⃣-STEP-2)
    - [Questions](#STEP-2-Questions)
    - [Answers](#STEP-2-Answers)
    - [Debugging](#STEP-2-Debugging)
    - [Concepts](#STEP-2-Concepts)
    - [Reviews](#STEP-2-Reviews)
    - [Updates](#STEP-2-Updates)

## 🙋🏻‍♂️ 개발자 소개
|브래드|그루트|
|:---:|:---:|
|<image src = "https://user-images.githubusercontent.com/45350356/174251611-46adf61c-93fa-42a0-815b-2c998af1c258.png" width="250" height="250">| <image src = "https://i.imgur.com/tvNHQNl.jpg" width="250" height="250">
|[브래드](https://github.com/bradheo65)|[그루트](https://github.com/Groot-94)|

## 📈 프로젝트 소개
1900년 파리 만국박람회에서 소개된 한국의 문화유산을 앱으로 확인해보자.

## 🚀 UML  
**[ClassDiagram]**

![](https://i.imgur.com/yDPT5nU.jpg)

**[UI sketch]**

<img width="1145" alt="image" src="https://user-images.githubusercontent.com/45350356/174248140-5027b1ce-3c63-4284-a8ea-99876937623c.png">

## 📱 구현내용
|초기화면||
|:---:|:---:|
|![](https://i.imgur.com/Kdzn5Ug.gif)||


## 💡 키워드
- TDD
- Json

## 🏆 Disign Pattern
- MVC

## 📚 참고문서
- [UITableView](https://developer.apple.com/documentation/uikit/uitableview)
- [Table Views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)
- [Filling a Table with Data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)
- [Configuring the Cells for Your Table](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table)
- [JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
    - [Using JSON with Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)
    - [Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
- [LLDB 정복하기](https://yagom.net/courses/start-lldb/)

## 📝 핵심경험
- [x] Codable을 채택하여 JSON 데이터와 매칭할 모델 타입 구현
- [x] 스네이크 케이스 또는 축약형인 JSON 키 값을 스위프트의 네이밍에 맞게 변환

## 🎥 기능설명
### **ExpoInformation**
- exposition_universelle_1900.json 파일 JsonDecode를 위한 데이터 포멧 타입 구현. 
### **KoreaItems**
- items.json 파일 JsonDecode를 위한 데이터 포멧 타입 구현. 

## 1️⃣ STEP 1
### STEP 1 Questions
#### `json Decoding 방식`
- 현재 저희가 작업한 Decoding 방식이 현업에서 사용하는 방식과 유사한지에 대해 의문이 있습니다.
#### `coding key 왜 써야 하는지`
- "변수나 상수명을 스네이크 케이스로 선언해주면 동일하지 않을까"라고 생각했지만, 그렇게 되면 코드 컨벤션이 안맞기 때문에 codingKey를 사용해서 json key값에 대해 대응해주는 것 같습니다. 라이언의 생각은 어떤지 궁금합니다!!
#### `Json 파일을 어디에 저장해야 할지`
- 프로젝트 파일에 저장하는지, Assets에 import 하는지에 대한 의문이 있었습니다.
- 결론: Assets에 images, data 등 프로젝트에서 사용하는 파일을 넣는다는 Asset Management 문서의 내용을 보고 json 파일도 data 라고 생각해서 Assets에 import하는 방법을 채택했습니다. 라이언은 프로젝트에서 사용하는 파일을 어떤 방식으로 관리하시는지 궁금합니다. 
---
### STEP 1 Answers
#### `json Decoding 방식`
- JSON 형식의 데이터를 받는다면 여러분이 정의하신 것과 같은 방식으로 Decodable을 준수하는 모델을 정의하고, JSONDecoder를 이용해 디코딩하는 방식을 사용하고 있어요.
#### `coding key 왜 써야 하는지`
- 전달받은 JSON의 키값과 정의한 모델의 프로퍼티의 이름을 다르게 만들고 싶은 경우가 있을 수 있어요. 그럴 때 CodingKey 프로토콜을 준수하는 CodingKeys 열거형을 정의합니다. 단순히 Snake case 형식의 키값을 Camel case로 변경하는 경우에는 JSONDecoder의 keyDecodingStrategy를 변경하여 대응할 수도 있으니 참고하세요.
#### `Json 파일을 어디에 저장해야 할지`
- 일반적으로 JSON 형식의 파일을 저장하는 경우는 드물긴 하지만 앱에서 활용한다면 Asset에 위치시킬 것 같아요. 하지만 단순히 테스트를 위해 활용하는 JSON 형식의 데이터가 필요하다면 별도로 마련한 테스트 타겟에서 상수로 정의하여 사용할거에요. 현재 Asset 위치에 넣는다면 불필요하게 앱 용량이 커질테니까요.
---
### STEP 1 Debugging
#### `Json decode 테스트 nil 반환`
- ExpoInformation 구조체를 구현하고 JsonDecode를 하는 과정에서 nil이 반환되는 문제가 있었습니다. 그래서 아래의 순서대로 디버깅을 해보았습니다.

    1. Assets에서 Json 파일을 가져오는게 문제인지 LLDB를 활용해 확인했지만, 파일을 가져오고 있었습니다.
    2. 직접 Json 데이터를 작성해서 테스트 하는 방법을 사용해서 확인했으나, 동일하게 nil을 반환했습니다.
    3. ExpoInformation 구조체의 프로퍼티를 확인하는 과정에서 특정 Key에 오타가 있었음을 알 수 있었습니다.
>결론 : 하나의 Key 값에 문제가 있어도 Decode 전체에 문제가 생긴다는 걸 알 수 있었습니다.
---
### STEP 1 Concepts
- Json
- Assets
- Coding Key
---
### STEP 1 Reviews
#### 1. 프로퍼티를 읽어오기 위해 별도의 메서드를 작성할 수 있지만, 프로퍼티에 읽기 전용의 접근 수준을 지정하면 동일한 효과를 낼 수 있을 것 같아요. 
```swift=
func getTitle() -> String {
        return title
    }

    func getVisitors() -> Int {
        return visitors
    }

    func getLocation() -> String {
        return location
    }

    func getDuration() -> String {
        return duration
    }

    func getDescription() -> String {
        return description
    }
```
- func을 선택한 이유: private(set)과 func 중 어떤 방식을 사용할 지 논의를 했었습니다. 기능의 차이가 없기 때문에 func이 좀 더 익숙하고 표현방식이 더 명확하다고 생각해서 func으로 만들었습니다.
- 궁금증: 라이언의 의견을 듣고 생각해보니 func으로 만드는 경우에 메모리가 더 커질수도 있겠다고 생각이 들었습니다. 실제로 이렇게 동일한 기능을 func으로 구현하면 메모리가 더 커지는게 맞는지 궁금합니다.
>궁금증에 대한 답변 : 어떤 방식으로도 접근할 수 있을 것 같네요. 하지만 이 경우는 문법적으로 기능을 지원하고, 지원하는 방법을 사용하면 값을 읽어오기 위해 별도의 메서드를 만드는 보일러 플레이트 코드를 줄일 수 있다는 이점이 있다고 생각합니다. 언어의 특성에 맞게 내용을 작성한다고도 생각해볼 수 있겠네요. 더 살펴봐야겠지만 private(set) 과 메서드 구현이 메모리 사용에 유의미한 차이가 있지는 않을거라고 생각해요.

## 2️⃣ STEP 2
### STEP 2 Questions
---
### STEP 2 Answers
---
### STEP 2 Debugging
#### 이미지 뷰 크기 설정 과정
- 이미지 뷰 크기를 정해서 스택뷰에 넣는 방법으로 했을 때와 이미지 뷰 크기 설정 없이 스택 뷰의 높이만 크기를 설정했을 때 차이점에 대해 진행해 보았다.
#### 이전화면 코드
```swift
let rightKoreanFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flag")
        imageView.contentMode = .scaleAspectFit
}()

private func setSubStackViewConstraints() {
        expo1900SubStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor).isActive = true
        expo1900SubStackView.bottomAnchor.constraint(equalTo: expo1900StackView.bottomAnchor).isActive = true
        expo1900SubStackView.leadingAnchor.constraint(equalTo: expo1900StackView.leadingAnchor).isActive = true
        expo1900SubStackView.trailingAnchor.constraint(equalTo: expo1900StackView.trailingAnchor).isActive = true
        expo1900SubStackView.widthAnchor.constraint(equalTo: expo1900StackView.widthAnchor).isActive = true
        expo1900SubStackView.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
    }
```
#### 수정화면 코드
```swift
    let expo1900SubStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .horizontal
    stackView.alignment = .center
    stackView.distribution = .equalCentering
    return stackView
    }()
    
    let leftFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flag")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let rightFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flag")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let nextViewButton: UIButton = {
        let button = UIButton()
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setContentCompressionResistancePriority(UILayoutPriority(751), for: .horizontal)
        button.addTarget(nil, action: #selector(tappedNextViewButtonEvent), for: .touchUpInside)
        return button
    }()    
```

|이전화면|수정화면|
|:---:|:---:|
|<image src = "https://user-images.githubusercontent.com/45350356/174255420-fcae28f0-87d5-4a03-b60d-6e532b1372fa.png" width="300" height="700">|<image src = "https://i.imgur.com/rYGiTFj.png" width="300" height="700"> |

- 이미지 뷰 넓이 지정(최대 50) → 스택 뷰 높이 지정(최대 50) → 우선 순위 지정 → Prior를 값(750)에서 751로 수정
- 최종적으로는 ImageView와 Button을 포함하는 StackView의 설정을 변경해서 원하는 결과를 얻을 수 있었다
---
### STEP 2 Concepts
- ScrollView
- NavigationViewController
    
---
### STEP 2 Reviews
---
### STEP 2 Updates
