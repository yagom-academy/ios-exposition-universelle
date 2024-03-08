## 만국박람회 🇰🇷

### 0. 목차
- [1. 소개](#1-소개)
- [2. 팀원](#2-팀원)
- [3. UML](#3-uml)
- [4. 타임라인](#4-타임라인)
- [5. 실행 화면](#5-실행-화면)
- [6. 트러블 슈팅](#6-트러블-슈팅)
- [7. 팀 회고](#7-팀-회고)

### 1. 소개
- 1900 만국박람회 어플을 소개합니다. 만국박람회는 지난 세기를 기념하고 다음 세기를 향한 발전을 가속하자는 의미에서 1900년 4월 14일부터 11월 12일까지 프랑스 파리에서 열린 세계 박람회를 기념한 어플입니다. 👍
- 한국의 출품작이 무엇이 있는 지 확인할 수 있으며, 각각의 출품작의 상세 설명도 확인이 가능합니다! 🇰🇷

### 2. 팀원
| [Danny](https://github.com/dannykim1215) | [Gray](https://github.com/yawoong2) |
| --- | --- |
| <img src="https://avatars.githubusercontent.com/u/154333967?v=4" width="200"> | <img src="https://avatars.githubusercontent.com/u/139211436?v=4" width="200"> |

### 3. UML
추후 작


### 4. 타임라인
| 날짜 | 제목 |
| --- | --- |
| 24.03.04(월) ~ 03.06(수) | JSON 파일을 복호화하여 앱에 보여줄 수 있도록 Model 구현 |
| 24.03.07(목) ~ 03.08(금) | 박람회 소개 화면 구현 및 한국의 출품작 Table View 구현 |



### 5. 실행 화면
- 현재(24.3.8)까지 진행된 UI 및 기능입니다. 
<img src="https://cdn.discordapp.com/attachments/1199370366167027834/1215537959449661470/exposition_execute_screen.gif?ex=65fd1cf1&is=65eaa7f1&hm=c3db31a8d18bf699184b617b7e4c8dabb5dbf455689e525fcd8c6fc57cb3fa5d&" width="30%">

### 6. 트러블 슈팅

#### 1. json 파일의 Key값을 일치시키기 위한 CodingKeys 생성
**[변경전]**
- struct 타입에서 json 파일의 콘텐츠를 복호화(decode) 하여 프로젝트에 출력할 수 있도록 하기 위해 아래와 같이 모델을 생성하였습니다. 하지만, 아래와 같이 선언할 경우에는 json파일의 키,값을 찾을 수 없습니다.
```swift=
struct KoreanHeritage: Equatable {
    let name: String
    let imageName: String
    let shortDescription: String
}
```

**[변경후]**
- json으로 암호화(encode) 또는 반대로 복호화(decode)하여 프로젝트에 적용하기 위해서는 Codable 프로토콜을 준수하도록 명시해야합니다. 이는 Encodable, Decodable 프로토콜이 합쳐진 typealias입니다. 그리고 아래의 코드처럼 CodingKey enum 타입으로 케이스를 작성해야 json 타입의 키가 어느 프로퍼티와 일치하는지 매칭해 줄 수 있습니다.
```swift=
struct KoreanHeritage: Equatable, Codable {
    let name: String
    let imageName: String
    let shortDescription: String

    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
    }
}
```

#### 2. 방문객 수의 소수점 자리 표현
**[변경전]**
- String index를 활용하여, 각 숫자의 자리 단위를 표현하여 출력하였습니다. **<U>하지만, 숫자의 단위가 늘어나면 늘어날수록 지속적으로 이러한 형태로 숫자 자리를 표현하기엔 비효율적이라고 생각하게 되었습니다.**</U>
```swift=
let visitorsString = String(expositionIntroduction.visitors)
        
let rangeStartIndex = visitorsString.index(visitorsString.startIndex, offsetBy: 2)
let rangeEndIndex = visitorsString.index(visitorsString.endIndex, offsetBy: -3)

let visitorsFristNumber = visitorsString.prefix(2)
let visitorsSecondNumber = visitorsString[rangeStartIndex..<rangeEndIndex]
let visitorsThridNumber = visitorsString.suffix(3)

visitorLabel.text = "\(visitorsFristNumber),\(visitorsSecondNumber),\(visitorsThridNumber) 명"
```

**[변경후]**
- NumberFormatter를 활용하여 numberStyle을 decimal로 지정하였습니다. decimal 형태로 지정하면 Int 형태를 천의 자리마다 ", "로 표현할 수 있었습니다.
```swift=
let numberFormatter: NumberFormatter = NumberFormatter()
numberFormatter.numberStyle = .decimal

guard let visitorString: String = numberFormatter.string(for: expositionIntroduction.visitors) else {
	return
}
visitorLabel.text = "\(visitorString) 명"
```



### 7. 팀 회고
#### 우리팀이 잘한 점 😍
- Danny
  - 
- Gray 
  - 
#### 우리팀 개선할 점 🥲
- Danny
  - 
- Gray
  - 

