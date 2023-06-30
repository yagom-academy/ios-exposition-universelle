<<<<<<< HEAD
# 🚩만국박람회 - MINT😈, Yetti🦊: 베라즈🍨
> 프로젝트 기간 23/06/26 ~ 23/07/07
=======
## iOS 커리어 스타터 캠프
>>>>>>> parent of f177429 (Update README.md)

## 📖 목차
🍀 [소개](#-소개) <br>
👨‍💻 [팀원](#-팀원) <br>
🕰️ [타임 라인](#-타임-라인) <br>
👀 [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조) <br>
💻 [실행 화면](#-실행-화면) <br>
🧨 [트러블 슈팅](#-트러블-슈팅) <br>
📚 [참고 링크](#-참고-링크) <br>
👥 [팀 회고](#-팀-회고) <br>

</br>

## 🍀 소개
🌿민트초코 민트😈와 🌠슈팅스타 예티🦊가 만든 만국 박람회 팜플렛 앱! <br>
1900년 파리에서 열린 만국 박람회와 관련한 한국의 출품작들을 확인해볼 수 있습니다🇰🇷

⚠️ 주의 ⚠️ 
- 오로지 한국의 출품작 목록만을 확인 할 수 있습니다.
- 혹시라도 다른 나라의 출품작이 궁금하시다면... 잘못된 접근입니다. 404 NOT Found🫣
</br>

## 👨‍💻 팀원
| 🦊Yetti🦊 | 😈MINT😈 |
| :--------: | :--------: |
| <Img src =  "https://hackmd.io/_uploads/BJ-7TbPu3.png" width="200" height="200"> | <Img src = "https://hackmd.io/_uploads/rJKgcQ2dh.png"  width="200" height="200"> |
|[Github Profile](https://github.com/iOS-Yetti) |[Github Profile](https://github.com/mint3382) |

</br>

## 🕰️ 타임 라인
|날짜|내용|
|:--:|--|
|2023.06.26.| - Model 구현 |
|2023.06.27.| - mainView 구현 <br> - Scroll View 구현 <br> - Stack View 구현 <br> - JSON decoding extension으로 구현 |
|2023.06.28.| - navigation controller로 화면전환 구현 <br> - EntryListView 구현 <br> - Table View 구현 <br> - Table View Cell Custom |
|2023.06.29.| - EntryDetailViewController 구현 <br> - EntryDetalView 구현 <br> - EntryListViewController에서 각 cell 선택시 화면 전환 구현 <br> - Int extension 구현 <br> - UIImageView extention 구현 |
|2023.06.30.| - Decodable+ 리펙토링 <br> - 네이밍 및 컨벤션 수정 |


</br>

## 👀 시각화된 프로젝트 구조
### ℹ️ File Tree
````
Expo1900
    ├── Error
    │   ├── DecoderError
    ├── Extension
    │   ├── Decodable+
    │   └── Int+
    ├── Model
    │   ├── Entry
    │   ├── ExpoGuide
    ├── View
    │   ├── Main
    │   ├── LaunchScreen
    ├── Controller
    │   ├── AppDelegate
    │   ├── SceneDelegate
    │   ├── MainViewController
    │   ├── EntryListViewController
    │   ├── EntryTableViewCell
    │   ├── DetailEntryViewController
    ├── Assets
    ├── Info
````

### 📐 Diagram
<p align="center">
<img width="800" src= "https://hackmd.io/_uploads/rkEsw73u2.png" >


</br>

## 💻 실행 화면
| 메인 화면 | 출품작 목록 화면 | 출품작 상세 화면 |
|:--------:|:--------:|:--------:|
|<img src="https://velog.velcdn.com/images/mintsong/post/e08d859b-79aa-4e76-8e8b-0110982f1960/image.gif" width="250">|<img src="https://velog.velcdn.com/images/mintsong/post/8afba4ca-5f3e-453a-a8c3-8ca1014896a2/image.gif" width="250">|<img src="https://velog.velcdn.com/images/mintsong/post/bddda467-f716-4e1f-9829-a3f0eb186ac4/image.gif" width="250">|

| 출품작 목록 화면으로 전환 | 출품작 상세 화면으로 전환 |
|:--------:|:--------:|
|<img src="https://hackmd.io/_uploads/H1pGUz2_2.gif" width="250">|<img src="https://velog.velcdn.com/images/mintsong/post/e423875b-dacd-45a4-84df-3f6d25b68037/image.gif" width="250">|

| 메인 화면으로 돌아가기 | 출품작 목록 화면으로 돌아가기 |
|:--------:|:--------:|
|<img src="https://velog.velcdn.com/images/mintsong/post/675745de-45ef-4915-9757-6248b2cd74a2/image.gif" width="250">|<img src="https://hackmd.io/_uploads/H1xkwfnOn.gif" width="250">|

</br>

## 🧨 트러블 슈팅
1️⃣ **Decodable extension 사용** <br>
-
🔒 **문제점** <br>
JSON파일을 디코딩할 때마다 매번 JSONDecoder()인스턴스를 만들어서 디코딩을 해주는 과정이 번거롭게 느껴졌습니다.

🔑 **해결방법** <br>
extension을 통해 Decodable에 인스턴스를 생성하고 디코딩해주는 메서드를 정의해주었습니다.
```swift
extension Decodable {
    static func decode(file: String) throws -> Self {
        guard let dataAsset = NSDataAsset(name: file) else {
            throw DecodeError.noFile
        }

        return try JSONDecoder().decode(Self.self, from: dataAsset.data)
    }
}
```
<br>

2️⃣ **isNavigationBarHidden** <br>
-
🔒 **문제점** <br>
각 뷰컨트롤러마다의 네비게이션바의 여부가 달랐기 때문에 어떤 방식을 사용해 네비게이션 바를 필요할 때만 보여줄 수 있을까에 대해 고민하였습니다.


🔑 **해결방법** <br>
`MainViewController`의 `viewWillAppear`와 `viewWillDisAppear` 메서드 내부에서 `isNavigationBarHidden`를 활용해 네비게이션 바를 숨겼다가 뷰가 전환될 때 네비게이션 바가 나타날 수 있게 해주었습니다.
```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.isNavigationBarHidden = true
}
    
override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.isNavigationBarHidden = false
}
```
<br>

3️⃣ **메인 viewController에서 요구사항 구현** <br>
-
🔒 **문제점** <br>
1. 머리말 구현
요구사항에 보면 mainViewController의 view에서는 ExpoGuide의 visitors, location, duration에 관한 정보들이 무엇인지 명시해주고 있습니다. <br>
![](https://hackmd.io/_uploads/SkvPqTjd2.png) <br>
때문에 이 부분들은 받아와서 decode된 data를 그대로 쓰는 것이 아니라 약간의 변형이 필요했습니다. 

2. 방문객 수 표현
다만 방문객 수를 표현하는 부분에서 고민이 있었습니다. 방문객 수는 `1. decimal style로 표현`되어 있고, `2. 뒤에 "명"이라는 String`도 붙여주어야 했습니다.

🔑 **해결방법** <br>
1. Label 사용
새로운 label을 stackView에 넣어서 View에서부터 선언해주었습니다. <br>
![](https://hackmd.io/_uploads/HyTPyRi_h.png) <br>

2. Int extension의 Numberfomatter와 연산 프로퍼티 사용
일단 이 내용을 label의 .text로 넣는 것이기에 Int 타입인 `visitors`를 Int의 extension안에 numberFormatter를 사용하여 Decimal style로 변환해 주었습니다. 

처음에는 `2. 뒤에 "명"이라는 String`을 붙여주는 것을 ViewController에서 visitorsLabel.text = visitors + "명"의 형식으로 바로 넣어주려고 하였습니다. 그러나 앞의 visitors를 가지고 있는 ExpoGuideData가 옵셔널 타입이라 바인딩이 필요했습니다. 때문에 ExpoGuide 구조체에 연산 프로퍼티를 만들어 뒤에 "명"을 넣어 반환해주는 방법을 사용하였습니다.

```swift
var visitorsText: String {
        return visitors.changeToDecimalStyle() + " 명"
    }
```

<br>

<br>

4️⃣ **instantiateViewController를 이용한 데이터 전달** <br>
-
🔒 **문제점** <br>
`EntryListViewController`에서 `DetailEntryViewController`로 데이터를 전달할 때 어떤 방식을 선택할지 고민했습니다.

🔑 **해결방법** <br>
저희가 선택한 방법은 init을 구현하여 data를 주입해주는 것입니다. 이때 `EntryListViewController`에서 `DetailEntryViewController`를 구현한 init을 통해 생성할 때 `instantiateViewController`메서드의 `creator:`를 할용해 data를 주입할 수 있도록 구현하였습니다.
```swift
// EntryListViewController
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let entryDetailViewController = self.storyboard?.instantiateViewController(identifier: "detailEntryViewController", creator: { coder in DetailEntryViewController(coder: coder, data: self.entryData[indexPath.row]) }) else {
            return
        }
        
        navigationController?.pushViewController(entryDetailViewController, animated: true)
    }

// DetailEntryViewController
// data를 주입받을 이니셜라이저
init?(coder: NSCoder, data: Entry) {
        self.entryData = data
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
```

<br>

## 📚 참고 링크
- [🍎Apple Docs: ContentInset](https://developer.apple.com/documentation/uikit/uiscrollview/1619406-contentinset)
- [🍎Apple Docs: NavigationController](https://developer.apple.com/documentation/uikit/uinavigationcontroller)
- [🍎Apple Docs: UIImageView](https://developer.apple.com/documentation/uikit/uiimageview)
- [🍎Apple Docs: Localizederror](https://developer.apple.com/documentation/foundation/localizederror)
- [🍎Apple Docs: init(coder)](https://developer.apple.com/documentation/foundation/nscoding/1416145-init)
- [🍏Apple Archaive: NSCoding](https://developer.apple.com/library/archive/documentation/LegacyTechnologies/WebObjects/WebObjects_3.5/Reference/Frameworks/ObjC/Foundation/Protocols/NSCoding/Description.html#//apple_ref/occ/intf/NSCoding)
- <Img src = "https://hackmd.io/_uploads/SkQWz1wd2.png" width="20"/> [네이버 부스트코스: 기상정보 애플리케이션 ](https://www.boostcourse.org/mo326/joinLectures/12973?isDesc=false)
- <Img src = "https://github.com/mint3382/ios-calculator-app/assets/124643545/56986ab4-dc23-4e29-bdda-f00ec1db809b" width="20"/> [야곰닷넷: 오토레이아웃 정복하기 ](https://yagom.net/courses/autolayout/)
- <Img src = "https://hackmd.io/_uploads/ByTEsGUv3.png" width="20"/> [blog: static metatype](https://sujinnaljin.medium.com/swift-self-type-protocol-self%EA%B0%80-%EB%AD%94%EB%94%94%EC%9A%94-7839f6aacd4)


</br>

## 👥 팀 회고
- [팀 회고 링크](https://github.com/iOS-Yetti/ios-exposition-universelle/wiki)
