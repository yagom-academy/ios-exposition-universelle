# 만국박람회

**프로젝트 진행기간**: 23.06.20(월) ~ 23.07.07(금)

## 📂 목차
1. [팀원](#1.)
2. [타임 라인](#2.)
3. [실행 화면](#3.)
4. [트러블 슈팅](#4.)
5. [팀 회고](#5.)
6. [참고 문서](#6.)

## 1. 팀원
<a id="1."></a>

| JusBug | Minsup |
| :---: | :---: |
| <Img src="https://github.com/JusBug/ios-juice-maker/assets/109963294/53a73571-41d9-4914-a917-d8ea099be948" width="150"/> | <img src="https://avatars.githubusercontent.com/u/79740398?v=4" width="150"/>
| **[Github](https://github.com/JusBug)** | **[Github](https://github.com/agilestarskim)** |

- - -
<a id="2."></a>

## 2. 타임라인

### 2023.06.26.(월)
- JSON 데이터 타입 구현

### **2023.06.27.(화)**
- JSON을 제네릭 타입으로 변환해주는 DecodingHelper 구현
- main storyboard 컴포넌트 배치
- decimal 표현을 위한 Numberformatter의 format() 메서드 구현
- storyboard에서 UI 연동
- KoreanEntryViewListVC 생성
- EntryDetailVC 생성

### **2023.06.28.(수)**
- CustomCell 생성하여 tableView에 등록
- 화면전환 구현
- 네비게이션 바 숨김 및 백 버튼 내용 수정

### 2023.07.03.(월)
- EntryDetailVC entry property값을 init을 통해 외부에서 주입
- EntryDetailVC에 entry 프로퍼티 은닉화
- ExpositionIntro에서 디코딩 실패시 에러메세지 띄우는 showErrorAlert() 구현

### **2023.07.04.(화)**
- 모든 화면에 Dynamic Type과 AutoLayout 적용
- ExpositionIntroVC만 세로모드로 고정

### **2023.07.05.(수)**
- 모든 뷰의 요소에 Accessibility 
- KoreaEntryListVC에서 셀을 선택한 뒤 돌아와도 계속 선택되어있는 이슈 해결

### **2023.07.06.(목)**
- Step3 PR 리뷰를 토대로 수정
---
<a id="3."></a>

## 3. 실행 화면

|인트로 화면 다이나믹 타입|테이블 뷰 다이나믹 타입|
|---|---|
|![](https://hackmd.io/_uploads/BkyOKxrFh.gif)|![](https://hackmd.io/_uploads/Syyx9gSKn.gif)|

|화면 전환| 방향 전환|
|---|---|
|![](https://github.com/JusBug/ios-exposition-universelle/assets/125210310/2175647e-dd38-4f52-b93c-3256ef2dccdf)|![](https://github.com/JusBug/ios-exposition-universelle/assets/125210310/1158e1f6-af1e-4f01-a465-69292120bc0f))|


</br>
<a id="4."></a>

## 4. 트러블 슈팅

### <네비게이션 바로 인해 이미지가 밀리는 상황>

🤯 **문제상황** 
첫 번째 메인 포스터 뷰에서 네비게이션 바가 존재하여 예시와 달리 컨텐츠가 아래로 밀려나는 문제가 있었습니다

🔥 **해결방법**
viewWillAppear(), viewWillDisappear() 메서드를 이용하여 네비게이션 바를 특정 뷰에서만 네비게이션 바가 보이게 하고 나머지에서는 숨기도록 하였습니다.
```swift!
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: animated)
}

override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.setNavigationBarHidden(false, animated: animated)
}
```

### <폰트가 다른 글자를 한 레이블에 넣기>

🤯 **문제상황**

첫 번째 메인 포스터 뷰에서는 각 데이터의 이름을 나타내는 맨 앞의 문자열과 그 뒤에 값들의 폰트 크기가 서로 다르게 표현되어야 하는데 같게 출력되는 문제가 있었습니다.

🔥 **해결방법**
특정 문자열의 속성을 변경할 수 있는 NSMutableAttributedString으로 문자열의 타입을 변환해주고 addAttribute를 이용하여 문자열 내에서 폰트를 변경해주고 싶은 문자열의 길이를 지정해주었습니다.

```swift
let expoTitle = NSMutableAttributedString(string: "방문객 : " + format(by: exposition.visitors))
let expoLocation = NSMutableAttributedString(string: "개최지 : " + exposition.location)
let expoDuration = NSMutableAttributedString(string: "개최 기간 : " + exposition.duration)
let font1 = UIFont.systemFont(ofSize: 20)

expoTitle.addAttribute(.font, value: font1, range: NSRange(location: 0, length: 4))
expoLocation.addAttribute(.font, value: font1, range: NSRange(location: 0, length: 4))
expoDuration.addAttribute(.font, value: font1, range: NSRange(location: 0, length: 5))
```


### <중복되는 디코딩 메소드 통합>

🤯 **문제상황**

DecodingHandler 내부에 Exposition과 Entry타입을 디코딩해서 반환하는 메소드가 두 개 있었습니다.
```swift
static func getExposition() -> Exposition {       
    //생략
}

static func getEntryList() -> [Entry] {
    //생략
}
```
두 메소드의 코드 내용이 대부분 똑같고 반환하는 타입과 json파일 이름만 달랐습니다.
그래서 두 함수를 하나로 통합하고 싶은 생각이 들었습니다.


🔥 **해결방법**
Generic을 사용하여 문제를 해결했습니다. 
```swift
 static func decode<T: Codable>(fileName file: FileName) -> T? {
```
Decodable을 준수하는 제네릭 타입을 이용해 Exposition과 Entry를 하나의 메소드로 디코드했습니다. 
파일이름은 다르기 때문에 매개변수로 전달받아 사용했습니다. 또한 변환과정에서 에러가 발생하면 리턴할 내용이 없기 때문에 nil을 반환할 수 있도록 T? 타입을 반환했습니다.

### **<폰트 오버라이딩 이슈>**

🤯 **문제상황** 
`attributtedText`를 사용해 폰트 크기에 차이를 두었는데
dynamic type를 사용하기 위해 font를 지정해주었더니 
`configureDynamicType()` 메서드의 지정 폰트로 덮여져서 타이틀과 컨텐츠의 폰트 차이가 사라지는 문제가 발생했습니다.

🔥 **해결방법**
기존에 단순히 같이 `NSMutableAtrribtuedString`로 변환했던 것을 타이틀 문자열만 따로 빼와서 컨텐츠와 분리하여 각각`titleFont`, `contentFont`로 스타일을 지정해주었고 타이틀과 컨텐츠가 합쳐진 문자열에 `addAttribute` 메서드로 처리하며 해결하였습니다.
```swift!
let visitorTitle = "방문객 : "
let locationTitle = "개최지 : "
let durationTitle = "개최 기간 : "

let totalVisitorText = NSMutableAttributedString(string: visitorTitle + exposition.visitors.expositionFormat)
let totalLocationText = NSMutableAttributedString(string: locationTitle + exposition.location)
let totalDurationText = NSMutableAttributedString(string: durationTitle + exposition.duration)

let titleFont = UIFont.preferredFont(forTextStyle: .title2)
let contentFont = UIFont.preferredFont(forTextStyle: .callout)

totalVisitorText.addAttribute(.font, value: titleFont, range: NSRange(location: 0, length: visitorTitle.count))
totalLocationText.addAttribute(.font, value: titleFont, range: NSRange(location: 0, length: locationTitle.count))
totalDurationText.addAttribute(.font, value: titleFont, range: NSRange(location: 0, length: durationTitle.count))

```
- - -
### **<일시적인 뷰의 출력 문제>**

🤯 **문제상황**
cell의 `layoutsubview()`에서 폰트랑 다이나믹 타입을 설정해주면
처음에는 …으로 잘려서 보이다가 스크롤을 하면 다시 정상적으로 표시되는 일시적인 뷰의 문제가 발생했습니다.

![](https://hackmd.io/_uploads/By2UW2fK3.gif)

🔥 **해결방법**
`configureDynamicType()` 메서드를 생성하여 `table datasource`에서 cell의 메소드를 호출하는 방법으로 해결하였습니다.

```swift
func configureDynamicType() {
    self.entryTitleLabel.adjustsFontForContentSizeCategory = true
    self.entryShortDescriptionLabel.adjustsFontForContentSizeCategory = true
}
```
- - -
### **<셀의 선택효과 이슈>**

🤯 **문제상황**
`KoreanEntryListVC`에서 셀을 선택한 뒤 다시 돌아와도 해당 cell이 회색 색상으로 계속 선택되어있는 문제가 있었습니다.

![](https://hackmd.io/_uploads/SJgQ0sGYn.png)

🔥 **해결방법**
tableView의 `didSelectRowAt` 메서드에서 `KoreanEntryListVC`로 다시 화면이 전환될 때 기존에 선택했던 셀의 선택이 초기화 되도록 설정하여 해결했습니다.
```swift
entryTableView.deselectRow(at: indexPath, animated: false)
```
<br>


## 😀 미해결 문제
### **<레이아웃 문제>**

스택뷰안 버튼의 다이나믹타입을 설정해 준 상태에서 폰트를 최대한으로 키우면 버튼의 레이블만 커지고 스택뷰는 그대로 유지됩니다. 버튼의 레이블이 스택뷰를 뚫고 나와 다른 뷰를 가리는 문제가 발생했습니다.

![](https://hackmd.io/_uploads/BkoMTsGY2.png)

![](https://hackmd.io/_uploads/rkdQpjfFh.png)

원인은 스택뷰 안에 들어있는 이미지가 고정값인 44x44로 되어있어 스택뷰가 더 이상 늘어나지 않아 생긴 문제인 것 같습니다.

---
### **<Accessibility>**
1. 시각장애인을 위해 accessibility를 설정하던 도중 이미지는 어떻게 설명해야할까 기획적인 고민을 했습니다.
2. 단순히 이미지 이름을 VoiceOver를 통해 안내한다면 아무 의미없는 안내일 것 같습니다.
3. 따라서 저희는 poster.png를 accessiblityLabel을 이용해 "파리 도심 속의 문화재들. 이미지"라고 표현했습니다.

* 실제 현업에서는 이미지의 accessibility를 어떻게 표현하고 있나요? 이렇게 이미지마다 설명을 넣어주는 것이 현명한 방법일까요? 

최근 앱 접근성 의무화 법안이 발의되었다고 합니다.
https://www.youtube.com/watch?v=dEsml1bNtBU&t=74s
* 현업에서는 이에 어떻게 대응하고 있을까요? 
* component 마다 accessibility 메소드를 덕지덕지 넣어 관리하는 방법 외에 다른 관리방법이 있을까요?
---
### **<AttributedString 추상화과정에서 에러>**
1. 한 레이블안에 단어마다 폰트를 다르게 줘야하는 상황 때문에 NSMutableAttributedString을 사용했습니다.
2. 하지만 코드가 너무 길어져 해당 코드를 추상화 하기로 했습니다.

기존 코드
```swift
let visitorTitle = "방문객 : "
let locationTitle = "개최지 : "
let durationTitle = "개최 기간 : "

let totalVisitorText = NSMutableAttributedString(string: visitorTitle + exposition.visitors.expositionFormat)
let totalLocationText = NSMutableAttributedString(string: locationTitle + exposition.location)
let totalDurationText = NSMutableAttributedString(string: durationTitle + exposition.duration)

let titleFont = UIFont.preferredFont(forTextStyle: .title2)
let contentFont = UIFont.preferredFont(forTextStyle: .callout)

totalVisitorText.addAttribute(.font, value: titleFont, range: NSRange(location: 0, length: visitorTitle.count))
totalLocationText.addAttribute(.font, value: titleFont, range: NSRange(location: 0, length: locationTitle.count))
totalDurationText.addAttribute(.font, value: titleFont, range: NSRange(location: 0, length: durationTitle.count))

totalVisitorText.addAttribute(.font, value: contentFont, range: NSRange(location: visitorTitle.count, length: exposition.visitors.expositionFormat.count))
totalLocationText.addAttribute(.font, value: contentFont, range: NSRange(location: locationTitle.count, length: exposition.location.count))
totalDurationText.addAttribute(.font, value: contentFont, range: NSRange(location: durationTitle.count, length: exposition.duration.count))

self.expositionTitleLabel.text = exposition.title.replacingOccurrences(of: "(", with: "\n(")
self.visitorsLabel.attributedText = totalVisitorText
self.locationLabel.attributedText = totalLocationText
self.durationLabel.attributedText = totalDurationText
self.descriptionLabel.text = exposition.description
```

개선한 코드
```swift
extension String {
    func fontSeparate(titleFont: UIFont.TextStyle, title: String, contentFont: UIFont.TextStyle, content: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        
        let titleRange = NSRange(location: 0, length: title.count)
        let contentRange = NSRange(location: title.count, length: content.count)
        
        attributedString.addAttribute(.font, value: titleFont, range: titleRange)
        attributedString.addAttribute(.font, value: contentFont, range: contentRange)
        
        return attributedString
    }
}

//ViewController.swift
self.visitorsLabel.attributedText = totalVisitorText.fontSeparate(titleFont: .title2, title: visitorTitle, contentFont: .callout, content: entry.visitors.expositionFormat)
//...생략
```

하지만 기존코드에선 에러없이 잘 동작하는데 개선한 코드에서 런타임에러가 발생합니다. 

`Error: fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection`

에러가 발생하는 시점은 label을 configure하는 메소드가 종료되고 dynamicType을 configure할 때 발생합니다.

font가 제대로 설정되지 않은 문제일까요..?
    
---
<a id="5."></a>

## 팀 회고

### 우리팀이 잘한 점
```
짝프로그래밍을 통해서 일방적인 의견으로만 진행되는 것이 아닌
각자의 아이디어를 꾸준하게 공유하면서 코드의 방향성을 잡아갔고
그 덕분에 보다 가독성과 재사용성이 높은 코드를 작성할 수 있었습니다.
```

### 우리팀이 개선할 점
```
짝프로그래밍에서 드라이버와 네비게이터의 역할이 모호했다.
```
### 서로에게 좋았던 점
    
### Dear. Minsup
```
- 사고의 범위가 넓어서 함께 다양한 시도를 해볼 수 있어서 좋았습니다.
- 배려하는 대화법이 좋았습니다.
- 프로젝트에 대한 열정이 느껴졌습니다.
```
    
### Dear. Jusbug
```
- 문제해결 능력이 탁월했습니다.
- 끈기가 높았습니다.
- 의사소통이 원활했습니다.
```

</br>

    
<a id="6."></a>

## 참고 문서
    
- [🍎 Apple-JSON Data](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)
- [🍎 Apple-TableView](https://developer.apple.com/documentation/uikit/uitableview)
- [🍎 Apple-Dynamic Type](https://developer.apple.com/documentation/swiftui/dynamictypesize)
- [🍎 Apple-NSAttributedString](https://developer.apple.com/documentation/foundation/nsattributedstring)
- [🍎 Apple-Accessbility](https://developer.apple.com/videos/play/wwdc2019/257/)
- [📖 blog-화면방향 설정](https://sgtelecominc.tistory.com/50)
- [📖 blog-Dynamic Type 설정방법](https://velog.io/@minni/Dynamic-Type-egjn26z5)
- [📖 blog-Priority](https://callmedaniel.tistory.com/18)



    
