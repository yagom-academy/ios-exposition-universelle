## 만국박람회 프로젝트 저장소

> 프로젝트 기간 2022/06/13 ~ 2022/06/24 
> 팀원: [@yeeton37](https://github.com/yeeton37), [@sookoong](https://github.com/Jeon-Minsu) / 리뷰어: [@쿠마](https://github.com/leejun6694)

## 만국박람회 프로젝트 

## 소개
과거에 개최했던 파리 만국박람회 1900의 한국 출품작에 대해 소개하는 애플리케이션이다. 이 애플리케이션에서는 한국에서 출품했던 작품들에 대해 자세히 알아볼 수 있디.

## 팀원

1. 예톤
- <img src = "https://user-images.githubusercontent.com/99063327/174224341-9ba4e42e-3ff2-4c58-b910-1d0b8d4d87f1.png" width = "10%" height = "10%"> 
- 예톤 [@yeeton37](https://github.com/yeeton37)
- iOS Career Starter 6th Camper

2. 수꿍
- <img src = "https://user-images.githubusercontent.com/99063327/174224494-ee5bbe04-5d70-461a-86d7-cf36f812cc45.png" width = "10%" height = "10%"> 
- 수꿍 [@Jeon-Minsu](https://github.com/Jeon-Minsu)
- iOS Career Starter 6th Camper

### Timeline

### 1주차

- 월 
    - 구조체를 만들어 애플리케이션에서 사용될 `JSON` 데이터의 `Key`를 설정해줌
- 화 
    - 파일을 분리해 `Cell`과 `Cell`의 `xib` 파일을 만들어 `ViewController`에서 `xib` 파일을 등록하는 법을 배움
- 수 
    - `defaultContentconfiguration`을 활용해 기본 테이블 셀을 스토리보드에서 커스텀할 필요 없이 셀을 만듦 
    - `NSDataAsset` 타입을 활용하여 `Asset`에 있는 `JSON` 파일을 디코딩해봄
    - `ViewController`에서 다음 `ViewController`로 화면을 전환할 수 있는 `prepare(for segue)`에 대해 공부함
- 목 
    - `View Life Cycle` 메소드를 활용하여 뷰가 화면에 보일 때 `Navigation Bar`를 숨기고 다른 창으로 넘어갈 때 보이게 하는 방법을 코드로 작성
    - 스크롤 뷰, 스크롤 뷰 내부의 스택 뷰 정렬에 대해 야곰닷넷 오토레이아웃 강의 봄 
- 금 
    - `MVC` 패턴에 맞게 프로젝트 파일들의 폴더 이동 및 중복되는 코드 구조체 내 메서드로 분리 


### **이번 프로젝트를 수행함에 있어 꼭 읽고 참고해야 하는 문서**
- [defaultContentconfiguration](https://developer.apple.com/documentation/uikit/uitableviewcell/3601058-defaultcontentconfiguration)
- [indexPathForSelectedRow](https://developer.apple.com/documentation/uikit/uitableview/1615000-indexpathforselectedrow)
- [filling_a_table_with_data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)
- [Scroll View autolayout](https://corykim0829.github.io/ios/UIScrollView-with-storyboard/#)
- [Codable](https://zeddios.tistory.com/394)
- [TableView 데이터전달(prepare)](https://velog.io/@wook4506/iOS-Swift-TableView-데이터-전달prepare)
- [Navigation Bar Title 변경](https://exception-log.tistory.com/158)
- [Generic](https://seons-dev.tistory.com/entry/Swift-기초문법-제네릭-Generic)

### 프로젝트 수행 중 핵심 경험

### 시간

[프로젝트에 집중하는 시간]
10: 00 - 22: 00

[식사 시간]
점심 12 : 30 ~ 14 : 00
저녁 18 : 00 ~ 19 : 30

[연락이 어려운 시간]
없음

[휴일]
예톤 : 주말
수꿍 : 주말

### 규칙

[커밋]

최소기능 단위 commit
카르마 스타일 따르기 ( 한글로 작성 )
feat = 주로 사용자에게 새로운 기능이 추가되는 경우
fix = 사용자가 사용하는 부분에서 bug가 수정되는 경우
docs = 문서에 변경 사항이 있는 경우
style = 세미콜론을 까먹어서 추가하는 것 같이 형식적인 부분을 다루는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
refactor = production code를 수정하는 경우 (변수의 네이밍을 수정하는 경우)
test = 테스트 코드를 수정하거나, 추가하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)

[컨벤션]

Swift API Design Guidelines
Swift Language Guide
ios - Human Interface Guidelines

[커뮤니케이션]

디스코드 회의실
디스코드 다이렉트 메시지

# Step

## Step 1

- feat: Exhibits 파일 생성 및 struct(Exhibits) 선언
- feat: ExpositionUniverselle 파일 생성 및 struct(ExpositionUniverselle) 선언
- refactor: ExpositionUniverselle 파일 삭제
- feat: ExpositionUniverselle 파일 생성 및 struct(ExpositionUniverselle) 선언
- style: 필요없는 주석 제거
- docs: README.md 업데이트


## Step 2

- feat: assets에 expo_assets 파일 추가
- feat: Main storyboard를 통한 만국박람회 초기 화면 구현
- feat: IBOutlet 프로퍼티 생성 및 스토리보드와 dataAsset을 연결
- feat: ExpoError 파일 생성
- refactor: ViewController 코드를 메서드 단위로 분리 및 은닉화
- feat: 버튼 클릭하면 두 번째 화면으로 넘어가는 segue 구현
- refactor: ViewController 내 navigationButton 클릭 시 화면 전환 코드 수정
- feat: ViewWillAppear 및 ViewWillDisAppear 호출시 네비게이션바 노출 여부 결정    
- feat: KoreaEntryViewController 생성 및 필수 메서드 구현
- refactor: ViewController 네이밍 변경 및 네비게이션 백 버튼 아이템 생성
- feat: KoreaEntryViewController 생성 및 필수 메서드 구현
- feat: KoreaEntryDetailsViewController 생성 및 IBOutlet 변수 내 값 할당
- style: Assets 파일을 Resource 폴더로 이동시킴
- refactor: KoreaEntryViewController 파일을 Controller 폴더로 이동 및 리팩토링
- refactor: EXPOInformationViewController파일 Controller 폴더로 이동 및 리팩토링
- refactor: KoreaEntryDetailsViewController파일 Controller 폴더로 이동 및 리팩토링
- refactor: EXPOError파일 Model 폴더로 이동 및 리팩토링
- feat: struct(JSONData) 선언 …
- feat: NavigationBarFormatter,CustomLabel 구조체 선언 …


## Step 1

## 고민했던 점

### 주제

### 1. Codable vs Decodable

- `JSON` 파일을 제공받음에 있어, `swift` 파일 내에 사용하기 위하여 `decoding` 작업을 수행할 필요가 있었다. 
- 이에 `JSON` 포멧의 데이터와 매칭할 모델 타입을 구현하는데 있어, 구조체인 `Exhibits`과 `ExpositionUniverselle`은 `decoding` 작업과 관련한 프로토콜을 채택하여야만 했다.
- `JSON` 포멧의 데이터와 매칭할 모델 타입을 구현한 사례들을 보면 거의 대부분 `Codable` 프로토콜을 채택하였다.
- 그런데 `Codable`은 아래와 같이 `Decodable`와 `Encodable`을 모두 채택하고 있다는 사실을 발견하였다.
> typealias Codable = Decodable & Encodable
- 이를 보며, 이번 프로젝트에서 `Encoding` 기능을 필요로하지 않고, `Decoding` 기능만 구현하면 될 것이라고 판단하였고, `swift` 공식 문서 또한 `exclusively`하게 프로토콜을 채택하기를 권장하였기에, `Decodable` 프로토콜을 채택하기로 결정하였다.



### 2. enum CodingKeys
- `JSON`의 키 이름을 구조체 프로퍼티의 이름과 다르게 표현하기 위해 타입 내부에 `String` 타입의 원시값을 갖는 `CodingKeys`라는 이름의 열거형을 선언해주었다.
- 이때 `enum(CodingKeys)`의 이름을 변경해주었더니 오류가 발생했다. 
- 그래서 [공식문서](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)를 찾아보니 아래와 같이 나와있었다.
> Codable types can declare a special nested enumeration named CodingKeys that conforms to the CodingKey protocol. 
- `Codable` 타입은 `CodingKey` 프로토콜을 준수하는 `CodingKeys`라는 특수 중첩 열거형을 선언할 수 있다고 되어있었다.
- 따라서 임의로 `enum`의 이름을 바꾸면 안되고 `JSON`의 키 이름을 변경해줄 때는 무조건 `CodingKeys`라는 이름의 열거형을 선언해줘야함을 알게되었다.



### 3. Metatype

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

---

## 의문점

### 주제

### 1. Contents.json

- 미리 제공받은 `Asset` 파일을 열어보니, 모든 폴더에 `Contents.json` 파일이 있었다. 
- 이에 대하여 정확히는 아니지만 검색해본 결과, 파일이 생성될 때, 자동적으로 생성되는 파일임을 알았다.
- 그래서 `Contents.json` 파일은 그냥 일반 파일을 생성할 때, 폴더 내 파일들에 대한 개략적인 설명을 담아내는 의미없는 파일로 인식하여, 굳이 디코딩 작업을 진행하지 않아도 된다고 판단하였다.
- 이러한 판단이 옳은 판단이었는지 질문하고 싶다.

### 의문점 해결

### 1. Contents.json

- Content.json 은 필요한 내용이 아니라면, decode 안해주어도 됨을 알게 되었다.
- Contents.json은 Asset 카탈로그에 파일을 넣어줄 때 필요한 정보를 가지고 있으며, 이 파일을 Asset에 넣어주게 되면 자동으로 정보를 인식한다.

### 배운개념
- `Codable`, `Encodable`, `Decodable`, `CodingKey`
- `JSON`, `JSONEncoder`, `JSONDecoder`
- `Meta Type`

## Step 2

## 실행 화면(기능 설명)

|파리만국박람회 소개 화면|한국 출품작 소개 화면|출품작 상세 소개 화면|
|:--:|:--:|:--:|
|![EXPOInformationViewController](https://user-images.githubusercontent.com/99063327/174227640-f8d1a00b-957a-449e-b48b-f0b9e4d0aa2c.gif)|![KoreaEntryViewController](https://user-images.githubusercontent.com/99063327/174229792-2c3bb96c-1609-4bf2-b065-7957198ffe64.gif)|![KoreaEntryDetailsViewController](https://user-images.githubusercontent.com/99063327/174230832-9e656db0-add6-44b7-bf48-84cf62fa37dd.gif)|

### 1. 파리만국박람회 소개 화면(EXPOInformationViewController)

- `ScrollView` 내에 파리 만국박람회의 `title`, `image`, `visitors`, `location`, `duration`, `description`에 관한 `label` 및 `imageView`를 생성하여 스크롤을 통해 원하는 내용을 볼 수 있게 하였다.
- `view`의 최하단에 '한국의 출품작 보러가기'라는 이름을 가진 버튼을 생성하여, `KoreaEntryViewController`로 화면 전환(`push`) 기능을 수행하였다.
<br/>

### 2. 한국 출품작 소개 화면(KoreaEntryViewController)

- `TableView`를 생성하여 각각의 셀에 한국의 출품작의 `image`, `name`, `short_desc`을 표시하였다.
- 셀을 클릭하면 해당 출품작에 관한 `image`와 `description`을 표시하는 세번째 화면으로 화면전환(`segue`) 기능을 수행하였다.
<br/>

### 3. 출품작 상세 소개 화면(KoreaEntryDetailsViewController)

- `ScrollView`내 `image`와 `description`에 관한 `label` 및 `ImageView`를 생성하여 스크롤을 통해 원하는 내용을 볼 수 있게 하였다.
- `NavigationBar`의 `BackButton`을 통하여 이전 화면인 `KoreaEntryViewController`로 돌아가는 기능도 추가하였다.

## 고민했던 점

### 주제
### 1. xib 파일 ViewController와 연결
- 파일을 분리해 Cell과 Cell의 xib 파일을 만들어 ViewController에서 사용해주려했는데 cell이 나타나지 않는 현상이 발생함
- 그 이유를 찾아보니, xib 파일은 따로 뷰에 register를 해줘야 사용할 수 있음을 알게되었다.
- 아래와 같이 xib 파일을 등록해주니 cell이 정상적으로 뷰에 나타나는 것을 확인할 수 있었다.
```swift
let nibName = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "CustomCell")
```

### 2. Navigation Bar 숨기기
- 뷰가 화면에 보일 때 Navigation Bar를 숨기고 다른 창으로 넘어갈 때 보이게 하는 방법에 대해 고민했다.
- 이는 아래와 같이 View Life Cycle 메소드를 활용하여 해결할 수 있었다.
```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.isNavigationBarHidden = true
}
    
override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.isNavigationBarHidden = false
}
```

### 3. 스크롤 뷰의 오토레이아웃
- 스크롤뷰에 추가한 `contentView`의 오토레이아웃을 스크롤뷰의 `width`와 `Equal Width`로 설정해주니 오류가 발생했다.
- 찾아보니, `contentView` 또한 실질적인 사이즈가 필요하기 때문에 `content`의 `width`와 `height`가 필요하다는 점을 알게되었다.
- 또한 추가된 `contentView`를 스크롤 뷰의 `Content Layout Guide`에 오토 레이아웃을 사용해 꽉 채워주고, `contentView`를 `control`을 누른상태로 `Content Layout Guide`에 드래그하여 오토 레이아웃을 줄 수 있다. 이 방법으로 `leading`, `top`, `trailing`, `bottom anchor` 모두 `constraint`를 적용해주어야 함을 알게되었다.

[[스크롤 뷰 오토레이아웃 주는 순서]](https://corykim0829.github.io/ios/UIScrollView-with-storyboard/#)
1. 스크롤 뷰 오토레이아웃 잡아주기
2. `ContentView` 추가하기
3. `Content View` 사이즈 잡아주기
4. `Frame Layout` 잡아주기
5. `Width`/`Height` 잡아주기


---


## 의문점

### 주제
### 1. 네비게이션 타이틀이 안바뀌는 현상 

- 네비게이션 바에 `title`과 `backButtonTitle`을 설정해주는 방법으로 다음의 두 방법을 발견하였습니다.

```swift
// 첫번째 방법
navigationItem.title = "한국의 출품작"
navigationItem.backButtonTitle = "메인"

// 두번째 방법
navigationController?.navigationBar.topItem?.title = "한국의 출품작"
navigationController?.navigationBar.topItem?.backButtonTitle = "메인"
```


- [두번째 VC인 `KoreaEntryViewController` 내 첫번째 방법 사용]
<img width="338" alt="secondVC 내 navigationController" src="https://user-images.githubusercontent.com/99063327/174234793-02f81c9a-ee30-4732-98cc-aa82ebde61d8.png">
- `KoreaEntryViewController` 내의 `viewDidLoad` 함수에서 첫번째 방법을 사용해보니 위와 같이 백버튼은 원하는 네이밍이 잘 표시되었으나, 네비게이션 타이틀은 표시되지 않았다.

- [두번째 VC인 `KoreaEntryViewController` 내 두번째 방법 사용]
<img width="336" alt="secondVC 내 navigationItem" src="https://user-images.githubusercontent.com/99063327/174234797-c0d15197-10d9-4f7b-8edb-610ff542c11f.png">
- `KoreaEntryViewController` 내의 `viewDidLoad` 함수에서 두번째 방법을 사용해보니 이버에는 위와 같이 네비게이션 타이틀은 원하는 네이밍이 잘 표시되었으나, 백 버튼의 네이밍이 원하는 대로 표시되지 않았습니다.

- [첫번째 VC인 `EXPOInformationViewController`에 첫번째 방법의 backButton 생성 및 `KoreaEntryViewController` 내 첫번째 방법의 title 생성]
<img width="337" alt="firstVC 내 backbutton 및 secondVC 내 navigationItem" src="https://user-images.githubusercontent.com/99063327/174234783-0552fbe2-64b8-4753-bd70-cee9a221e420.png">
- 이번에는 첫번째 방법을 사용하되, `backButtonTitle`은 첫번째 `VC`인 `EXPOInformationViewController`에서 생성하고, `navigation title`은 두번째 VC인 `KoreaEntryViewController`에서 생성하였습니다. 그러면 위와같이 네이밍이 원하는 바와 같이 나올 수 있었습니다.
- 문제점을 해결할 수는 있었으나, 왜 그렇게 구현되는지 원리를 제대로 이해하지는 못했습니다. 저희가 이해한 바로는 첫번째 방법과 두번째 방법은 충분히 서로를 대체할 수 있는 함수로 인식하였는데, 같은 위치에 메서드를 호출하여도 다른 결과를 보였습니다. 이에 그 원리를 질문드리고 싶습니다.
- 또한, `backButtonTitle`은 두번째 `VC`가 아닌, 첫번째 `VC`에서 설정해줘야 원하는 네이밍을 생성할 수 있었는데, 이렇게 작용하는 근거가 무엇인지 궁금합니다. 


### 2. 이미지 사이즈 dynamic하게 변경하는 법
![](https://i.imgur.com/fq7mou3.png)
- 아래 코드에서 `defaultContentConfiguration` 메서드를 사용해 위의 `cell`을 만들어주었고, `cell` 안의 `content`의 `imageProperties`의 사이즈를 50으로 정해주었습니다.
- 그런데 사이즈를 50으로 `static`하게 지정해주는 것이 아니라 기기마다 알맞게 적용되도록 `dynamic`하게 설정하고 싶었습니다.
- 그런데 메서드나 속성을 찾아봐도 `dynamic`하게 이미지 사이즈를 설정해주는 것에 대해 나와있지 않아서 그냥 이대로 설정해주었습니다.
- `defaultContentConfiguration` 메서드를 사용해 만들어준 셀 내부의 이미지를 옆의 `text`와 `secondaryText`와의 관계를 통해 오토레이아웃을 지정해주는 방법이 따로 있는지 질문드리고 싶습니다.
- 코드
```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
    var content = cell.defaultContentConfiguration()
        
    content.image = UIImage(named: koreaEntry[indexPath.row].imageName)
    content.imageProperties.maximumSize.width = 50 [ 여기 !]
    content.imageProperties.maximumSize.height = 50 [ 여기 !]
        
    cell.contentConfiguration = content
      
    return cell
    }
```

### 3. JSONData 구조체의 parse 메서드

- 이번 만국박람회 프로젝트에서 `JSONData`를 `parse`하는 작업은 총 두 번 이루어졌습니다.
- 처음은 첫번째 화면에서 만국박람회 포스터 내의 이름, 이미지, 개최지, 기한, 설명 등에 대한 데이터를 가져오기 위해 이루어졌고, 다음으로 두번째 화면에서 각각의 한국 출품작에 대한 이미지, 타이틀, `short_desc`을 가져오기 위하여 파싱이 이루어졌습니다.
- 이 둘의 코드를 비교해본 결과, `NSDataAsset`의 `name`과 `decoding`할 타입을 제외하고는 코드를 동일하게 사용하고 있다고 판단하여, 다음과 같이 코드를 작성하였습니다.
- 코드
```swift
struct Parser {
    static func parse<T>(name: String, parsedItems: [T]) -> [T]? where T: Decodable {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        let parsedItemsType = type(of: parsedItems)

        guard let dataAsset: NSDataAsset = NSDataAsset(name: name) else {
            return nil
        }

        do {
            let data = try jsonDecoder.decode(parsedItemsType.self, from: dataAsset.data)
            return data
        } catch {
            self.handleError(error)
            return nil
        }
    }
}
```
- 그러나, 이 `parse` 메서드는 두번째 `VC`에서 파싱을 진행하였을 때는 정상적으로 작동하였으나, 첫번째 `VC`에서는 정상적으로 작동하지 않았습니다.
- 그 근거를 추측해본 결과, `JSON Data` 파일을 뜯어보니 두번째 `VC`에서 사용하는 `Items` 데이터는 배열안에 객체들이 들어있는 형태로, 위의 메서드를 적용할 수 있었으나, 첫번째 `VC`에서 사용하는 `exposition_universelle_1900` 데이터는 배열이 있지 않고, 하나의 객체만이 들어있었습니다.
- 첫번째 `VC`에서도 위의 `parse` 메서드를 쓰기 위하여 아래와 같이 JSON Data를 담을 모델의 타입을 변경하였으나, 근본적인 `JSON` 데이터 타입의 문제 때문인지 해당 배열 내에 값이 온전히 할당되지 않았습니다.
```swift=
// 기존
var expositionUniverselle: ExpositionUniverselle? = nil

// 변경
var expositionUniverselle: [ExpositionUniverselle] = []
```
- 그래서 일단, 이를 해결하기 위하여 오버로딩 방식을 통하여, 타입이 `T`인 경우와 `[T]`인 경우로 파라미터 및 반환값을 변경하여 적용하였는데, 위의 하나의 메서드만을 이용하여 할 수 있는 방법은 정녕 없는지 질문드리고 싶습니다.
- 추가로, 해당 `parse` 메서드 내에서 실제 파라미터는 필요없지만 제너릭의 타입을 설정하기 위하여 `parsedItems`에서 파라미터를 받고, 그 파라미터에 `type(of:)` 메서드를 사용하여 메타타입의 값을 사용했습니다.
- 이렇게 내부 메서드를 구현하는 게 과연 옳은 것인지 또한 묻고 싶습니다.


### 4. 프로젝트에서 MVC 디자인 패턴 적용
- 현재 뷰에 보이고있는 라벨과 텍스트들을 따로 `UIView`를 상속한 `View` 타입으로 이동시켜준 뒤 `Controller`에서 `View`를 가져오는 방법을 사용하고자 했으나 충분히 알아보고 적용하고자 이번 step2에서는 아직 적용하지 못했습니다.
- 따라서 다음 step3부터는 `View`와 `Controller`를 분리해서 적용하려고 하는데, 보통 이렇게 `View`와 `Controller`를 나누는 방법을 선호하는지 궁금합니다.

### 5. 파리만국박람회 Title 개행 관련

- 첫번째 화면의 타이틀의 `JSON Data`를 찾아보니 "파리 만국박람회 1900(L'Exposition de Paris 1900)"와 같이 `Title`이 적혀있었습니다. 
- 그런데 기능 구현 영상에서 이를 찾아보니 `파리 만국박람회 1900` 부터 줄이 바뀌고, 그 다음줄부터 `(L'Exposition de Paris 1900)`가 적혀있었습니다. 이를 단순히 `lineBreakMode`를 어절 단위로 한다면 1900에서 끊기지 않고, `파리 만국 박람회`에서 먼저 끊기고, `1900(L'Exposition de Paris 1900)`이 그 다음 줄에 표시되게 됩니다. 
- 이는 구현 영상과는 포맷이 동일하지 않다고 판단하여, 1900의 뒤에 의도적으로 개행이 필요하다고 생각하였습니다.
- 이에 `replacingOccurrences` 메서드를 이용하여 1900 뒤의 열린 괄호 전에 아래와 같이 개행을 넣어주고, `numberOfLines`를 0으로 설정하니, 구현상황과 동일하게 개행이 이루어질 수 있었습니다.

```swift
private func updateTitleLabel() {
        guard let title = expositionUniverselle?.title else {
            return
        }
        
        let changeTitle = title.replacingOccurrences(of: "(", with: "\n(")
        
        titleLabel.text = changeTitle
        CustomLabel.setNumberOfLinesToZero(into: descriptionLabel)
        CustomLabel.setLabelFont(into: titleLabel, style: .title2)
}
```

- 구현상황과 동일하게 구현은 하였지만, 위와 같은 문제가 발생하였을 때, 더욱 좋은 방법으로 개행이 이루어질 수 있게 하는 방법이 있을지 궁금합니다.


### 의문점 해결

## 배운 개념
- `NSDataAsset`, `indexPathForSelectedRow`, `xib reister`, `prepare(for: segue)`, `defaultContentconfiguration`, `isHidden`, `lineBreakMode`, `numberOfLines`, `isNavigationBarHidden`, `errorDescription`, `generic`

## 참고 문서

- [defaultContentconfiguration](https://developer.apple.com/documentation/uikit/uitableviewcell/3601058-defaultcontentconfiguration)
- [indexPathForSelectedRow](https://developer.apple.com/documentation/uikit/uitableview/1615000-indexpathforselectedrow)
- [filling_a_table_with_data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)
- [Scroll View autolayout](https://corykim0829.github.io/ios/UIScrollView-with-storyboard/#)
- [Codable](https://zeddios.tistory.com/394)
- [TableView 데이터전달(prepare)](https://velog.io/@wook4506/iOS-Swift-TableView-데이터-전달prepare)
- [Navigation Bar Title 변경](https://exception-log.tistory.com/158)
- [Generic](https://seons-dev.tistory.com/entry/Swift-기초문법-제네릭-Generic)
