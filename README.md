# 만국박람회 :kr: 

## 목차
[1. 프로젝트 소개](#1-프로젝트-소개)  
[2. 팀원](#2-팀원)  
[3. 타임라인](#3-타임라인)  
[4. 시각화된 프로젝트 구조](#4-시각화된-프로젝트-구조)  
[5. 실행 화면](#5-실행-화면)  
[6. 트러블 슈팅](#6-트러블-슈팅)  
[7. 팀 회고](#7-팀-회고)  
[8. 참고 링크](#8-참고-링크)  

## 1. 프로젝트 소개
만국박람회에 대한 소개와 한국의 출품작에 대한 리스트, 상세설명이 담긴 프로젝트

<br>

## 2. 팀원

| vetto | Goat |
|:----:|:----:|
| <img src="https://cdn.discordapp.com/attachments/535779947118329866/1055718870951940146/1671110054020-0.jpg" width="130" height="130"/> | <img src="https://i.imgur.com/yoWVC56.png" width="130" height="130"/>
| [<img src="https://i.imgur.com/IOAJpzu.png" width="22"/> Github](https://github.com/gzzjk159) | [<img src="https://i.imgur.com/IOAJpzu.png" width="22"/> Github](https://github.com/Goatt8)

<br>

## 3. 타임라인

<details open>
    <summary>23.02.20 ~ 23.03.03</summary>
    
- 23.02.20(월)
    - 만국박람회 프로젝트 시작
    - josn data를 받아올 모델 생성
- 23.02.21(화)
    - json data 파싱 및 
    - MainViewController Label, Image연결
    - Asset import
- 23.02.22(수)
    - TableView cell 생성 및 Label, Image연결
    - DetailViewController 생성 및 Label, Image연결
- 23.02.23(목)
    - 개행 정리 및 메서드 분리
    - String Enum 생성
- 23.02.24(금)
    - 네이밍 수정 및 메서드 분리
- 23.02.27(월)
    - STEP2 피드백 수정
- 23.02.28(화)
    - STEP3 시작, 오토레이아웃 UI적용, PR요청
- 23.03.01(수)
    - 개인 학습
- 23.03.02(목)
    - STEP3 피드백을 바탕으로, 오토레이아웃 스택뷰로 수정, 매서드명 변수명 수정

<br>

</details>

## 4. 시각화된 프로젝트 구조

<details>
    <summary><big>폴더 구조</big></summary>

``` swift
Expo1900
    ├── Info
    │
    ├── Extension
    │   └── IntExtension
    │
    ├── App
    │   ├── AppDelegate
    │   └── SceneDelegate
    │
    ├── Controller
    │   ├── MainViewController
    │   ├── ExpositionViewController
    │   └── DetailViewController
    │
    ├── View
    │   ├── Main
    │   └── ListTableViewCell
    │
    ├── Model
    │   ├── TextEnum
    │   ├── MainExposition
    │   ├── ExpositionItem
    │   └── ExpositionParser
    │
    └── Resources
        ├── LaunchScreen
        └── Assets
```

<br>    
    
</details>


<details>
    <summary><big>UML</big></summary>

<img src="https://i.imgur.com/1OH6HMG.jpg" width= 100%>

    
</details> 

<br>

## 5. 실행 화면


| 뷰컨트롤러 간 이동 | 화면방향고정 |
|:----:|:----:|
| <img src="https://i.imgur.com/o89sBDv.gif"> | <img src="https://i.imgur.com/sNw7rv2.gif">| 
| `MainViewController` 메인화면에서 -> `ListViewControllr` 리스트뷰(한국의출품작)로 -> `DetailViewController` 상세설명화면으로 이동하는 모습입니다| 첫번째 메인ViewController에서는 세로화면만 지원, 다음ViewController부터는 가로화면도 지원하게끔 적용한 모습입니다.|


<br>

## 6. 트러블 슈팅

### :fire: tableView cell 오토레이아웃


<br/>

* STEP3에서 진행에정이지만 오토레이아웃 적용중 해결하지못한 부분이 있습니다. textLabe의 오토레이아웃을 cell안에서 적용시 적용한 constants만큼 cell과의 거리를 유치한채로 텍스트가 보이고 cell이 늘어나야 정상이라고 생각되는데, Lines를 0으로 조정했음에도 텍스트가 계속늘어나지않고 cell의 범위안에서 잘리는 현상이 계속됬습니다.
* 테이블뷰가 지정한 cell의 크기를 고정적으로 갖고있어야하는건지, 아니면 cell의 사이즈를 안에 contents만큼 조정하도록 할 수 있는지 이부분에 대해 해결점을 찾아야할것 같습니다.
    * **[해결]** -> 이 부분에 대해 **이미지의 제약을 주고 셀을 넣었기때문**이라고 리뷰어분께서 말씀해주셨었는데 아마 **이미지가 갖고있는 오토레이아웃이 위아래로 cell의 범위를 잡고있어서** 생긴문제였던것 같습니다.

<br>

### :fire: 데이터 전달 방식
* 문제점: DetailViewController로 넘어가기 전에 detailViewController라는 객체를 생성하여 detailViewController가 가지고 있는 IBOutlet에 직접 image와 label을 넣으려고 했지만 detailViewController로 넘어갔을 때 정상적으로 image와 label이 제대로 나오지 않는 것을 확인했습니다.

수정 전
```swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    listTableView.deselectRow(at: indexPath, animated: true)
    guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: Identifier.detailViewController) as? DetailViewController else { return }
        
    detailVC.itemImage.image = UIImage(named: expositionLisnt[indexPath.row].imageName)
    detailVC.itemDescription = expositionList[indexPath.row].description
    detailVC.navigationItem.title = expositionList[indexPath.row].name
        
    let backBarButtonItem = UIBarButtonItem(title: Title.itemsOfKorea, style: .plain, target: DetailViewController.self, action: nil)
        
    self.navigationItem.backBarButtonItem = backBarButtonItem
    self.navigationController?.pushViewController(detailVC , animated: true)
}
```

<br>

* **[해결]**: DetailViewController 내부의 String?을 갖는 프로퍼티를 만들고 내부 프로퍼티의 값을 저장하고 그 값을 viewDidLoad에서 IBOutlet에 저장해주는 방식으로 코드를 작성하였습니다.

수정 후
```swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    listTableView.deselectRow(at: indexPath, animated: true)
    guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: Identifier.detailViewController) as? DetailViewController else { return }
        
    detailVC.imageString = expositionList[indexPath.row].imageName
    detailVC.fullDescription = expositionList[indexPath.row].description
    detailVC.navigationItem.title = expositionList[indexPath.row].name
        
    let backBarButtonItem = UIBarButtonItem(title: Title.itemsOfKorea, style: .plain, target: DetailViewController.self, action: nil)
        
    self.navigationItem.backBarButtonItem = backBarButtonItem
    self.navigationController?.pushViewController(detailVC , animated: true)
}
```

<br/>

### :fire: 레이블 분리 or NSAttributedString 


<img src="https://i.imgur.com/hF0VEuY.png"><br/>


* 보기예시 위 이미지처럼 `방문객 + JSONData`와 같은 형식으로 Label을 표현했으나 앞에 `String`부분과 뒤에 `Data`부분의 사이즈가 다름을 확인했고, 이를 적용하기 위해 `NSAttributedString`혹은 `Label분리` 두가지 방법이 있었습니다.
- **[해결]** 리뷰어의 제안에 오토레이아웃을 StackView로 정리하면서 기회가 있을 때 StackView의 적용을 고려해봤으면 좋겠다고 하셔서 Label을 두개로 분리해 StackView로 묶고 각각 `fontSize`를 달리주는 방법을 선택했습니다 

<br/>

### :fire: appDelegate의 권한
```swift
let appDelegate = UIApplication.shared.delegate as! AppDelegate
```
* 문제점: 위에 코드는 첫 화면을 세로로 고정하기 위해 mainViewController안에 작성하게 되었는데 그렇게 되면 외부에서 appDelegate로 접근할 수 있을 뿐만 아니라 최상위 객체의 권한을 아무런 제약없이 가질 수 있게 된다.

```swift
private func switchViewAllOrientation() {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    appDelegate?.isViewAllOrientation.toggle()
}
```

* 해결법: method를 정의하고 지역변수로 선언하여 권한을 일시적으로 내부에서만 갖게하여 method 종료시에는 권한을 가질 수 없게 하였다. 
    * 하지만 이 역시도 메서드안에선 권한을 여전히 가지고 있기 때문에 권한을 제한할 방법을 생각해봐야 한다.


## 7. 팀 회고
<details>
    <summary>팀 회고</summary>
    
### 우리팀이 부족했던 부분
* storyboard를 사용하여 코드로 짜는 부분을 실행하지 못했다.
* 시간이 서로 맞지 않아 다른 조보다 많은 의견을 나누지 못했다.
* storyborad로 빠르게 짜다 보니 detail적인 Naming, 접근제어, 권한 등을 고려하지 못한 부분이 있었다.

### 우리팀이 잘한 부분
* 코드컨벤션을 통일하려고 노력한부분과 커밋을 세세하게짜고, 페어로 작업하려고 노력한부분이 좋았습니다
* 나름 서로의 의견조율을 통해 코드를 진행하려고한 부분이 좋았습니다

</details>
<br/>

## 8. 참고 링크
[JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)  
[CodingKey](https://developer.apple.com/documentation/swift/codingkey)  
[TableView](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)  
[Filling a table with data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)  
