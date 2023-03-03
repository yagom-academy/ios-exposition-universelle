# 만국박람회

## 목차
[1. 프로젝트 소개](#1-프로젝트-소개)
[2. 팀원](#2-팀원)
[3. 타임라인](#3-타임라인)
[4. 시각화된 프로젝트 구조](#4-시각화된-프로젝트-구조)
[5. 실행 화면](#5-실행-화면)
[6. 트러블 슈팅](#6-트러블-슈팅)
[7. 팀 회고](#7-팀-회고)
[8. 참고 링크](#8-참고-링크)
<br>
<br>

## 1. 프로젝트 소개
- 1900년에 프랑스 파리에서 열린 만국박람회에 대한 소개와, 한국의 출품작에 대해 알아볼 수 있는 앱입니다.

- 핵심적으로 다뤄본 기술
    - TableView
    - JSONDecoder
    - AttributedString
    - AutoLayout
    - Dynamic Type
    - Navigation Bar
    - Line Break Mode, Line Strategy
    - Accessibility

<br>
<br>

## 2. 팀원

| Harry | 레옹아범 |
|:----:| :----: |
|<div style="width:130px"><img src="https://i.imgur.com/BYdaDjU.png" width="130" height="130"/></div>|<div style="width:130px"><img src="https://raw.githubusercontent.com/Rhode-park/ios-rock-paper-scissors/step02/image/leonFather.jpeg"></div>|
| [<img src="https://i.imgur.com/IOAJpzu.png" width="22"/> Github](https://github.com/HarryHyeon) | [<img src="https://i.imgur.com/IOAJpzu.png" width="22"/> Github](https://github.com/fatherLeon) |

<br>
<br>

## 3. 타임라인

|날짜|타임라인|
|:--:|:--:|
|2023.2.20.(월)|디코딩할 모델 타입 구현 (MainPoster, ExhibitionItem)|
|2023.2.21.(화)|메인화면 구성|
|2023.2.22.(수)|작품목록 화면 구성, 상세보기 화면 구성|
|2023.2.23.(목)|TableViewCell 내 UI 업데이트 및 재사용시 이전 셀 데이터 초기화|
|2023.2.24.(금)|메인화면 Dynamic 타입 적용|
|2023.2.27.(월)|작품목록 화면, 상세보기 화면 Dynamic 타입 적용|
|2023.2.28.(화)|가로화면에 대응하도록 레이아웃 제약 수정|
|2023.3.1(수)|UIButton Dynamic 타입 적용|
|2023.3.2(목)|열거형 타입 정의로 하드 코딩 문자열 또는 스칼라 제거|
|2023.3.3(금)|전체적인 코드 컨벤션 수정|

<br>
<br>

## 4. 시각화된 프로젝트 구조
### 폴더 구조

<details>   
    <summary>폴더 구조 보기</summary>   

```swift
Expo1900
│
├── App
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
│
├── Model
│   ├── AlertError.swift
│   ├── ExhibitionItem.swift
│   └── MainPoster.swift
│
├── View
│   ├── CustomScrollView.swift
│   └── ExhibitionEntryCell.swift
│
├── Controller
│   ├── AlertManager.swift
│   ├── DetailViewController.swift
│   ├── ExhibitionEntryTableViewController.swift
│   └── MainPosterViewController.swift
│
├── Info.plist
└── Assets.xcassets
```
</details>

<br>

### 클래스 다이어그램
<details>   
    <summary>클래스 다이어그램 보기</summary>   
    <div markdown="1">
        <img src="https://github.com/HarryHyeon/ios-exposition-universelle/blob/step3/Image/ClassDiagram.png?raw=true">
    </div>
</details>


<br>
<br>

## 5. 실행 화면

<details>
<summary>실행화면 보기</summary>
    
    
|성공화면|데이터로딩 실패 화면-1|데이터로딩 실패 화면-2|
|:--:|:--:|:--:|
|<img src="https://github.com/HarryHyeon/ios-exposition-universelle/blob/step2/Image/성공화면.gif?raw=true">|<img src="https://github.com/HarryHyeon/ios-exposition-universelle/blob/step2/Image/MainPoster실패화면.gif?raw=true">|<img src="https://github.com/HarryHyeon/ios-exposition-universelle/blob/step2/Image/TableView실패화면.gif?raw=true">|

|Dynamic Font-1|Dynamic Font-2|가로화면|
|:--:|:--:|:--:|
|<img src="https://github.com/HarryHyeon/ios-exposition-universelle/blob/step3/Image/첫화면글자.gif?raw=true">|<img src="https://github.com/HarryHyeon/ios-exposition-universelle/blob/step3/Image/두세번째화면글자.gif?raw=true">|![](https://i.imgur.com/CwS8cQL.gif)|
    
    
</details>

<br>
<br>

## 6. 트러블 슈팅

### 1️⃣ DTO에서 연산프로퍼티 사용

```swift
struct MainPoster: Decodable {
    private let numberOfVisitors: Int
    private let location: String
    private let duration: String
    
    var visitorsText: String {
        return "방문객 : \(self.visitors)명"
    }
    
    var locationText: String {
        return "개최지 : \(self.location)"
    }
    
    var durationText: String {
        return "개최 기간 : \(self.duration)"
    }
}

struct ExhibitionItem: Decodable {
    private let imageName: String
    
    var image: UIImage? {
        return UIImage(named: self.imageName)
    }
}
```
* 뷰 컨트롤러 혹은 그 외의 객체에서 임의로 문자열을 넣어 label 혹은 image를 수정하는 것 보다는 해당 DTO에서 연산프로퍼티를 사용하는 것이 좋겠다라고 생각했습니다.
* label.text 혹은 imageView.image에 해당 연산프로퍼티를 넣어주는 것이 코드 수정이나 확장면에서 용의하다고 생각하여 위와 같이 코드를 작성하였습니다.
* 또한, 외부에서 연산프로퍼티만을 접근하면 되기 때문에 기존의 CodingKeys를 통해 만든 프로퍼티들의 경우 접근제어자를 `private`로 하여 외부에서 접근하지 못하도록 만들었습니다.

<br>

### 2️⃣ 중복되는 View 재사용하기
- 첫번째 MainPoster뷰컨트롤러와, Detail뷰컨트롤러는 스크롤뷰를 사용함으로 이 부분이 중복되어 `CustomScrollView`를 만들어 해당 뷰를 재사용하도록 만들었습니다.
- 테이블뷰에서 사용되는 재사용 셀을 StackView와 Label 들을 사용하여 커스텀 클래스로 만들어 주었습니다.

<br>

### 3️⃣ 뷰컨트롤러의 지정 이니셜라이져 정의
``` swift
final class DetailViewController: UIViewController {

    private let exhibitionItem: ExhibitionItem
    
    init(exhibitionItem: ExhibitionItem) {
        self.exhibitionItem = exhibitionItem
        super.init(nibName: nil, bundle: nil)
    }
}
```
- 2번째 화면인 테이블 뷰 컨트롤러의 셀을 터치 후 화면전환을 할때 데이터를 전달하기 위해 사용했습니다.
- 어떤방식으로 데이터를 전달할까 고민중에 2번째 화면에서 상세보기 화면의 인스턴스를 생성할때 3번째 화면인 상세보기 화면에서 필요한 데이터를 이니셜라이져로 전달하기로 하였습니다.

<br>

### 4️⃣ ScrollView의 components가 Dynamic Type이 되지 않던 문제 해결
* ScrollView내의 TextView 혹은 Label이 시스템 폰트 크기를 변화시켰을 때 같이 변화하지 않던 문제가 있었습니다.
* TextView와 Label의 폰트 모두 .preferredFont()메소드를 통해 폰트를 가지고 있었기 때문에 `adjustsFontForContentSizeCategory`를 통해 디바이스의 폰트 사이즈가 커질 경우 앱의 폰트크기도 같이 변하게끔 만들었습니다.

```swift
label.adjustsFontForContentSizeCategory = true
...
```

<br>

### 5️⃣ 하나의 Label에 서로 다른 FontSize 주기
```swift
let fontSize = UIFont.preferredFont(forTextStyle: .title3)
let attributedText = NSMutableAttributedString(string: text)
        
guard let index = text.firstIndex(of: ":") else { return }
        
let substring = String(text.prefix(upTo: index))
        
attributedText.addAttribute(.font, value: fontSize, range: (text as NSString).range(of: substring))
label.attributedText = attributedText
```
* `NSMutableAttributedString`과 `UILabel.attributedText`를 사용하여 하나의 라벨이 두가지의 FontSize를 가질 수 있도록 만들었습니다.

<br>

### 6️⃣ attribute Text에 Dynamic Type 적용하기
- 기존 방식의 문제점
    - 레이블 3개를 사용했습니다.
    - 각각의 레이블 마다 텍스트의 글자 수가 달라서 접근성 검사기에서 폰트 크기를 키워주면 3개의 레이블의 폰트 크기가 제각각이었습니다.
    - 파리 만국 박람회의 정보를 알려주는 레이블이라 폰트의 크기가 같아야 보기가 좋을것 같다고 생각했습니다.

- 해결책 1
    - UIView의 프로퍼티 사용해서 콘텐츠의 최대 또는 최소 크기를 제한 할 수 있었습니다.
```swift
var minimumContentSizeCategory: UIContentSizeCategory?
var maximumContentSizeCategory: UIContentSizeCategory?
```

- 해결책 2
    - 3개로 나누어져 있던 레이블을 한 개의 레이블로 통합시키기
    - 줄 바꿈 문자열을 추가해서 총 3줄이 출력될 수 있도록 하고, attributed text를 적용해서 폰트 크기를 다르게 할 수 있도록 할 수 있었습니다.

- 결론
    - 해결책 2번을 선택했습니다.
    - 해결책 1번 같은 경우는 구현하기는 아주 간단하지만 iOS 15버전 이상부터 적용되는 프로퍼티이므로 범용성이 없다고 생각하여 해결책 2번으로 문제를 해결했습니다.

<br>

### 7️⃣ adjustsFontSizeToFitWidth
#### 문제점
- Font 크기를 사용자의 기기폰트 사이즈와 같게끔 하면 글자가 잘리거나, 한줄이 여러줄이 되거나 하는 등의 문제가 있었습니다.
- 원래 Label안의 텍스트가 여러줄이었다면 똑같이 여러줄을 표시해주면 좋을것 같다고 생각하지만, 제목과 같은 한줄 Label은 사용자 기기의 폰트 크기가 아무리 커도 한줄을 유지하는 것이 좋겠다고 생각하였습니다.

#### 해결방법
![](https://i.imgur.com/ZudqgN9.gif)
- [adjustFontSizeToFitWidth](https://developer.apple.com/documentation/uikit/uilabel/1620546-adjustsfontsizetofitwidth) UILabel 프로퍼티를 사용하여 Label의 너비에 맞춰서 폰트사이즈를 조정함으로 너비가 safeArea의 끝까지 길어지는 경우 더 이상 폰트 사이즈가 커지지 않고 기존 한줄로 유지되도록 만들었습니다.

<br>
<br>

## 7. 팀 회고

### 우리 팀 잘한 점
- 재사용 되는 뷰를 하나의 component로 만들어 사용한 점
- JsonDecoding 구현뿐만 아니라 실패했을 때의 처리방법에 대해서도 고민한 점
- Dynamic Type을 화면에 적용시킬 때 폰트가 너무 커졌을때 줄바꿈이 된다. 이로 인해 가독성이 떨어지는 문제를 고민하고 해결한 점

### 우리 팀 개선할 점
- Image View를 Dynamic Type으로 적절하게 적용시키는 해결책을 찾지 못했다. 추후에 공부하고 시도해보기 !
- 레이아웃 제약을 설정하는 것에 아직 능숙하지 않았다. 막상 시도해보니 어려운 부분이 있었고, 반복 숙달로 열심히 연습하자 !
- 코딩 컨벤션을 모든 코드에 지키지 못한 것

### 팀원 서로 칭찬하기

|Harry|레옹아범|
|:-:|:-:|
|레옹아범, 2주간 수고 많으셨습니다. 레옹아범이 제시하는 아이디어 덕분에 많이 배우고 프로젝트 진행하는 내내 배울것 투성이라 재미있게 진행한것 같습니다! 다음에 또 만나요🫡|Harry, 덕분에 2주간 여러가지 시도와 다양한 개념들을 배울 수 있었습니다. 추후에도 같이 프로젝트를 한다면 더 많은 것을 배울 수 있을 것 같아 기대되네요👍👍|

<br>
<br>

## 8. 참고 링크
- [Apple Docs - NSMutableAttributedString](https://developer.apple.com/documentation/foundation/nsmutableattributedstring)
- [Apple Docs - NSMutableParagraphStyle](https://developer.apple.com/documentation/uikit/nsmutableparagraphstyle)
- [Apple Docs - adjustsfontsizetofitwidth](https://developer.apple.com/documentation/uikit/uilabel/1620546-adjustsfontsizetofitwidth)
- [Apple Docs - adjustsFontForContentSizeCategory](https://developer.apple.com/documentation/uikit/uicontentsizecategoryadjusting/1771731-adjustsfontforcontentsizecategor)
- [Apple Docs - init(nibName:bundle:)](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621359-init)
- [Apple Docs - init(coder:)](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621403-init)
- [Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
- [UML - nextree](https://www.nextree.co.kr/p6753/)

