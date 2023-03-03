# 만국박람회🇰🇷🇫🇷

## 목차
1. [소개](#1-소개)
2. [팀원](#2-팀원)
3. [타임라인](#3-타임라인)
4. [프로젝트 구조](#4-프로젝트-구조)
5. [실행화면(기능 설명)](#5-실행-화면기능-설명)
6. [트러블슈팅](#6-트러블-슈팅)
7. [참고링크](#7-참고-링크)
8. [아쉬운점](#8-아쉬운-점)

## 1. 소개
1900년 개최된 파리 만국박람회에 대한 정보와 한국 출품작의 설명을 보여주는 프로젝트입니다.

<br/>

## 2. 팀원

|⭐️[Rhode](https://github.com/Rhode-park)|⭐️[Christy](https://github.com/christy-hs-lee)|
| :--------: | :--------: |
|<img height="180px" src="https://i.imgur.com/XyDwGwe.jpg">|<img height="180px" src="https://i.imgur.com/kHLXeMG.png">|



</br>

## 3. 타임라인
### 프로젝트 진행 기간
**23.02.20 (월) ~ 23.02.24 (금)** 

| 날짜 | STEP | 타임라인 |
| --- | --- | --- |
|23.02.20 (월)| STEP1 | - Json Decoding과 UITableView 학습 | 
|23.02.21 (화)| STEP1 | - Json 데이터와 매칭할 모델 타입 구현</br> |
|23.02.22 (수)| STEP2 | - ItemViewController에서 tableView 구현</br>- Json Decoding 후 tableView cell에 데이터 전달 |
|23.02.23 (목)| STEP2 | - ExhibitItemViewController 구현</br>- 화면간 데이터 전달 구현</br>|
|23.02.24 (금)| STEP2 | - 컨벤션 및 변수명 수정 </br>- 리드미 작성 |

<br/>



## 4. 프로젝트 구조
### 폴더 구조
````
Expo1900
    ├── Resources
    │   ├── AppDelegate
    │   ├── SceneDelegate
    │   ├── Assets
    │   └── Info
    └── Sources
        ├── Model
        │    ├── ExhibitItem
        │    └── ExpositionUniverselle
        ├── View
        │    ├── Main
        │    └── LaunchScreen
        └── Controller
             ├── ExpositionViewController
             ├── ItemViewController
             └── ExhibitItemViewController    
````

<br/>

## 5. 실행 화면(기능 설명)

| 박람회 홈 화면 | 출품작 화면 | 세부 출품작 화면 |
| :--------: | :--------: | :--------: |
| <img src="https://i.imgur.com/iurlyPP.gif" width=250> | <img src="https://i.imgur.com/spY7DDv.gif" width=250> | <img src="https://user-images.githubusercontent.com/61936306/221088638-ba442fb8-c0f7-4cbc-a25a-019fe43f529d.gif" width=250>|

</br>

## 6. 트러블 슈팅
### 1️⃣ 카멜케이스와 스네이크케이스
json에서는 객체들을 스네이크케이스를 사용하여 나타내고 있었습니다. 이를테면 야곰 아카데미를 `yagom_academy`와 같은 식으로 표현하는 것입니다. Swift에서는 lower 카멜케이스를 사용합니다. `yagomAcademy`와 같은 식으로 표현합니다. 호환성?을 가지게 하기 위해서 enum 타입을 만들어 원래의 표현을 rawValue로 주고, 새로이 가지게 될 변수명을 case에 적어주었습니다. 

```swift
private enum CodingKeys: String, CodingKey {
    case name
    case imageName = "image_name"
    case shortDescription = "short_desc"
    case description = "desc"
}
```

이 때, `CodingKey`라는 프로토콜을 채택하게 됩니다:

<img height="100px" src="https://i.imgur.com/eLhPRxC.png">

인코딩과 디코딩을 위한 키로 사용되는 타입이라는 것입니다. 그러면 알아서 rawValue에 해당하는 값을 swift에 호환 가능한 새로운 변수명으로 바꾸어줍니다.

<br/>

### 2️⃣ 네비게이션바 hidden
첫 번째 화면에서는 네비게이션바가 보이지 않습니다. 그래서 첫 번째 화면에서는 네비게이션바를 감추고 나머지 화면들에서는 네비게이션바를 보여줘야합니다. 스토리 보드 상에서 다음의 인스펙터에서 `Hidden`에 체크를 할 수 있습니다:

![](https://i.imgur.com/DCmhs3T.png)

이렇게 할 경우, 다른 네비게이션바까지 모두 사라지는 문제가 발생했습니다.
그래서 맨 첫번째 뷰에서만 네비게이션바를 보이지 않게 코드를 작성했습니다:
```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.isNavigationBarHidden = true
}
```
`viewWillAppear`에 해당 코드를 넣은 이유는, 다음 화면으로 넘어갔다가 다시 돌아올 때 `viewDidLoad`가 아닌 `viewWillAppear`부터 사이클이 시작되기 때문입니다. 뷰의 라이프 사이클은 다음과 같습니다: 

<img height="300px" src="https://i.imgur.com/Vp09mAy.png">

이런 사이클을 가지기 때문에 `viewWillAppear`에 해당 코드를 넣어 현재의 화면으로 다시 돌아오면 네비게이션바가 없어지도록 만들었습니다.

다른 화면에서는 네비게이션바가 있어야하기 때문에, 다음 화면의 `viewDidLoad`에서 다시 `isNavigationBarHidden`를 `false`로 바꾸어주었습니다:

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    exhibitItems = decodeJson()
    self.tableView.reloadData()
    self.navigationController?.isNavigationBarHidden = false
    self.navigationItem.title = "한국의 출품작"
}
```

</br>

## 7. 참고 링크
> - [Swift 공식문서 - UITableView](https://developer.apple.com/documentation/uikit/uitableview)
> - [Swift 공식문서 - UITableViewController](https://developer.apple.com/documentation/uikit/uitableviewcontroller)
> - [Swift 공식문서 - Filling a table with data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)
> - [Swift 공식문서 - UITableViewDataSource](https://developer.apple.com/documentation/uikit/uitableviewdatasource)
> - [Swift 공식문서 - UITableViewDelegate](https://developer.apple.com/documentation/uikit/uitableviewdelegate)
> - [부스트코스 - JSON 다루기](https://www.boostcourse.org/mo326/lecture/20146?isDesc=false)


<br/>

## 8. 아쉬운 점
### STEP 2
화면간 데이터 전달 방식이 적절하지 않았던 것 같아서 아쉬움이 남습니다. `prepare`함수와 `segue`를 통해 데이터를 다음 화면으로 전달하였는데, `delegation`이나 `initializer`를 사용한 방법을 고려해볼 수 있을 것 같습니다. 


<br/>

---
