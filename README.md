# 🇰🇷🇫🇷 만국박람회 🇺🇸🇦🇹

## 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [트러블 슈팅](#-트러블-슈팅)
5. [핵심 경험](#-프로젝트-수행-중-핵심-경험)
6. [참고 링크](#-참고-링크)

## 1. 소개
- 만국박람회 중 한국의 출품작에 대해 알아볼 수 있는 앱입니다.  

<br>

## 2. 팀원
|Ayaan | bella |
| --- | --- |
|<img src= "https://i.imgur.com/Unq1bdd.png" width ="155"/>| <img src=https://user-images.githubusercontent.com/99257965/190572701-5e51fd28-455f-4c3b-924d-0baade5011a3.png width="155" height="155" > |
| @oneStar92 | @hyhy0429 |

<br>

## 3. 타임라인
**[STEP-1]**
- 221018
    - JSON 이해와 활용
    - Asset에 이미지와 JSON 데이터 추가 후, 해당 데이터를 사용하기 위한 `ExpositionUniverselle` 타입과 `ExpositionUniverselleItem` 타입 추가
- 221019
    - `ExpositionUniverselleItem` 타입 역활에 맞게 리팩토링
  
**[STEP-2]**
- 221020
    - Main(첫번 째) 화면 UI 구성요소 구현
    - MainVC 내부 필요 프로퍼티와 메서드 구현
    - ExpositionItems(두번 째) 화면 UI 구성요소 구현
    - ExpositionItemsVC 내부 필요 프로퍼티와 메서드 구현
    - ExpositionItemDetail(세번 째) 화면 UI 구성요소 구현
- 221021
    - ExpositionItemDetailVC 내부 필요 프로퍼티와 메서드 구현
    - 각 화면에 맞는 NavigationBar 상태 구현


<br>

## 4. 트러블 슈팅

#### DTO Type의 프로퍼티 접근 제어자
- DTO의 프로퍼티의 접근 제어자를 `private(set)`과 `let` 두가지 중에서 무엇을 사용해야 할지 고민했습니다.
- `private(set)`의 경우 내부에서는 변경이 가능하나 `let`의 경우 이니셜라이징 이후 내/외부에서 변경이 불가능하기 때문에 DTO Type의 프로퍼티 접근 제어자는 `let`으로 선언하는 것이 더 올바르다고 생각해 `let`을 사용하였습니다.

#### Main 화면 구성시, TextView 사용 vs label 사용
- 첫번째 화면인 Main 화면에서, ExpositionUniverselle DTO의 장문의 text인 description을 구현하기 위한 UI 구성요소를 구성함에 있어서 `TextView`와 `Label` 사용에 대해서 고민했습니다.
 `Apple HIG` 의 각 문서와 [Displaying Text Content in iOS](https://developer.apple.com/library/archive/documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/UsingTextClasses/UsingTextClasses.html)를 참고하였습니다. 크게 `label`은 소량의 text를 보여주며 편집할 수 없는 점과, `TextView` 는 다량의 text를 보여주며 편집와 선택이 가능하다는 점이 있었습니다. 
저희는 다량의 text를 보여주는 것을 우선순위로 생각하여 `TextView` 를 선택하였으며 편집기능은 선택을 해제하였습니다. 


#### Segue를 통한 화면 전환시 데이터 전송.
- Segue를 이용하여 스토리보드에서 한국의 출품작을 보여주는 TableView의 Cell을 클릭하면, 클릭된 Cell의 해당하는 출품작의 상세 정보를 보여주는 View로 화면전환이 되게 구현하였습니다. `prepare()`메서드를 오버라이드하여 데이터를 전송할때, `sender`로 전달되는 상세 정보를 나타내는 데이터가 cell에는 없기 때문에 상세 정보를 보여주는 View에 올바른 데이터를 전송하지 못하는 문제가 발생하였습니다.
- TableView Delegate의 메서드인 `tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)`를 사용해 상세 정보를 보고싶은 Cell을 선택하면 선택된 셀의 row에 해당하는 Item을 `performSegue`메서드의 `sender`로 전달해 주어서 해당 문제를 해결하였습니다.
```swift=
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.performSegue(withIdentifier: "ShowItemDetail", sender: expositionItems[indexPath.row])
}

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let nextViewController: ExpositionItemDetailViewController = segue.destination as? ExpositionItemDetailViewController,
          let item: ExpositionUniverselleItem = sender as? ExpositionUniverselleItem else {
        return
    }
    
    nextViewController.item = item
}
```
<br>

#### 메인페이지 이동버튼
|Before|After|
|:---:|:---:|
|<img src="https://i.imgur.com/op4N0rw.gif" width="200" height="400"/>|<img src="https://i.imgur.com/wHQ3Eqn.gif" width="200" height="400"/>|

```swift
showKoreanItemListButton.titleLabel?.text = "한국의 출품작 보러가기"
``` 
- MainVC 내부에서 다음 화면으로 이동하기 위해 해당 코드를 이용해 원하는 text를 구현을 하였으나, 버튼을 클릭하면 버튼을 클릭한 후와 화면 이동 후 다시 Main 화면으로 되돌아왔을 때 지정한 text가 아닌 버튼이 가지고 있는 원래의 text인 "Button" 이 보여지는 문제가 있었습니다.

```swift
showKoreanItemListButton.setTitle("한국의 출품작 보러가기", for: .normal)
```
- Button의 State가 `.nomal`일때의 Title이 "Button"이여서 발생하는 것으로 파악했으며, Button의 `titleLabel`의 `text`를 직접 바꾸는 방식이 아닌 `setTitle(_,for:)`메서드를 사용하여 버튼의 State에 따른 Title을 지정해줘서 해결하였습니다.

<br>

## 5. 프로젝트 수행 중 핵심 경험

- JSON 이해와 활용
- ScrollVeiw의 이해와 활용
- tableView와 Cell의 이해와 활용
- 화면 간 데이터 전달 
- lldb 활용

<br>

## 6. 참고 링크
- Apple Developer 
    - [UITableView](https://developer.apple.com/documentation/uikit/uitableview)
    - [Table views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)
    - [Filling a table with data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)
    - [UIControl.State](https://developer.apple.com/documentation/uikit/uicontrol/state)
    - [Configuring the cells for your table](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table)
    - [JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
        - [Using JSON with Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)
        - [Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
    - [HIG - Text views](https://developer.apple.com/design/human-interface-guidelines/components/content/text-views)
    - [HIG - View](https://developer.apple.com/design/human-interface-guidelines/components/layout-and-organization/labels)
    - [Displaying Text Content in iOS](https://developer.apple.com/library/archive/documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/UsingTextClasses/UsingTextClasses.html)

---
[🔝 맨 위로 이동하기](#만국박람회)
