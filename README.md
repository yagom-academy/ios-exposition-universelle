# 🎊 만국박람회
1900 만국박람회 설명과 출품작 목록 그리고 각 출품작의 상세 설명을 확인할 수 있는 어플

---
## 🔎 목차
- [팀원](#-팀원)
- [타임라인](#-타임라인)
- [시각화 구조](#-시각화-구조)
- [실행 화면](#-실행-화면)
- [트러블 슈팅](#-트러블-슈팅)
- [참고 링크](#-참고-링크)

---
## 👥 팀원
|쥬봉이🐱|미르🐉|
|---|---|
|<img src="https://avatars.githubusercontent.com/u/126065608?v=4" width="200" height="200">|<img src="https://github.com/mireu79/ios-exposition-universelle/assets/125941932/45dff9f5-f1a9-4398-82c9-5764daf9083d" width="200" height="200">|
|[쥬봉 GitHub](https://github.com/jyubong)|[미르 GitHub](https://github.com/mireu79)|


## 📅 타임라인
|날짜|내용|
|------|---|
|23.10.30|- 공식문서 등 각자 공부|
|23.10.31|- JSON 데이터 모델 구현(Exposition, Item) <br> - step1 1차 PR|
|23.11.01|- 코드 리팩토링(네이밍 수정)|
|23.11.02|- 스토리보드 UI 구현 <br> - JSON 데이터 디코딩 <br> - tableView, cell 구현(modern cell configuration) <br> - 화면 전환 구현(스토리보드 segue), 데이터 전달(prepare) <br> - step2 2차 PR|
|23.11.03|- 코드 리팩토링(네이밍 수정, 네임스페이스 등) <br> - 화면 전환시 다음 뷰컨트롤러의 메서드를 활용하여 데이터 전달로 변경|
|23.11.06|- Accessibility Inspector (WWDC 2019) 보기 <br> - Writing Great Accessibility Labels (WWDC 2019) 보기 <br> - Dynmiac Type, Accessibility 개념과 필요성에 대해 공부 |
|23.11.07|- 오토레이아웃 적용(스토리보드) <br> - Dynmic Type 적용(스토리보드)(list cell 코드) |
|23.11.08|- error 구현 및 alert창으로 사용자에게 보이게 error 처리 <br> - back button accessibilitylabel 설정 <br> - step3 3차 PR|
|23.11.10|- 코드 리팩토링(Error 메세지, 알럿창 함수 네이밍 수정) <br> - image에 Dynmic Type 적용 <br> - README 작성 |


## 👀 시각화 구조
### UML
![Expo1900UML](https://hackmd.io/_uploads/ByjnUUo7p.png)


## 💻 실행 화면
| 첫번째 화면 | 두번째, 세번째 화면 | error 발생 |
| -------- | -------- | -------- |
| <img src="https://hackmd.io/_uploads/BkqjwSjmT.gif" width=296> | <img src="https://hackmd.io/_uploads/BkFnvBoma.gif" width=296> | ![](https://hackmd.io/_uploads/ByzhYriQT.gif) |

| 첫번째 화면 회전 | 두번째 화면 회전 |
| -------- | -------- |
| ![image](https://hackmd.io/_uploads/Hyf-KSimT.png)| ![](https://hackmd.io/_uploads/H1H5_roQa.gif) |

| 첫번째 화면 더 큰 글씨 | 두번째 화면 더 큰 글씨 | 세번째 화면 더 큰 글씨 |
| -------- | -------- | -------- |
| ![](https://hackmd.io/_uploads/HyJ28Hi7T.gif) | ![](https://hackmd.io/_uploads/SJBkvSjXp.gif) |![](https://hackmd.io/_uploads/rJ_cUSoXT.gif)|


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

    let imageWidth = 60
    let imageSize = CGSize(width: imageWidth, height: imageWidth)
    content.image = UIImage(named: item.imageName)
    content.imageProperties.maximumSize = imageSize
    content.imageProperties.reservedLayoutSize = imageSize

    cell.contentConfiguration = content
    ~~~
    
3. 이미지에 Dynmic Type 적용문제
    - Label에 Dynmic Type 적용을 하여 글씨가 커질수 있도록 하였지만, 이미지는 크기가 멈춰있어서 어색한 부분이 있어 이미지에도 스토리보드를 통해 `Adjust image Size` 적용시켜 수정하였습니다. 다만, Detail화면에서 cell마다 이미지가 따로 적용되어 Constant를 `>=`를 통하여 사이즈가 일정이상 커지면 이미지가 커질 수 있도록 적용하였습니다.
    ![스크린샷 2023-11-10 오후 3.09.23(2)](https://hackmd.io/_uploads/SJtLYSomT.png)

    -  다만, 세로가 긴 이미지의 경우 4:3비율을 고정값으로 줘서 이미지가 더이상 커지지 않는 이슈가 발생하여 아래와 같이 코드로 크기를 조정하는 방향으로 바꾸었습니다.
    -  UIImage를 extension하여 원하는 높이를 설정하면 `UIGraphicsImageRenderer(size: )를 이용`하여 image 비율에 맞는 새로운 image를 생성하는 메서드를 만들어 이를 image view에 넣어주었습니다.
    ``` swift
    extension UIImage {
        func resized(height: CGFloat) -> UIImage {
            let ratio = self.size.width / self.size.height
            let newWidth = height * ratio
            let size = CGSize(width: newWidth, height: height)
        
            let renderer = UIGraphicsImageRenderer(size: size)
            let image = renderer.image { _ in
                draw(in: CGRect(origin: .zero, size: size))
            }
        
            return image
        }
    }
    ```


## 📚 참고 링크
[공식문서 prepare](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621490-prepare)   
[공식문서 UITableView](https://developer.apple.com/documentation/uikit/uitableview)   
[공식문서 JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)   
[공식문서 UIListContentConfiguration](https://developer.apple.com/documentation/uikit/uilistcontentconfiguration)   
[공식문서 supportedInterfaceOrientationsFor](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1623107-application)   
[공식문서 H.I.G](https://developer.apple.com/design/human-interface-guidelines/typography)   
[공식문서 UIGraphicsImageRenderer](https://developer.apple.com/documentation/uikit/uigraphicsimagerenderer)   
[공식문서 indexPathForSelectedRow](https://developer.apple.com/documentation/uikit/uitableview/1615000-indexpathforselectedrow)   
[WWDC20 Modern cell configuration](https://developer.apple.com/videos/play/wwdc2020/10027/)   

---
### 팀 회고
<details>
<summary>우리팀이 잘한 점</summary>

- 의견조합이 잘이뤄졌고, 다양한 방법으로 시도하여 구현하려고 했다.
</details>

<details>
<summary>우리팀이 개선할 점</summary>

- 코드 구현에 있어 자신있게 자신의 생각을 말할 수 있도록 해야겠다고 생각했다.
- 오토레이아웃을 더 공부해야겠다.
</details>

<details>
<summary>서로에게 피드백</summary>

- 쥬봉이 : 의견을 나누는데 있어 미르가 의견을 잘 들어주고 고민하는 부분에 있어서 결단을 내려주어 프로젝트가 원활히 진행될 수 있었다.
- 미르 : 코드구현에 있어 제가 처음본 개념들을 쥬봉이가 숙지를 잘하고 있어 저를 이해시켜주어 공부가 많이 됐다.
</details>
