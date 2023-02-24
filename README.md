# 만국박람회

## 목차
[1. 프로젝트 소개](#1-프로젝트-소개)<br>
[2. 팀원](#2-팀원)<br>
[3. 타임라인](#3-타임라인)<br>
[4. 시각화된 프로젝트 구조](#4-시각화된-프로젝트-구조)<br>
[5. 실행 화면](#5-실행-화면)<br>
[6. 트러블 슈팅](#6-트러블-슈팅)<br>
[7. 참고 링크](#7-참고-링크)
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

<br>

## 2. 팀원

| Harry | 레옹아범 |
|:----:| :----: |
| <img src="https://i.imgur.com/BYdaDjU.png" width="130" height="130"/> | <img src="https://raw.githubusercontent.com/Rhode-park/ios-rock-paper-scissors/step02/image/leonFather.jpeg" height="130"> |
| [<img src="https://i.imgur.com/IOAJpzu.png" width="22"/> Github](https://github.com/HarryHyeon) | [<img src="https://i.imgur.com/IOAJpzu.png" width="22"/> Github](https://github.com/fatherLeon) |

<br>

## 3. 타임라인

|날짜|타임라인|
|:--:|:--:|
|2023.2.20.(월)|디코딩할 모델 타입 구현 (MainPoster, ExhibitionItem)|
|2023.2.21.(화)|메인화면 구성|
|2023.2.22.(수)|작품목록 화면 구성, 상세보기 화면 구성|
|2023.2.23.(목)|TableViewCell 내 UI 업데이트 및 재사용시 이전 셀 데이터 초기화|


<br>

## 4. 시각화된 프로젝트 구조
### 폴더 구조
``` swift
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

### 클래스 다이어그램

<img src="https://github.com/HarryHyeon/ios-exposition-universelle/blob/step2/Image/ClassDiagram.png?raw=true">

<br>

## 5. 실행 화면

|성공화면|데이터로딩 실패 화면-1|데이터로딩 실패 화면-2|
|:--:|:--:|:--:|
|<img src="https://github.com/HarryHyeon/ios-exposition-universelle/blob/step2/Image/성공화면.gif?raw=true">|<img src="https://github.com/HarryHyeon/ios-exposition-universelle/blob/step2/Image/MainPoster실패화면.gif?raw=true">|<img src="https://github.com/HarryHyeon/ios-exposition-universelle/blob/step2/Image/TableView실패화면.gif?raw=true">|

<br>

## 6. 트러블 슈팅

### DTO에서 연산프로퍼티 사용

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

### 중복되는 View 재사용하기
- 첫번째 MainPoster뷰컨트롤러와, Detail뷰컨트롤러는 스크롤뷰를 사용함으로 이 부분이 중복되어 `CustomScrollView`를 만들어 해당 뷰를 재사용하도록 만들었습니다.
- 테이블뷰에서 사용되는 재사용 셀을 StackView와 Label 들을 사용하여 커스텀 클래스로 만들어 주었습니다.

<br>

### 뷰컨트롤러의 지정 이니셜라이져 정의
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

### ScrollView의 components가 Dynamic Type이 되지 않던 문제 해결
* ScrollView내의 TextView 혹은 Label이 시스템 폰트 크기를 변화시켰을 때 같이 변화하지 않던 문제가 있었습니다.
* TextView와 Label의 폰트 모두 .preferredFont()메소드를 통해 폰트를 가지고 있었기 때문에 `adjustsFontForContentSizeCategory`를 통해 디바이스의 폰트 사이즈가 커질 경우 앱의 폰트크기도 같이 변하게끔 만들었습니다.

```swift
label.adjustsFontForContentSizeCategory = true
...
```

<br>

### 하나의 Label에 서로 다른 FontSize 주기
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

## 7. 참고 링크
- [Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
- [스토리보드 없이 UI 구성](https://velog.io/@lina0322/iOSSwift-스토리보드-없이-코드로만-UI-구현하기-SceneDelegate에서-window설정)
- [Storyboard 없이 앱 만들기](https://apcheon.tistory.com/146)
- [UML - nextree](https://www.nextree.co.kr/p6753/)
- [서브 클래스의 이니셜라이져 만들기 - velog](https://velog.io/@dev_jane/UIViewController-%EC%84%9C%EB%B8%8C%ED%81%B4%EB%9E%98%EC%8A%A4%EC%9D%98-custom-initializer-%EB%A7%8C%EB%93%A4%EA%B8%B0required-initializer-initcoder-must-be-provided-by-subclass-of-UIViewController)
