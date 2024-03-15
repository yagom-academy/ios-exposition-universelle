## 🇰🇷만국 박람회🇰🇷

### 목차
[1. 소개](#1-소개)  
[2. 팀원](#2-팀원)  
[3. 타임라인](#3-타임라인)  
[4. 프로젝트 구조](#4-프로젝트-구조)  
[5. 실행 화면](#5-실행-화면)  
[6. 트러블슈팅](#6-트러블슈팅)  
[7. 참고 자료](#7-참고-자료)  

---
### 1. 소개
#### **🇰🇷만국 박람회🇰🇷**
- 분명 이름은 만국이지만 한국의 유산들만을 구경할 수 있는 어딘가 이상한 박람회 어플입니다📱.
- 화면을 스크롤하거나 선택하여 한국의 자랑스러운 유산들을 확인하실 수 있습니다!

### 2. 팀원
| <img src="https://avatars.githubusercontent.com/u/27756800?s=48&v=4" width="200"> |<img src = "https://avatars.githubusercontent.com/u/57698939?v=4" width="200">|
| :---: | :--: |
| Prism ([Github](https://github.com/PrismSpirit/)) | Diana([Github](https://github.com/Diana-yjh)) |

### 3. 타임라인
| 날짜 | 내용 |
| --- | --- |
| 24.03.04(월) ~ 02.05(화) | 파일 구조 정리 및 Model들 구현, 제공받은 ImageSet과 DataSet 프로젝트에 추가 |
| 24.03.06(수) ~ 03.08(금) | JSONDecoder를 이용해 JSON String을 파싱하고 Model로 변환<br>계층화된 정보의 흐름을 가지므로 화면 전환 방식으로 Navigation을 선택<br>UI 구성 및 구현한 Model을 이용해 각 View에 보여줌<br>- 엑스포 메인화면(ScrollView와 StackView 활용)<br>- 출품작 리스트(TableView 활용)<br>- 출품작 세부내용(ScrollView와 StackView 활용)  |
| 24.03.11(월) ~ 03.12(화) | 프로젝트 리팩토링<br>- 메서드 및 타입 네이밍 변경<br>- setupComponent 분리<br>UI 수정<br>- ExpositionView, EntryTableViewCell, EntryDetailView에 오토레이아웃을 적용<br>- Text Label에 Dynamic Type 설정 |
| 24.03.13(수) ~ 03.14(목) | 프로젝트 리팩토링<br>- 방문객 수 포맷설정<br>- cell의 구성요소들이 인스턴스 내부에서 설정되도록 변경 |
| 24.03.15(금) | UI 수정<br>- 첫 번째 화면 세로모드 고정<br>- Cell 이미지 크기 수정<br>프로젝트 리팩토링<br>- ViewController와 View 분리<br>- 코드 위치 및 들여쓰기 조정 |


### 4. 프로젝트 구조
#### Class Diagram
![img](<https://raw.githubusercontent.com/PrismSpirit/ios-exposition-universelle/ic_11_prism/Expo_ClassDiagram.png>)

### 5. 실행 화면
| 박람회 홈 화면 | 출품작 리스트 | 출품작 세부내용 |
| :---: | :---: | :---: |
| ![img](<https://raw.githubusercontent.com/PrismSpirit/ios-exposition-universelle/ic_11_prism/Screenshots/ExpoMain.gif>) | ![img](<https://raw.githubusercontent.com/PrismSpirit/ios-exposition-universelle/ic_11_prism/Screenshots/ExpoEntry.gif>) | ![img](<https://raw.githubusercontent.com/PrismSpirit/ios-exposition-universelle/ic_11_prism/Screenshots/ExpoEntryDetail.gif>) |

### 6. 트러블슈팅
#### 1) ❗️ EntryDetailViewController의 entryDetail 파라미터가 Optional인 문제
##### 📌 문제 상황
```swift
// EntriesTableViewController.swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let entryDetailData: EntryDetail = entryDTOs[indexPath.row].toModel()

    guard let entryDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "EntryDetailViewController") as? EntryDetailViewController else {
        return
    }

    entryDetailViewController.entryDetailData = entryDetailData

    tableView.deselectRow(at: indexPath, animated: true)
    self.navigationController?.pushViewController(entryDetailViewController, animated: true)
}
```
```swift
// EntryDetailViewController.swift
class EntryDetailViewController: UIViewController {
    ...

    var entryDetailData: EntryDetail?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let entryDetailData else { return }
        
        ...
        
    }
}
```
`EntryViewController`에서 `EntryDetailViewController`에 출품작 데이터를 넘겨주기 위해 필요한 `entryDetail` 파라미터가 Optional로 설정되어있는 문제가 있었습니다.
##### 🛠️ 해결 방법
```swift
// EntriesTableViewController.swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let entryDetailData: EntryDetail = entryDTOs[indexPath.row].toModel()

    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let entryDetailViewController = storyboard.instantiateViewController(identifier: "EntryDetailViewController") { creater in
        return EntryDetailViewController(coder: creater, entryDetailData: entryDetailData)
    }

    tableView.deselectRow(at: indexPath, animated: true)
    self.navigationController?.pushViewController(entryDetailViewController, animated: true)
}
```
```swift
// EntryDetailViewController.swift
class EntryDetailViewController: UIViewController {
    ...

    var entryDetailData: EntryDetail

    init?(coder: NSCoder, entryDetailData: EntryDetail) {
        self.entryDetailData = entryDetailData
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("Error occurs in required init")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        ...
    }
}
```
`EntryDetailViewController`의 `init`이 `entryDetail`을 받아 초기화하도록 한 후 `EntryViewController`에서 해당 인스턴스를 생성할 때 파라미터로 값을 전달하도록 수정하였습니다.

#### 2) ❗️ 설정에서 텍스트의 크기를 변경할 경우 앱에 바로 적용되지 않는 문제
##### 📌 문제 상황
앱 실행 시에는 시스템에서 설정한 텍스트 크기에 맞게 적용이 되지만 앱 실행 이후 설정에서 텍스트의 크기를 변경할 경우 자동적으로 반영되지 않는 문제가 있었습니다.
##### 🛠️ 해결 방법
`label` 인스턴스의 `adjustsFontForContentSizeCategory`를 `true`로 설정해 앱이 실행된 이후에 텍스트 크기를 변경하더라도 자동적으로 반영하도록 해주었습니다.

#### 3) ❗️ ViewController에서 방문객 수 포맷을 수정하는 문제
##### 📌 문제 상황
```swift
// ExpositionViewController.swift
class ExpositionViewController: UIViewController {
    ...
    
    private func updateComponents(exposition: Exposition) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

        self.visitorsNumberLabel.text = (numberFormatter.string(for: exposition.visitors) ?? "0") + " 명"
        
        ...
    }
}
```
`ViewController`에서 `NumberFormatter()`를 사용하여 View Contents 업데이트 시 방문객 수 포맷을 변경하여 적용하는 문제가 있었습니다.
##### 🛠️ 해결 방법
```swift
// NumberFormatter+.swift
extension NumberFormatter {
    func string(with number: Int) -> String {
        self.numberStyle = .decimal
        return (self.string(for: number) ?? "0") + "명"
    }
}
```
```swift
// ExpositionView.swift
class ExpositionView: UIView {
    ...
    
    func updateComponents(with exposition: Exposition) {
        ...
        
        self.visitorsLabel.text = NumberFormatter().string(with: exposition.visitors)
    }
}
```
`NumberFormatter`의 Extension을 활용하여 원하는 포맷으로 변경할 수 있도록 구현하였습니다.

### 7. 참고 자료
📍[UITableView](<https://developer.apple.com/documentation/uikit/uitableview>)  
📍[UITableViewDataSource](<https://developer.apple.com/documentation/uikit/uitableviewdatasource>)  
📍[UITableViewCell](<https://developer.apple.com/documentation/uikit/uitableviewcell>)  
📍[Configuring the cells for your table](<https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table>)  
📍[JSONDecoder](<https://developer.apple.com/documentation/foundation/jsondecoder>)  
📍[NSDataAsset](<https://developer.apple.com/documentation/uikit/nsdataasset>)  
📍[UIScrollView AutoLayout 잡기](<https://baechukim.tistory.com/4>)  
📍[Anatomy of a TableView(Controller) Architecture](<https://matteogobbi.github.io/blog/2015/03/21/anatomy-of-a-tableview-controller-architecture/>)
📍[Scaling Fonts Automatically](<https://developer.apple.com/documentation/uikit/uifont/scaling_fonts_automatically/>) 

