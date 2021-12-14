### Yagom iOS 커리어 스타터 캠프

## 프로젝트 6 - 만국박람회

# 개요

1. 프로젝트 기간: '21.12.06 ~ '21.12.17
2. 캠퍼 : 나무, 제이티, 숲재
3. 리뷰어 : 흰

# Step1

## 학습 키워드
- `JSON` 
- `Codable`
- `NSDataAsset` 

## 고민한 점
1. Codable? Decodable? 

`Codable` 프로토콜은 `typealias Codable = Decodable & Encodable` 이렇게 두 가지 프로토콜을 결합한 형태입니다. 저희 프로젝트에서는 미리 준비된 데이터를 파싱하여 사용하기만 하지, 가공하거나 생성하여 통신하는 등의 Encoding 작업은 하지 않을것으로 예상했습니다. 

그래서 `Codable` 을 채택하면 코드를 읽는데 있어 불필요한 오해의 소지가 있을 것 같아, 대신 `Decodable`을 채택해 주었습니다.


2. 연산 프로퍼티 사용을 통한 넘버 포맷팅
```swift
extension ExpoInfo {
    var formattedVisitors: String {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        guard let formatted = numberFormatter.string(for: self.visitors) else {
            return ""
        }
        
        return formatted + " 명"
    }
```

스텝2 요구사항을 참고하여 첫번째 화면의 `방문객`에 표시되어야 할 정보를 형식 변환하는 연산프로퍼티를 추가했습니다. VC에서는 View를 표시하는 것 외의 역할을 하지 않도록 데이터를 원하는 형태로 미리 가공을 해두는 방식을 택했습니다. 

# STEP2

## 학습 키워드
- `TableView`, `TableViewDataSource`, `TableViewDelegate`
- `TableViewCell`
- `AutoLayout`
- `ScrollView`, `FrameLayoutGuide`, `ContentLayoutGuide`
- `bound`, `frame`
- `instantiateViewController(identifier:creator:)`

## 고민한 점
**1. TextView? Label?**

첫번째뷰와 세번째뷰에는 긴 스트링을 나타내는 UI요소가 필요한데, `Label`과 `TextView` 중 어느것을 선택할지 고민했습니다. 
Apple Human Interface Guidelines를 찾아보니 `TextView`는 여러줄의 텍스트 내용을 출력하는데 적합하고 `Label`은 짧은 메시지를 전달하는데 적합하다고 판단하여 `TextView`를 선택했습니다.
> A text view displays multiline, styled text content. (HIG TextView)

> A label describes an onscreen interface element or provides a short message. (HIG Label)

프로젝트 요구사항에서는 텍스트 뷰 안에 들어갈 내용이 단어 단위로 lineBreak되어 있는데, `TextView`가 기본적으로 가지고 있는 lineBreakMode 프로퍼티로는 한글로 이루어진 텍스트에 적용이 되지 않는 것을 확인했습니다. 그래서 `TextView`의 `attributedText`프로퍼티를 활용하여 `lineBreakStrategy`를 적용하여 해결했습니다. `label`을 사용했다면 기본적으로 `lineBreakStrategy` 프로퍼티를 가지고 있기 때문에 쉽게 해결되었을텐데, 저희가 `TextView`를 선택한 것이 좋은 선택이었는지 모르겠습니다 😅

## 궁금한 점

**1. 매직 스트링을 어떻게 관리해야 할까요?**

`ExpoInfoViewController`의 title, `AlertAction`의 title, `TableViewCell`과 `ItemsViewController`의 identifier 등을 코드 내부에 직접 적어주었는데, 유지보수 시 문제가 될 것 같다는 생각이 들었습니다. 필요한 스트링들을 모아서 관리하는 타입을 만드는 방법이 대안으로 생각나는데요, 혹시 다른 좋은 방법이 있을까요? 

**2. 어디까지를 storyboard로 하고 어디까지를 코드로 해야할까요?**

현재 저희 프로젝트에서는 일관성을 위하여 AutoLayout **Constraint**는 **모두 인터페이스 빌더로 설정**해 주었고, **그 외 설정값들을 각 뷰컨트롤러 코드에서 셋팅**합니다.
오토레이아웃 제약 이외의 부분들이 여기저기에서 관리된다면 추후 유지보수시 혼란이 있을 것 같다는 판단에서였습니다.
하지만 그로 인해, 현재 첫 번째 뷰의 Storyboard에서는 빨간색 에러가 발생하고 있습니다. (TextView의 Scroll이 Enabled되어 높이 값을 특정할 수 없으므로)
스토리보드와 코드를 병용하는 현 상황에서 뷰에 대한 기능들을 어떤 기준으로 코드/인터페이스빌더에서 설정해 줄지가 궁금합니다!

