# README

## 프로젝트 소개 :book:
> JSON 파일에 맞는 Model을 생성하고 Decording하여 전시품 정보를 앱에 표시
> 
> 프로젝트 기간 2023.02.20 - 2023.03.03
> 리뷰어 : 태태 🧑🏻‍💻

## 팀원을 소개합니다 👀




|<center>[kokkilE](https://github.com/kokkilE)</center>| <center> 코끼릴라 </center> | <center> [릴라](https://github.com/juun97)</center> | 
|--- | --- | --- |
|<img width="200" src=https://i.imgur.com/4I8bNFT.png>| <img src="https://i.imgur.com/dDXwxUj.png" width=300>  |<img width="200"  src=https://i.imgur.com/S4TSmpH.png> |


## Class Diagram 🗺

<img src= "https://i.imgur.com/juBeLTG.png">


## File Tree 🌲

```typescript
├── Application
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
├── Model
│   ├── Decoder.swift
│   ├── ExhibitItem.swift
│   ├── Exposition.swift
│   ├── FontSize.swift
│   └── extension
│       ├── extension+UIImage.swift
│       └── extention+UITableViewCell.swift
├── Resource
│   ├── Assets.xcassets
│   │   ├── AccentColor.colorset
│   │   │   └── Contents.json
│   │   ├── AppIcon.appiconset
│   │   │   └── Contents.json
│   │   ├── Contents.json
│   │   └── expo_assets
│   ├── Base.lproj
│   │   └── LaunchScreen.storyboard
│   └── Info.plist
└── ViewController
    ├── ExhibitItemViewController.swift
    ├── ItemDescriptionViewController.swift
    └── PosterViewController.swift
￼
```


## 타임라인 ⏰

| <center>STEP | <center>날짜 | <center>타임라인 |
| --- | --- | --- |
|STEP1| **2023.02.20** | - ImageContent 타입 정의 </br>- Exposition 타입 정의 </br> -  ExhibitItem 타입 정의 </br> |
|STEP2| **2023.02.21** | - Exposition 타입 내 JSON 디코딩 메서드 구현 </br> - PosterViewController 타입 정의 </br> - PosterViewController 타입의 상위 navigation controller 추가 </br> - PosterViewController 타입 내 scrollView 구현 </br> - PosterViewController 타입 내 scrollView의 하위 UI 오브젝트 구현 </br> - PosterViewController 타입 내 UI 오브젝트 오토레이아웃 적용 |
|STEP2| **2023.02.22** | - PosterViewController 타입 내 버튼 이벤트에 따른 화면전환 메서드 구현 </br> - ExhibitItemViewController 타입 정의 </br> - ExhibitItemViewController 타입 내 tableView 구현 </br> - ExhibitItemViewController 타입 내 tableView에 추가되어 전시품 데이터를 나타낼 Custom Cell 구현 </br> - ExhibitItemViewController 타입 내 UI 오브젝트 오토레이아웃 적용 |
|STEP2| **2023.02.23** | - ExhibitItemViewController 타입 내 Cell 데이터 전달 구조 변경 </br> - Custom Cell 삭제 및 extension UITableViewCell 구현 </br> - extension UIImage 구현 </br> - ExhibitItemViewController 타입 내 화면전환 메서드 구현 </br> - ItemDescriptionViewController 타입 정의 </br> - ItemDescriptionViewController 타입 내 UI 오브젝트 구현 및 오토레이아웃 적용 </br> - 전체적인 컨벤션 정리 </br> - StoryBoard 삭제 |

## 실행화면 🎬

|<center>초기화면</center>|<center>버튼 클릭 시 화면전환</center>|
|--|--|
| ![](https://i.imgur.com/oWnNQQK.gif)|![](https://i.imgur.com/jGvWmAI.gif)  |


|<center>테이블 뷰 정상출력</center>|<center>셀 클릭 시 화면전환</center>|
|--|--|
| ![](https://i.imgur.com/r546Oeg.gif) | ![](https://i.imgur.com/luZRMm8.gif) |

## STEP 트러블슈팅 🚀

## 1️⃣ 코드로 UI 구현
> 코드로 UI요소를 구현하면서 가장 많이 헤맨곳은 `오토 레이아웃` 의 문제 였습니다.
분명히 UI 를 만들고 view 에 addSubView 를 진행했으나 화면에는 출력되지 않는 문제가 있었습니다.

### UI 요소가 화면에 표시되지 않던 현상
 - 여기 저기 헤맨 결과 알아낸 문제점은 바로 `오토 레이아웃`이었습니다. 오토레이아웃을 적용하지 않으면 화면에 표시되지 않았고 레이아웃 제약을 통해 오토 레이아웃을 준 결과 화면에 정상적으로 잘 출력 되었습니다.

- 마찬가지로 UIStackView 의 오토레이아웃을 주지 않고 내부 subview 들만 오토레이아웃을 적용한 상태에서 `UIStackView.addArrangeSubview`를 할 경우 화면에 표시되지 않았습니다.
반대로 UIStackView의 오토레이아웃만 적용하면 내부의 subview는 자동으로 크기가 잡히는것을 확인했습니다. :+1: 

## 2️⃣ Title 개행 처리
exposition 의 Json 파일을 보게 되면 title 이 하나의 문장으로 되어 있습니다.

```json
"title": "파리 만국박람회 1900(L'Exposition de Paris 1900)"
```

 이 문장을 한글 부분과 영어 부분을 나누어 다른 줄로 출력을 하고 싶었기에 몇가지 방법을 고민 해보았습니다.

### String.components
- 첫 번째로 했던 생각은 해당 문자열을 String 의 Subscript 인 components 를 이용해 `(` 을 기준으로 나누어 한글 부분과 영어 부분을 나눠보려 했습니다.
- 하지만 이 방법으로 진행하게 되면 몇 가지 문제점이 있었습니다. 
1. 한글 title 과 영어 title 을 담을 2개의 UILabel 이 필요했습니다.
2. `(` 을 기준으로 나누었기에 영어 title 의 맨 앞에 `(` 을 다시 붙여주는 과정이 필요했습니다.

> 위 이유로 다른 방법이 있지 않을까 더 고민했습니다.

### `/n` 개행 문자 넣어주기
- 한글 title 과 영어 title 의 경계부분에 `/n` 개행문자를 넣어주게 되면 하나의 UILabel 로 같이 관리할 수 있었기에 해당 방법을 사용하는 쪽으로 결정했습니다.

```swift
if let index = title.range(of: "(")?.lowerBound {
            title.insert(contentsOf: "\n", at: index)
        }
```

1. `range(of: )` 메서드를 이용해 `(` 가 시작되는 첫번 째 위치를 찾기
2. `lowerBound` 프로퍼티를 이용해 인덱스를 가져오기
3.  찾은 인덱스를 기준으로 `insert` 메서드를 이용해 `\n` 개행문자 넣기 

위 방법을 사용해 title 중간에 개행문자를 넣어 한글과 영어부분을 분리하였습니다.

## 3️⃣ 좌우 스크롤 문제
<img src= "https://i.imgur.com/Q7xjVv8.gif" width=250>
<br><br>

``` swift
view.addSubview(scrollView)

NSLayoutConstraint.activate([
    scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
    scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
    scrollView.topAnchor.constraint(equalTo: view.topAnchor),
    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
...

scrollView.addSubview(stackView)

NSLayoutConstraint.activate([
    stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
    stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
    stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
    stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
    ])
```
- 위와 같이 오토레이아웃을 적용했을 때 좌우로 스크롤이 되는것을 확인했습니다.
-  scrollView의 leading과 trailing을 view를 기준으로 적용하고, scrollView 내 stackView를 scrollView를 기준으로 오토레이아웃을 적용했으니 stackView의 좌우 길이가 고정될 것이라고 `생각했지만` 예상처럼 작동하지 않았습니다.

> 다음과 같이 widthAnchor를 추가하여 해결할 수 있었습니다.

``` swift
    stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
```
## 4️⃣ StackView 내의 ImageView의 공간 차지
<img src= "https://i.imgur.com/YAObb2O.png" height=450> <img src= "https://i.imgur.com/akhNQ5O.png" height=450>
<br>

- 2개의 태극기 UIImageView와 1개의 UITextLabel을 UIStackView 내에 subview로 넣었을 때의 화면입니다.
- UIImageView의 배경을 칠해 확인해보니, 위와 같이 height가 늘어나 있는것을 확인할 수 있었습니다. width에 따라 자동으로 비율에 맞춰 height가 조정되면 좋을텐데, height는 원본의 크기를 그대로 유지하는 듯 했습니다.

> 다음과 같이 이미지뷰 자체에 크기제한을 적용하여 해결할 수 있었는데요.
``` swift
leftImageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
rightImageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
```
`상수`로 크기제한을 주는 것 보다 비율에 맞춰 자동으로 높이까지 조절되게 할 방법이 없을지 조금 아쉬움이 있습니다. :cry: 

<br>

## 5️⃣ Cell의 UI 구성

- 처음에는 UITableViewCell를 상속받는 `CustomCell` 을 직접 구현했습니다. 직접 구현을 하다보니 저희가 필요로 하는 UI 요소를 하나하나 만들고 추가까지 하는 과정에서 코드의 길이가 매우 길어진 상태였습니다.

- 그러다 다른 캠퍼분의 조언으로 cell의 `ContentConfiguration` 에 기본적으로 `imageView` 와 `textProperties` 그리고 `secondaryText` 가 있다는걸 알게 되었고, 이 구성요소는 저희가 사용하고자 하는 구성요소와 같았기에 cell 의 ContentConfiguration 을 이용해 UI를 구성하였습니다.

```swift
var content = self.defaultContentConfiguration()

        content.text = item.name
        content.textProperties.font = UIFont.systemFont(ofSize: FontSize.subTitle)
        content.secondaryText = item.shortDescription
        content.secondaryTextProperties.font = UIFont.systemFont(ofSize: FontSize.content)
        content.image = image
```
    
 직접 UI 를 만들지 않고 `ContentConfiguration` 를 사용하니 코드의 길이도 확 줄고 가독성면에서도 개선되는 점을 체험했습니다 😋
 
 ## Reference
 - [UITableView - Apple 공식문서](https://developer.apple.com/documentation/uikit/uitableview)
 - [Filling a table with data - Apple 공식 문서](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)
 - [UITableViewDataSource - Apple 공식 문서](https://developer.apple.com/documentation/uikit/uitableviewdatasource)
 - [UITableViewDelegate - Apple 공식 문서](https://developer.apple.com/documentation/uikit/uitableviewdelegate)
 - [JSONDecoder - Apple 공식문서](https://developer.apple.com/documentation/foundation/jsondecoder)
