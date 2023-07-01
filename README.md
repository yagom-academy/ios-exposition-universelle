# 🕌 만국박람회

## 💬 소개
> 1900년 개최된 파리 만국박람회에 대한 정보와 한국 출품작의 설명을 TableView와 JSON을 활용하여 보여주는 프로젝트입니다.

</br>

## 🔖 목차 

1. [팀원](#1.)
2. [타임 라인](#2.)
3. [고민한 부분](#3.)
4. [참고 링크](#4.)

---

</br>

<a id="1."></a>

## 1. 🎙️ 팀원

|[Karen ♉️](https://github.com/karenyang835)|
| :-: |
| <Img src="https://i.imgur.com/auFOXpc.png" width="150"/>|


---

</br>

<a id="2."></a>

## 2. ⏰ 타임 라인
> 프로젝트 기간 : 2023.06.26. ~ 2023.07.07.


|**날 짜**|**내 용**|
|:-:|-|
| 2023.06.26.| 📝 프로젝트에서 필요로 하는 핵심기능 공부 - JSON 공부 <br> |
| 2023.06.27.| 🆕 JSON타입의 Decoding을 위한 Items,  InternationalExposition 구조체 구현  <br> 🆕 Snake-case를 Camel-case로 변환하는 CodingKeys 구현<br> 🆕 Handling nil을 위한 Decodable 프로토콜내에 존재하는 init생성자 구현  |
| 2023.06.28.| 🔬 info.plist파일 이동으로 인한 빌드 오류 수정<br> 🛠️ 옵셔널 체이닝으로 통일, 프로퍼티 옵셔널 타입으로 선언 <br> |
| 2023.06.29.| 📝 프로젝트에서 필요로 하는 핵심기능 공부 - TableView 공부 |
| 2023.06.30.| 📝 README 작성 |

---
<br>

<a id="3."></a>

## 3. 🤔 고민한 부분

### 1️⃣ `JSON` 포멧의 데이터와 매칭할 모델 타입 구현
- `JSON`이라는 것도 생소했고, `JSON`을 매칭할 모델 타입을 구현한다는 것 자체가 어디서부터 어디까지 해야될지도 막막했습니다. 미션에서 주어진 것은 `JSON`파일 자체를 `import`하는 단계까지는 아닌 것 같고 `JSON`의 데이터를 `Parsing`할 수 있는 정도로만 구현하면 될 것 같았습니다.

### 2️⃣ 네이밍 컨벤션
> `JSON`은 자바스크립트 객체 표기에서 리터럴과 프로퍼티를 표현하는 방법만 가져와서 사용하는 것으로 자바스크립트 언어로부터 영감을 받아 개발된 데이터형식입니다. 
- 자바크스립트의 경우 변수명 표기법이 카멜 케이스와 스네이크 케이스를 둘 다 사용하기 때문에 카멜 케이스만 활용하는 `swift`에서 "_"를 활용해서 네이밍을 하는 스네이크 케이스에 대처를 해주어야했습니다. `CodingKeys`를 활용하여 해결했습니다.


### 3️⃣ `Decoding`만 구현
> `Encoding` : 일련의 데이터를 `JSON`형식으로 변환하는 과정입니다.
> `Decoding` : `JSON`형식의 데이터를 해당 데이터 형식으로 변환하는 과정입니다.
- 맨 처음에는 `Codable`의 프로토콜을 채택을 했었습니다. `Codable` 프로토콜을 채택하면 `Encoding`에 활용하는 `Encodable`와 `Decoding` 할 수 있는 `Decodable` 모두 활용이 가능해지는데 만국박람회 프로젝트에서 `Encoding`를 할 경우는 없어보여서 `Decoding`시 활용하는 `Decodable`만 활용하여 구현했습니다.

### 4️⃣ `Nil`값의 처리
- `JSON`데이터의 값으로는 `Number`, `String`, `Boolean`, `Object`, `Array`, `NULL과` 같은 타입이 올 수 있다고 명시되어져 있어서, `NULL`은 `Swift`에서의 `nil`값인것으로 알고 있습니다. `nil`값이 들어왔을 때의 처리를 해주어야 된다고 생각되어져서 `Decodable` 프로토콜내에 존재하는 `init` 생성자를 이용하여 안전하게 파싱 작업을 진행했습니다.

```swift
init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        imageName = try container.decode(String.self, forKey: .imageName)
        shortDescription = try container.decodeIfPresent(String.self, forKey: .shortDescription)
        description = try container.decodeIfPresent(String.self, forKey: .description)
    }
}
```

---
<br>



<a id="4."></a> 

## 4. 🔗 참고 링크

🍎 [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/) <br>
🍏 [Apple Developer - UINavigationController](https://developer.apple.com/documentation/uikit/uinavigationcontroller)<br>
🍏 [Apple Developer - UITableView](https://developer.apple.com/documentation/uikit/uitableview)<br>
🍏 [Apple Developer - Table views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)<br>
🍏 [Apple Developer - JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)<br>
🍏 [Apple Developer - Filling a table with data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)<br>
🍏 [Apple Developer - Configuring the cells for your table](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table)<br>
📚 [위키백과 - JSON](https://ko.wikipedia.org/wiki/JSON)<br>


---

</br>
