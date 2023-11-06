# 🎊 만국박람회
1900 만국박람회 설명과 출품작 목록 그리고 각 출품작의 상세 설명을 확인할 수 있는 어플

---
## 🔎 목차
- [팀원](#-팀원)
- [타임라인](#-타임라인)
- [시각화 구조](#-시각화-구조)
- [트러블 슈팅](#-트러블-슈팅)
- [참고 링크](#-참고-링크)

---
## 👥 팀원
|쥬봉이🐱|미르🐉|
|---|---|
|<img src="https://avatars.githubusercontent.com/u/126065608?v=4" width="200" height="200">|<img src="https://github.com/mireu79/ios-exposition-universelle/assets/125941932/45dff9f5-f1a9-4398-82c9-5764daf9083d" width="200" height="200">|
|[GitHub](https://github.com/jyubong)|[GitHub](https://github.com/mireu79)|

## 📅 타임라인
|날짜|내용|
|------|---|
|23.10.30|- 공식문서 등 각자 공부|
|23.10.31|- JSON 데이터 모델 구현(Exposition, Item) <br> - step1 1차 PR|
|23.11.01|- 코드 리팩토링(네이밍 수정)|
|23.11.02|- 스토리보드 UI 구현 <br> - JSON 데이터 디코딩 <br> - tableView, cell 구현(modern cell configuration) <br> - 화면 전환 구현(스토리보드 segue), 데이터 전달(prepare) <br> - step2 2차 PR|
|23.11.03|- 코드 리팩토링(네이밍 수정, 네임스페이스 등) <br> - 화면 전환시 다음 뷰컨트롤러의 메서드를 활용하여 데이터 전달로 변경|


## 👀 시각화 구조


## 🔥 트러블 슈팅
1. TableView를 이용한 ViewController에서 List를 각각 눌렀을때 다음화면의 ViewController로 넘어가서 각각의 List의 데이터를 어떻게 받아와야 할지에 대한 고민을 했었습니다. 
    - 스토리보드에 segue를 이용해 다음화면으로 넘어가게 구현해서 prepare메서드를 통해 tableView의 row를 선택해서 각각의 row에 맞게 데이터를 넘겨받을 수 있게 구현을 해줬습니다.

~~~swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController = segue.destination as? ExpositionItemDetailViewController else { return }
        
        guard let selectedIndex = tableView.indexPathForSelectedRow else { return }
        
        nextViewController.setUpExpositionItem(to: expositionItems[selectedIndex.row])
        
        tableView.deselectRow(at: selectedIndex, animated: false)
    }
~~~


2. prototype cell imageView 크기 문제
    - custom cell이 아닌 기본 prototype cell을 활용하여 table view를 구성하고자 하였습니다. 하지만 imageView에 이미지를 넣었을 때 이미지 크기에 따라 imageView 또한 크기가 제각각인 문제가 발생하였습니다. 또한 imageView 크기를 제한해보았으나 alignment가 제각각이었습니다.
    - [modern cell configuration](https://developer.apple.com/videos/play/wwdc2020/10027/)을 활용하여 해당 문제를 해결하였습니다.
    - 수정 전
    ![](https://hackmd.io/_uploads/rkogVmGX6.png)

    ~~~swift
    cell.imageView?.image = UIimage(named: item.imageName)
    ~~~
    - 수정 후
    ![](https://hackmd.io/_uploads/Ska-NQMXa.png)

    ~~~swift
    var content = cell.defaultContentConfiguration()

    content.image = UIImage(named: item.imageName)

    let imageSize = CGSize(width: 60, height: 60)
    content.imageProperties.maximumSize = imageSize
    content.imageProperties.reservedLayoutSize = imageSize

    cell.contentConfiguration = content
    ~~~

## 📚 참고 링크
[공식문서 prepare](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621490-prepare)   
[공식문서 UITableView](https://developer.apple.com/documentation/uikit/uitableview)   
[공식문서 JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)   
[공식문서 UIListContentConfiguration](https://developer.apple.com/documentation/uikit/uilistcontentconfiguration)
