# iOS 커리어 스타터 캠프

---

# 프로젝트 5 - 만국박람회 README

## (21.04.05 ~ 21.04.16)

## 목차

1. [기능](#기능)
2. [설계 & 구현](#설계-&-구현)
3. [Trouble Shooting](Trouble-Shooting)
4. [학습 내용](#학습-내용)



## 기능

- [첫 화면] 파리 만국박람회에 대한 포스터와 상세정보 구현
- [두 번째 화면] 출품작 목록 및 간단한 설명 구현
- [세 번째 화면] 출품작 상세화면 구현
- 오토레이아웃 적용
  - 첫 화면은 세로로 고정
  - 첫 화면 제외 모든 화면 가로 해상도 대응
  - Dynamic Type 적용
  - 모든 아이폰 크기에 맞도록 구현



#### 모든 아이폰 화면에 대한 가로 해상도 대응

![expo_12pro_rotation](https://user-images.githubusercontent.com/69072471/115560977-1306de00-a2f0-11eb-86d2-ecbe3858b82b.gif) ![expo_SE_rotation](https://user-images.githubusercontent.com/69072471/115561430-8577be00-a2f0-11eb-9672-082c61942001.gif)



#### Dynamic Type 적용

![expo_12pro_accessibility](https://user-images.githubusercontent.com/69072471/115561364-72fd8480-a2f0-11eb-859a-957e734f384f.gif) ![expo_SE_accessibility](https://user-images.githubusercontent.com/69072471/115562192-37af8580-a2f1-11eb-8d1e-9c4356729315.gif)



## 설계 & 구현

#### UML

![Screen Shot 2021-04-21 at 10 07 29 PM](https://user-images.githubusercontent.com/69072471/115558711-f79ad380-a2ed-11eb-85bf-8eba6b61e19f.png)



#### ViewController 구성

Navigation Controller → MainViewController → ItemTableViewController → ItemTableViewCell → ItemViewController





#### JSON Data Model - MVC

```swift
// 만국박람회 데이터 모델
struct Expo {
  var title: String
  var visitors: Int
  var location: String
  var duration: String
  var description: String

  private enum CodingKeys: CodingKey {
    case title, visitors, location, duration, description
  }
}
// JSON Data를 파싱하지 못할 경우 app이 crash되는 것을 방지
extension Expo: Decodable {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    title = (try? container.decode(String.self, forKey: .title)) ?? ""
    visitors = (try? container.decode(Int.self, forKey: .visitors)) ?? 0
    location = (try? container.decode(String.self, forKey: .location)) ?? ""
    duration = (try? container.decode(String.self, forKey: .duration)) ?? ""
    description = (try? container.decode(String.self, forKey: .description)) ?? ""
  }
}
```

```swift
// 출품작 데이터 모델
struct Exhibit {
  var name: String
  var imageName: String
  var shortDescription: String
  var description: String

  private enum CodingKeys: String, CodingKey {
    case imageName = "image_name"
    case name
    case shortDescription = "short_desc"
    case description = "desc"
  }
}
// JSON Data를 파싱하지 못할 경우 app이 crash되는 것을 방지
extension Exhibit: Decodable {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    imageName = (try? container.decode(String.self, forKey: .imageName)) ?? ""
    name = (try? container.decode(String.self, forKey: .name)) ?? ""
    description = (try? container.decode(String.self, forKey: .description)) ?? ""
    shortDescription = (try? container.decode(String.self, forKey: .shortDescription)) ?? ""
  }
}

```

```swift
// 메인뷰에서 사용자가 실행하는 이벤트를 처리하는 컨트롤러
class MainViewController: UIViewController {
  // Expo 구체 생성
  var expo: Expo?
  .
  .
  .
  private func setupInitialScreenView() throws {
    do {
      try parseExpoData()
      updateUI()
      setAttributeOfLabel()

    } catch {
      throw DataError.InvalidAccess
    	}
    }
  // JSON데이터를 파싱하는 메서드
  private func parseExpoData() throws {
    guard let asset = NSDataAsset.init(name: "exposition_universelle_1900") else {
      return
    }

    do {
      expo = try JSONDecoder().decode(Expo.self, from: asset.data)
    } catch {
      throw DataError.InvalidAccess
    	}
    }
  // 파싱된 JSON데이터를 View로 전달하는 메서드
  private func updateUI() {
    guard let expoData = expo else { return }
    expoTitle.text = expoData.title
    expoTitle.text = expoData.title.replacingOccurrences(of: "(", with: "\n(")
    expoLocation.text = "개최지 : " + expoData.location
    expoVisitors.text = "방문객 : " + formatNumberStyle(expoData.visitors) + " 명"
    expoDuration.text = "개최 기간 :" + expoData.duration
    expoDescription.text = expoData.description
  }

}
```

```swift
class MainViewController: UIViewController {
  // 사용자에게 보여질 화면 구성(View)
  @IBOutlet weak var expoTitle: UILabel!
  @IBOutlet weak var expoVisitors: UILabel!
  @IBOutlet weak var expoLocation: UILabel!
  @IBOutlet weak var expoDuration: UILabel!
  @IBOutlet weak var expoDescription: UILabel!
  @IBOutlet weak var screenTransitionToTableViewButton: UIButton!
}
```



JSON 데이터를 담는 구조체(model를 만든 뒤 ViewController가 해당 데이터를 활용하여 사용자 화면에으로 전달하는MVC 패턴을 채택하여 앱을 구현하였습니다.



####ViewController 간 Data 주고 받기 - Segue

[관련 학습 내용 - 1](https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/UsingSegues.html#//apple_ref/doc/uid/TP40007457-CH15-SW1) [관련 학습 내용 - 2](https://developer.apple.com/documentation/uikit/uitableviewcontroller)

```swift
class ItemTableViewController: UITableViewController {
    private var exhibits: [Exhibit] = []
    private let cellIdentifier: String = "itemTableCell"
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // 데이터를 전달할 뷰컨트롤러가 존재하는지 확인한다.
    guard let nextViewController: ItemViewController = segue.destination as? ItemViewController else { return }
    guard let indexPathForSelectedRow = tableView.indexPathForSelectedRow else { return }
    // 대상 뷰 컨트롤러가 존재하면 데이터를 전달
    nextViewController.exhibit = exhibits[safe: indexPathForSelectedRow.row]
    }
}
}
```

```swift
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // 데이터를 전달할 뷰컨트롤러가 존재하는지 확인한다.
    guard let nextViewController: ItemViewController = segue.destination as? ItemViewController else { return }
    guard let indexPathForSelectedRow = tableView.indexPathForSelectedRow else { return }
    // 대상 뷰 컨트롤러가 존재하면 데이터를 전달
    nextViewController.exhibit = exhibits[safe: indexPathForSelectedRow.row]
    }
}
```



## Trouble Shooting

#### [TroubleShooting 1]

**Cell의 역할에 대한 오해**

```swift
class ItemTableViewController: UITableViewController {
   private var exhibits: [Exhibit] = []
   private let cellIdentifier: String = "itemTableCell"
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let nextViewController: ItemViewController = segue.destination as? ItemViewController else { return }

    guard let cell: ItemTableViewCell = sender as? ItemTableViewCell else { return }

    nextViewController.itemTitleToSet = cell.itemName.text
    nextViewController.descriptionToSet = cell.itemDescription
    nextViewController.imageToSet = cell.itemImageName
  }
}
```

기존에 생각했던 방식은 cell에 다음페이지에 대한 정보를 담고 셀을 눌렀을 때 해당 정보를 보내줘야 한다고 생각했었다. 그런데 cell은 UIView를 상속받는다. 즉 데이터를 담는 역할을 하는 것이 아니라 유저에게 테이블 목록의 각각 행을 보여주는 역할을 하는 것이다. 위와 같은 방법으로 접근하게 되면 MVC모델 패턴에 부합하지 않기에 아래와 같이 수정해 보았습니다.

```swift
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   guard let nextViewController: ItemViewController = segue.destination as? ItemViewController else { return }
   guard let cell: ItemTableViewCell = sender as? ItemTableViewCell else { return }
   // 모델로부터 데이터 전달
   nextViewController.items = items[cell.index!]
   nextViewController.itemTitleToSet = data.imageName
   nextViewController.descriptionToSet = data.description
   nextViewController.imageToSet = data.imageName
 }
```

그런데 위 방법 또한 옵셔널 강제 해제를 통해 데이터에 접근하는 방법이고 이 방법 또한 cell을 통해 모델에 접근하는 방법이기에 최선의 방법이 아니라 생각되었습니다.



```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {     
  guard let nextViewController: ItemViewController = segue.destination as? ItemViewController else { return }
  guard let indexPathForSelectedRow = tableView.indexPathForSelectedRow else { return }
  nextViewController.exhibit = exhibits[safe: indexPathForSelectedRow.row]
}
```

각 테이블뷰의 행에 대한 indexPath를 지역 상수로 생성한 뒤 이것을 사용하여 exhibit구체를 통해 exhibit모델을 직접 접근하도록 수정을 하였습니다.



#### [TroubleShooting 2]

**배열 접근에 대한 고찰**

```swift
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        defer { items.removeLast() }
        
        return items.count
    }
```

indexPath의 갯수와 item의 갯수가 항상 일치하는 것이 아니다. 아래 상황 처럼 테이블뷰가 데이터소스에게 row의 갯수를 하나 하나 만들아달라 부탁할 때 만약 아이템 중 하나가 없어지거나 하는 상황이면 어떻게 대처해야 하는가? 좀 더 크게 보면 배열에 대해 직접 접근하는 할 때 인증되지 않은 서브스크립트로 접근하는거에 대한 문제에 대해 고민 해 보았습니다.

배열에 5개의 원소가 있다고 가정할 때 6번째 원소로 접근을 하면 index range문제가 생기고 앱이 crash되는 불상사를 겪을 수 있습니다. 배열의 6번째 원소를 접근하기 전에 이 배열이 6개가 있다는 것을 먼저 검증하고 접근하면 문제가 없을 것이고 이에 대한 회피책을 준비해야 한다는 피드백을 받았습니다. 이 문제를 해결하기 위해 배열을 확장하여 안전하게 배열을 조회할 수 있는 방법을 찾았습니다.

[관련 학습 내용](http://minsone.github.io/programming/check-index-of-array-in-swift)

```swift
extension Array {
  subscript (safe index: Int) -> Element? {
    return indices ~= index ? self[index] : nil
  }
}
```

위와 같이 배열을 확장하면 만약 배열의 인덱스값을 벗어난 값에 접근하려 할 때 app을 crash하기 보다는 nil값을 반환하도록 설정할 수 있습니다.




```swift
  guard let exhibit = exhibits[safe: indexPath.row] else { return UITableViewCell() }
    cell.itemName.text = exhibit.name
    cell.itemShortDescription.text = exhibit.shortDescription
    cell.itemImage.image = UIImage(named: exhibit.imageName)
    return cell
	}
```

이 프로젝트에서 학습한 것을 가지고 exhibit 배열의 값을 안전하게 조회할 수 있었습니다.



## 학습 내용



-  Codable을 채택하여 JSON 데이터와 매칭할 모델 타입 구현
- 스네이크 케이스 또는 축약형인 JSON 키 값을 스위프트의 네이밍에 맞게 변환
- 테이블뷰의 Delegate와 Data Source의 역할의 이해
- 테이블뷰의 셀의 재사용 이해
- 테이블뷰의 전반적인 동작 방식의 이해
- 주어진 JSON 데이터를 파싱하여 테이블뷰에 표시
- 내비게이션 컨트롤러를 활용한 화면 전환
- 뷰 컨트롤러 사이의 데이터 전달
- 오토 레이아웃을 적용하여 다양한 기기에 대응
- Word Wrapping / Line Wrapping / Line Break 방식의 이해
- 접근성(Accessibility)의 개념과 필요성 이해
- Dynamic Types를 통해 텍스트 접근성 향상