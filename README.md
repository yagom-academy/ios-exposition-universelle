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
만국박람회 JSON 데이터를 기반으로 만국박람회 소개와 목차만들기

<br>

## 2. 팀원

| vetto | Goat|
|:----:|:----:|
| <img src="https://cdn.discordapp.com/attachments/535779947118329866/1055718870951940146/1671110054020-0.jpg" width="130" height="130"/> | <img src="https://i.imgur.com/yoWVC56.png" width="130" height="130"/>
| [<img src="https://i.imgur.com/IOAJpzu.png" width="22"/> Github](https://github.com/gzzjk159) | [<img src="https://i.imgur.com/IOAJpzu.png" width="22"/> Github](https://github.com/Goatt8)

<br>

## 3. 타임라인

<details open>
    <summary>23.02.20 ~ 23.02.24</summary>
    
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
<br>

</details>

## 4. 시각화된 프로젝트 구조
### 폴더 구조
``` swift
Expo1900
    ├── Info
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
    │   └── ExpositionItem
    │
    └── Resources
        ├── LaunchScreen
        └──  Assets
```

<br>

## 5. 실행 화면

<br/>

<img src="https://i.imgur.com/o89sBDv.gif">

<br/>

* `MainViewController` 메인화면에서 -> `ListViewControllr` 리스트뷰(한국의출품작)로 -> `DetailViewController` 상세설명화면으로 이동하는 모습입니다

<br>

## 6. 트러블 슈팅

### tableView cell 오토레이아웃
<img src="https://i.imgur.com/jmny4jK.png" width = 60%>

<img src= "https://i.imgur.com/FY8liz1.png">

<br/>

* STEP3에서 진행에정이지만 오토레이아웃 적용중 해결하지못한 부분이 있습니다. textLabe의 오토레이아웃을 cell안에서 적용시 적용한 constants만큼 cell과의 거리를 유치한채로 텍스트가 보이고 cell이 늘어나야 정상이라고 생각되는데, Lines를 0으로 조정했음에도 텍스트가 계속늘어나지않고 cell의 범위안에서 잘리는 현상이 계속됬습니다.
* 테이블뷰가 지정한 cell의 크기를 고정적으로 갖고있어야하는건지, 아니면 cell의 사이즈를 안에 contents만큼 조정하도록 할 수 있는지 이부분에 대해 해결점을 찾아야할것 같습니다.
    * **해결책** -> 이 부분에 대해 **이미지의 제약을 주고 셀을 넣었기때문**이라고 리뷰어분께서 말씀해주셨었는데 아마 **이미지가 갖고있는 오토레이아웃이 위아래로 cell의 범위를 잡고있어서** 생긴문제였던것 같습니다.

<br>

### 데이터 전달 방식
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

* 해결법: DetailViewController 내부의 String?을 갖는 프로퍼티를 만들고 내부 프로퍼티의 값을 저장하고 그 값을 viewDidLoad에서 IBOutlet에 저장해주는 방식으로 코드를 작성하였습니다.

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

## 7. 팀 회고
<details>
    <summary>팀 회고</summary>
    
다음 주에 작성 예정

</details>
    
<br/>

## 8. 참고 링크
[JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)  
[CodingKey](https://developer.apple.com/documentation/swift/codingkey)  
[TableView](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)  
[Filling a table with data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)  
