# 만국박람회

>프로젝트 기간 2022-04-11 ~ 2022-04-22
>
>팀원 : [쿼카](https://github.com/Quokkaaa), [Tiana](https://github.com/Kim-TaeHyun-A) / 리뷰어 : [올라프](https://github.com/1Consumption)


## 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3.1-blue)]()

# 학습한 키워드
`Dedable` `orientation`

## PR 바로가기
[STEP 1 PR](https://github.com/yagom-academy/ios-exposition-universelle/pull/137)

[STEP 2 PR](https://github.com/yagom-academy/ios-exposition-universelle/pull/147)

[STEP 3 PR](https://github.com/yagom-academy/ios-exposition-universelle/pull/158)

# STEP1

<img src="https://i.imgur.com/dlBbe9t.png" width="600">

1.  encode할 필요가 없다고 판단되어 각 모델은 Decodable만 채택합니다.

2.  testcase에서 XCTAssertEqual() 메서드를 사용해서 타입이 json data를 잘 decode하는지 확인

```swift
extension ParisExpo: Equatable {
     public static func == (lhs: ParisExpo, rhs: ParisExpo) -> Bool {
         return lhs.title == rhs.title && lhs.description == rhs.description && lhs.duration == rhs.duration && lhs.visitors == rhs.visitors && lhs.location == rhs.location
     }
 }
```
Equatable은 테스트를 위한 코드에서만 필요합니다. 따하서, 테스트 파일에서 import한 타입의 기능을 확장하는 방식으로 구현했습니다.

3. 공식문서 예제에는 프로퍼티들이 var로 설정되어 있었으나 만국박람회 프로젝트에서는 수정할 필요가 없을 것 같아 let으로 선언했습니다.



# STEP2
1. 메서드로 기능분리
- Cell에 값을 넘겨줄때 메서드로 기능분리
```swift
[before]
        cell.titleLabel.text = koreanItems[indexPath.row].name
        cell.descriptionLabel.text = koreanItems[indexPath.row].shortDesciption
        cell.mainImageView.image = UIImage(named: koreanItems[indexPath.row].imageName)

[after]
    func assignKoreanItemValue(with item: KoreanHistoricalItem) {
         titleLabel.text = item.name
         descriptionLabel.text = item.shortDesciption
         mainImageView.image = UIImage(named: item.imageName)
     }

[호출]
  cell.assignKoreanItemValue(with: koreanItems[indexPath.row])
```

뷰 컨트롤러에서 cell 의 프로퍼티를 세팅하는 것이 아닌 메서드에서 값을 설정할 수 있도록 변경했습니다.

* 델리게이트 세팅을 위한 메서드
```swift
    private func configurateDelegateProperties() {
         koreanItemsTableView.delegate = self
         koreanItemsTableView.dataSource = self
     }
```

* 에러 알림창 띄우는 메서드
유저 친화적인 멘트 보이도록 수정했습니다.
```swift
private func showFailureAlert() {
         let alertController = UIAlertController(title: nil, message: "적절한 데이터를 불러올 수 없습니다.", preferredStyle: .alert)
         let confirmButton = UIAlertAction(title: "ok", style: .default)
         alertController.addAction(confirmButton)
         present(alertController, animated: true)
}
```


2. View역할에 대한 고민
VC내에서는 View에게 값을 전달만 할 수 있도록 역할 분리했습니다.
view의 역할은 모델에서 데이터를 가져와서 보여주는 것만 하고 사용자의 interaction만 진행합니다.

```swift
[Before]
    private func initializeParisExpoData() {
        guard let data = try? ParisExpo.decode(from: FileName.parisExpo) else {
            return
        }
        parisExpoData = data
    }
```
위 코드가 VC내에 있어서 Filename을 불러와서 값을 디코드 해주었는데 이는 모델에 역할이기에 리펙토링을 해주었습니다.

```swift
[After]
enum AssetData {
    static func assignParisExpo() throws -> ParisExpo {
        return try ParserManager<ParisExpo>.parse(fileName: FileName.parisExpo)
    }
    
    static func assignKoreanItems() throws -> [KoreanHistoricalItem] {
        return try ParserManager<[KoreanHistoricalItem]>.parse(fileName: FileName.items)
    }
}

extension ParisExpoViewController {
    private func initializeParisExpoData() {
        do {
            parisExpoData = try AssetData.assignParisExpo()
        } catch {
            showFailureAlert(message: AlertMessage.notFoundData)
        }
    }
}
```

3. 파일분리
Utils그룹 폴더 내 Error, Consant, Extension 그룹 폴더를 만들고 MVC, Application그룹 폴더 만들어 파일분리를 했습니다.

4. UITableViewCell을 반환하는 tableview메서드의 error처리

```swift
// viewDidLoad내에서 실행 => 한번만 실행해도 되기 떄문
tableView.register(UITableViewCell.self, forCellReuseIdentifier: "empty cell")
showFailureAlert()
```

5. 매직넘버를 enum으로 관리


6. 네이밍
	- upload라는 네이밍은 서버에 전달하는 느낌이라 비동기적 성격을 띄는 것 같아서 Configure같은 것으로 대체했습니다.

7. Storyboard VS code 택1
     * 스토리보드에서 구현한 뷰의 세팅을 두 곳(인스펙터와 코드)에서 모두 진행할 경우 다른 개발자가 설정된 속성값 확인이 번거로울 것 같아서 정적인 속성값 설정은 스토리보드에서 진행했습니다.


# STEP3
- autolayout 설정

- 모든 화면에 Dynamic Type 적용

- 모든 텍스트가 잘리거나 줄임표(...)처리가 되지않도록 함

- 메서드 단일 책임분리

# TROUBLE SHOOTING
- 세로고정이 되어야하는데 화면 세로고정이 안됬던 문제 해결

firstView -> secondView -> 가로화면 -> firstView = 화면이 세로고정이 바로 안됨

![](https://i.imgur.com/zNT47Bo.gif)

[Before]

```swift
if let _ = window?.rootViewController?.navigationController?.topViewController 
as? ParisExpoViewController
```

* debug biew hierarchy를 사용해보았습니다.

![](https://i.imgur.com/PXurCyT.png)
* UINavigationController의 top controller 주소를 확인했습니다.

![](https://i.imgur.com/vTbHaeS.png)
* 시뮬레이터에서 첫 화면이 나왔을 때, 첫 화면의 뷰 컨트롤러의 주소값이 navagiation controller의 top controller의 주소값과 같은 것을 디버깅으로 확인했습니다.

![](https://i.imgur.com/ajggAea.png)
* UINavigationController의 top controller 주소를 확인했습니다.

![](https://i.imgur.com/Gj6iQ50.png)
* 시뮬레이터에서 두번째 화면이 나왔을 때, 두번째의 뷰 컨트롤러의 주소값이 navagiation controller의 top controller의 주소값과 같은 것을 디버깅으로 확인했습니다.

![](https://i.imgur.com/FrYQjpg.png)
* debug memory graph를 확인해보면 rootView는 navigationController라는걸 확인할 수 있다.

* rootViewController가 navigationController인 것을 확인하고 타입 캐스팅을 통해 최상위에 접근합니다. 타입 캐스팅으로 첫번째 뷰 인지 확인했습니다.

```swift
[After]
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if let navigationController: UINavigationController = window?.rootViewController as? UINavigationController,
           let _ = navigationController.topViewController as? ParisExpoViewController
             {
            return .portrait
        }
        return .all
    }
```
* 위 코드에서는 젤 상단의 뷰 컨트롤러의 타입을 확인하고 지원하는 orientation을 설정합니다.