**3. guard let + 후행클로저??**

스토리보드를 통해 세 번째 VC에 접근하여 `ItemDetailViewController`로 인스턴스화 한 후에, 옵셔널 값인 스토리보드를 바인딩해 주려 하였으나 빨간색 에러 메세지가 나오며 빌드되지 않는 상황이 있었습니다.
```swift
guard let detailViewController =
        storyboard?.instantiateViewController(identifier: "itemDetail") { coder in
    return ItemDetailViewController(coder: coder, data: self.items[indexPath.row])
} else {
    return
}
// 에러 발생

```
후행 클로저 이후에 else를 써 주면 문법적으로 틀렸다고 인식하는 것으로 보입니다.
그래서 다음과 같이 수정해 주었는데요.
```swift
guard let detailViewController =
        storyboard?.instantiateViewController(identifier: "itemDetail", creator: { coder in
            return ItemDetailViewController(coder: coder, data: self.items[indexPath.row])
        }) else {
    return
}
// 빌드 성공
```
후행클로저를 사용하지 않고 creator 매개변수에 클로저를 직접 넘겨주는 방식입니다.

혹시 후행클로저를 사용하면서도 guard let을 사용할 수 있는 방법이 있을까요? 이것이 왜 문법에서 어긋난 것인지 궁금합니다.

## 이슈 & 해결방법
### 1. 스크롤뷰의 ContentsLayoutGuide가 의도치 않은 위치에서 시작되는 문제
첫 번째 화면의 스크롤뷰 내부 Constraint를 구현하는 도중, 내부 콘텐츠의 세로 길이가 일정 길이 이상인 경우와 그렇지 않은 경우에서 ContentsLayoutGuide의 시작지점에 차이가 생기는 문제가 발생했습니다.
ScrollView와 그 하위 ContentView의 배경색을 다르게 하여 눈으로 구분할 수 있게 테스트 해 보았습니다.

<img src="https://i.imgur.com/xMucjA6.png" width="20%" height="20%">

내부 콘텐츠의 세로 길이가 일정 길이 이하인 경우

<img src="https://i.imgur.com/aLpaLx8.png" width="20%" height="20%">

내부 콘텐츠의 세로 길이가 일정 길이 이상인 경우


- 콘텐츠의 세로 길이가 일정 길이 이상인 경우에는 Safety Area 아래에서부터 콘텐츠가 시작됨을 볼 수 있습니다.

### 결론
스크롤뷰는 **"스크롤될만큼 컨텐츠뷰 크기가 큰 경우"** 에는 **Safety Area 아래**에서부터 컨텐츠가 표시되도록 Contents Layout Guide를 조절하는 듯 합니다.

그렇지 않은 경우에는, Safety Area와 겹치더라도 y = 0 지점부터 컨텐츠를 표시하는 경우가 발생합니다.
이에 유의하여 스크롤뷰를 다루는 것이 좋을 것 같습니다.

---
### 2. 네비게이션 스택의 첫 번째 뷰에 NavigationBar가 표시되지 않도록 하려면?

프로젝트 요구사항에서는 다음과 같이 첫번째 뷰에서는 네비게이션 바가 표시되지 않고, **두 번째 화면으로 전환할 때 네비게이션 바가 함께 push/pop**되도록 요구하고 있습니다.

<img src="https://i.imgur.com/i57U9wV.png" width="20%" height="20%">
<img src="https://i.imgur.com/X9leBBt.png" width="20%" height="20%">

두 번째 화면부터 네비게이션 컨트롤러에 embed해야 할지 등등 여러 방법들을 고민했지만, push 방법으로 화면전환을 하기 위해서는 첫 번째 뷰도 네비게이션 컨트롤러에 embed되어있어야 했습니다. 고민 끝에 찾아낸 해결 방법은 다음과 같습니다.

`viewWillAppear`와 `viewWillDisappear`에서 `setNavigationBarHidden(bool:animated:)` 메서드를 사용하여 해당 뷰를 벗어날 때는 내비게이션 바가 드러나고 다시 해당 뷰가 표시될 때는 내비게이션 바를 숨기도록 구현하였습니다. 그리고 해당 메서드의 `animated` 파라미터를 true로 설정했을 때 요구사항의 동작과 완벽히 일치하는 것을 확인할 수 있었습니다(두번째 뷰가 pop될 때 내비게이션 바가 서서히 사라지도록).
