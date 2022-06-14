## 야곰 아카데미

### 만국박람회 프로젝트 저장소

> 프로젝트 기간 2022/06/13 ~ 2022/06/24 
> 팀원: [@yeeton37](https://github.com/yeeton37), [@sookoong](https://github.com/Jeon-Minsu) / 리뷰어: [@쿠마](https://github.com/leejun6694)

# 목차
- [프로젝트 소개](#프로젝트-소개)
- [키워드](#키워드)

- [그라운드 룰](#그라운드-룰)
    - [활동시간](###시간)
    - [예외사항](##예외사항)
    - [의사소통 방법](##의사소통-방법)
    - [코딩 컨벤션](##코딩-컨벤션)

- [STEP 1](#STEP-1)
    - [고민한점](#고민한점)
    - [배운개념](#배운개념)
- [STEP 2](#STEP-2)
    - [고민한점](#고민한점)
    - [배운개념](##배운개념)
- [STEP 3](#STEP-3)
    - [고민한점](#고민한점)
    - [배운개념](##배운개념)

# 프로젝트 소개
- 만국박람회 어플리케이션


# 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3.1-blue)]()

# 키워드
- 


# 그라운드 룰

### 시간

[프로젝트에 집중하는 시간]

- 10 : 00 ~ 22 : 00

[식사 시간]

- 점심 12 : 30 ~ 14 : 00
- 저녁 18 : 00 ~ 19 : 30

[연락이 어려운 시간]

- 없음

[휴일]

- 예톤 : 주말
- 수꿍 : 주말


### 규칙

[커밋]

- 최소기능 단위 commit
- 카르마 스타일 따르기 ( 한글로 작성 )
- `feat` = 주로 사용자에게 새로운 기능이 추가되는 경우
- `fix` = 사용자가 사용하는 부분에서 bug가 수정되는 경우
- `docs` = 문서에 변경 사항이 있는 경우
- `style` = 세미콜론을 까먹어서 추가하는 것 같이 형식적인 부분을 다루는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
- `refactor` = production code를 수정하는 경우 (변수의 네이밍을 수정하는 경우)
- `test` = 테스트 코드를 수정하거나, 추가하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)

[컨벤션]

- Swift API Design Guidelines
- Swift Language Guide
- ios - Human Interface Guidelines

[커뮤니케이션]

- 디스코드 회의실
- 디스코드 다이렉트 메시지

# 핵심경험

# [STEP 1]

## 고민한점 

### 1. Codable vs Decodable

- `JSON` 파일을 제공받음에 있어, `swift` 파일 내에 사용하기 위하여 `decoding` 작업을 수행할 필요가 있었다. 
- 이에 `JSON` 포멧의 데이터와 매칭할 모델 타입을 구현하는데 있어, 구조체인 `Exhibits`과 `ExpositionUniverselle`은 `decoding` 작업과 관련한 프로토콜을 채택하여야만 했다.
- `JSON` 포멧의 데이터와 매칭할 모델 타입을 구현한 사례들을 보면 거의 대부분 `Codable` 프로토콜을 채택하였다.
- 그런데 `Codable`은 아래와 같이 `Decodable`와 `Encodable`을 모두 채택하고 있다는 사실을 발견하였다.
> typealias Codable = Decodable & Encodable
- 이를 보며, 이번 프로젝트에서 `Encoding` 기능을 필요로하지 않고, `Decoding` 기능만 구현하면 될 것이라고 판단하였고, `swift` 공식 문서 또한 `exclusively`하게 프로토콜을 채택하기를 권장하였기에, `Decodable` 프로토콜을 채택하기로 결정하였다.



### 3. enum CodingKeys
- `JSON`의 키 이름을 구조체 프로퍼티의 이름과 다르게 표현하기 위해 타입 내부에 `String` 타입의 원시값을 갖는 `CodingKeys`라는 이름의 열거형을 선언해주었다.
- 이때 `enum(CodingKeys)`의 이름을 변경해주었더니 오류가 발생했다. 
- 그래서 [공식문서](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)를 찾아보니 아래와 같이 나와있었다.
> Codable types can declare a special nested enumeration named CodingKeys that conforms to the CodingKey protocol. 
- `Codable` 타입은 `CodingKey` 프로토콜을 준수하는 `CodingKeys`라는 특수 중첩 열거형을 선언할 수 있다고 되어있었다.
- 따라서 임의로 `enum`의 이름을 바꾸면 안되고 `JSON`의 키 이름을 변경해줄 때는 무조건 `CodingKeys`라는 이름의 열거형을 선언해줘야함을 알게되었다.



### 1. Metatype

- 아래의 코드는 JSON 데이터를 Codable 프로토콜을 준수하는 GroceryProduct 구조체의 인스턴스로 디코딩하는 코드이다. 
```swift
struct GroceryProduct: Codable {
    var name: String
    var points: Int
    var description: String?
}

let json = """
{
    "name": "Durian",
    "points": 600,
    "description": "A fruit with a distinctive scent."
}
""".data(using: .utf8)!

let decoder = JSONDecoder()

do {
    let product = try decoder.decode(GroceryProduct.self, from: json)
    print(product.name)
} catch {
    print(error)
}
// ----- 출력 
"Durian"
```

- 코드를 읽던 중 `decode`하는 코드 `let product = try decoder.decode(GroceryProduct.self, from: json)` 에서 `GroceryProduct`이 아닌 `GroceryProduct.self`를 써준 점이 이해가 가지 않았다.
- 그래서 [공식문서](https://developer.apple.com/documentation/foundation/jsondecoder/2895189-decode)를 찾아보니 `decode` 메서드가 아래와 같이 구현되어 있음을 확인했다.
```swift
func decode<T>(
    _ type: T.Type,
    from data: Data
) throws -> T where T : Decodable
```
- 위와 같이 decode 메서드의 첫 번째 매개변수 `type`의 타입이 `T.Type`이어서 `decode(GroceryProduct.Type)`으로 사용해줘야한다고 생각했는데 그건 틀린 생각이었다. 예를 들어서 `T.Type`이 `Int`라는 자료형이라고 하면, `let product = try decoder.decode(aaa, from: json)` 의 `aaa`자리에는 `Int`라는 타입이 들어가야하는 것이 아니라 10이라는 정수가 들어가야 한다. 따라서 10과 같이 값을 나타내주는 개념의 `GroceryProduct.self`를 사용해주었다.
- 매우 헷갈리기 때문에 아래에 헷갈릴만한 경우를 적어주었다! 
- 다음의 [블로그](https://dev200ok.blogspot.com/2020/09/swift-self-vs-self_49.html)에서 예시를 가져왔다.

```swift
let word = "testString"
print(word is String)       // true
print(word is String.Type)  // false
print(type(of: word) is String.Type)  // true

print(type(of: word) == String.self)  // true
print(type(of: word) is String.Type) // true
print(type(of: word) is String.self)  // error
print(type(of: word) == String.Type)  // error
```
- 위의 예시는 메타타입에 대하여 적절한 예시로 인용해보았다.
- `Metatype`이란 타입의 타입을 나타낸다.
- `word`는 `String` 타입의 값을 가지는 상수로, 타입은 String에 해당한다.
- `word`는 `String` 타입의 타입, 즉 메타타입에 해당하지는 않는다.
- 그러나, `type(of: word)`는 메서드가 메타타입의 값으로 반환하기 때문에 `String.Type`에 해당한다.
```swift
func type<T, Metatype>(of value: T) -> Metatype
```
- 주목할 점은, `type(of: word)`는 `String.Type`의 자료형인 하나의 값이라는 점이다.
- 이때문에, 값을 비교하는 `==` 연산자에 있어서는 `String.self`와 비교하는 것은 옳지만, 캐스팅과 관련하여 타입을 확인할 때에는 `String.Type`으로 비교하는 것이 옳다.
- 즉, 5라는 `Int` 값에 대하여 `5 == 5`로 비교하고, `5 is Int`로 비교하는 것과 같은 맥락이다.
<br/>

## 의문점

### 1. Contents.json

- 미리 제공받은 `Asset` 파일을 열어보니, 모든 폴더에 `Contents.json` 파일이 있었다. 
- 이에 대하여 정확히는 아니지만 검색해본 결과, 파일이 생성될 때, 자동적으로 생성되는 파일임을 알았다.
- 그래서 `Contents.json` 파일은 그냥 일반 파일을 생성할 때, 폴더 내 파일들에 대한 개략적인 설명을 담아내는 의미없는 파일로 인식하여, 굳이 디코딩 작업을 진행하지 않아도 된다고 판단하였다.
- 이러한 판단이 옳은 판단이었는지 질문하고 싶다.

## 의문점 해결

<br>

## 배운개념
- `Codable`, `Encodable`, `Decodable`, `CodingKey`
- `JSON`, `JSONEncoder`, `JSONDecoder`
- `Meta Type`

<br>

