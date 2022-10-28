# 🇰🇷🇫🇷 만국박람회 🇺🇸🇦🇹

## 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [UML](#-UML)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [핵심 경험](#-프로젝트-수행-중-핵심-경험)
8. [참고 링크](#-참고-링크)

## 1. 소개
- 1900년에 프랑스 파리에서 열린 만국박람회에 대한 소개와, 한국의 출품작에 대해 알아볼 수 있는 앱입니다.  

<br>

## 2. 팀원
|Ayaan | bella |
| --- | --- |
|<img src= "https://i.imgur.com/Unq1bdd.png" width ="155"/>| <img src=https://user-images.githubusercontent.com/99257965/190572701-5e51fd28-455f-4c3b-924d-0baade5011a3.png width="155" height="155" > |
| [@oneStar92](https://github.com/oneStar92) | [@hyhy0429](https://github.com/hyhy0429) |

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
    - `ExpositionItems` 두번 째 화면 UI 구성요소 구현
    - `ExpositionItemsVC` 내부 필요 프로퍼티와 메서드 구현
    - `ExpositionItemDetail` 세번 째 화면 UI 구성요소 구현
- 221021
    - `ExpositionItemDetailVC` 내부 필요 프로퍼티와 메서드 구현
    - 각 화면에 맞는 `NavigationBar` 상태 구현
    - `NameSpace` 구현
    - `JSONProcessor` 구현
    - MainVC 및 Detail 내부 TextView 상세 설정
- 221025
    - VC `final`, `super` 키워드 사용
    - `JSONProcessor`의 기능분리와 네이밍 수정
    - JASONParser 내부 fetchDataAsset 메서드 추가
    - 불필요한 extension을 MARK 주석으로 변경
    - MainVC와 ExpositionItemDetailVC 내부의 TextView를 Label로 변경

**[STEP-3]**
- 221026
    - MainView 내부 오토레이아웃 수정
    - `ExpositionItemCell` 구현
    - Dynamic Type을 위한 UILabel extension 구현
- 221027
    - Main 화면 요구사항에 맞는 Label 스타일 구현
    - MainVC `visitorLabel`을 위한 `DecimalNumberFormatter` 파일 생성과 타입 구현
    - Label의 `Dynamic Type` 해제되는 버그 수정
    - Main 화면 세로 고정 구현
    - 모든 VC에서 override를 통한 `supportedInterfaceOrientations` 프로퍼티 구현
- 221028
    - MVC 역할 분배를 위한 `MainViewManager` 타입 구현

<br>

## 4. UML
<img src="https://i.imgur.com/IFXc1gS.jpg" width="800" height="500"/>

## 5. 실행화면

|실행 화면|다이나믹 타입|
|:---:|:---:|
|<img src="https://i.imgur.com/77SkGR0.gif" width="400" height="400"/>|<img src="https://i.imgur.com/gb03T08.gif" width="200" height="400"/>|


## 6. 트러블 슈팅

#### DTO Type의 프로퍼티 접근 제어자
- DTO의 프로퍼티의 접근 제어자를 `private(set)`과 `let` 두가지 중에서 무엇을 사용해야 할지 고민했습니다.
- `private(set)`의 경우 내부에서는 변경이 가능하나 `let`의 경우 이니셜라이징 이후 내/외부에서 변경이 불가능하기 때문에 DTO Type의 프로퍼티 접근 제어자는 `let`으로 선언하는 것이 더 올바르다고 생각해 `let`을 사용하였습니다.

#### Main 화면 구성시, TextView 사용 vs label 사용
- 첫번째 화면인 Main 화면에서, ExpositionUniverselle DTO의 장문의 text인 description을 구현하기 위한 UI 구성요소를 구성함에 있어서 `TextView`와 `Label` 사용에 대해서 고민했습니다.
 `Apple HIG` 의 각 문서와 [Displaying Text Content in iOS](https://developer.apple.com/library/archive/documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/UsingTextClasses/UsingTextClasses.html)를 참고하였습니다. 크게 `label`은 소량의 text를 보여주며 편집할 수 없는 점과, `TextView` 는 다량의 text를 보여주며 편집와 선택이 가능하다는 점이 있었습니다. 
그럼에도 불구하고, 저희는 다량의 text를 보여주는 것을 우선순위로 생각하여 `TextView` 를 선택하여 구현하였다가, 현재 프로젝트 상황과 달리 `editable` 기능을 필요로 할 때에 `TextView`를 사용해야 함에 대해 알게되었고, `label`로 변경하게 되었습니다. 

#### Segue를 통한 화면 전환시 데이터 전송.
- Segue를 이용하여 스토리보드에서 한국의 출품작을 보여주는 TableView의 Cell을 클릭하면, 클릭된 Cell의 해당하는 출품작의 상세 정보를 보여주는 View로 화면전환이 되게 구현하였습니다. `prepare()`메서드를 오버라이드하여 데이터를 전송할때, `sender`로 전달되는 상세 정보를 나타내는 데이터가 cell에는 없기 때문에 상세 정보를 보여주는 View에 올바른 데이터를 전송하지 못하는 문제가 발생하였습니다.
- TableView Delegate의 메서드인 `tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)`를 사용해 상세 정보를 보고싶은 Cell을 선택하면 선택된 셀의 row에 해당하는 Item을 `performSegue`메서드의 `sender`로 전달해 주어서 해당 문제를 해결하였습니다.
```swift
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

#### Label 설정과 Dynamic Type
- MainView의 Label의 font, textAlignment, numberOfLines, lineBreakMode 등의 Label을 설정을 할 때, 코드를 중복해서 작성하게 되었습니다.
- 중복된 코드를 줄이고자 Inheritance 및 Extention을 활용하여 중복된 코드를 줄였습니다.

#### Main VC의 Label의 서로다른 Font 적용
- `range`의 범위를 어떻게 지정해주어야 할지에 대한 고민이 있었고, String Type의 메서드인 `prefix`를 사용해서 지정해 줄 수 있었습니다.
- 기본적인 Font를 Dynamic Type으로 설정한 후, 원하는 범위의 attributedText를 지정해줬습니다. 하지만 attributedText가 지정된 범위 이외의 Text는 Dynamic Type이 아닌 처음 설정된 Font로 고정되는 오류가 발생했습니다.
- 전체 범위의 attributedText를 지정해 준 후 원하는 범위의 attributedText를 추가적으로 지정해 줘서 이를 해결하였습니다.

#### Title Label 줄바꿈
- Title Label을 줄바꿈하기 위해서 정규식 사용을 고민 하였지만, 너무 무거운 내용이라고 생각되어 다른 방법을 고민했습니다.
- 고민 끝에, Title Label의 text에서 줄바꿈 하고자 하는 부분인 '('의 index를 구한 후, `inset(_, at:)`메서드를 이용해서 원하는 index 부분에 '\n'를 insert 했습니다.

#### 각 화면의 고유 방향 지정
- AppDelegate에서 화면 방향 고정하는 방법도 있는 것을 알았지만, 아직 AppDelegate에 대한 공부가 부족하다고 생각했습니다. 그래서 View Controller의 `supportedInterfaceOrientations` 프로퍼티를 이용해 화면 방향을 고정하도록 구현하였습니다.

#### View를 관리하는 객체 구현
- 리뷰어와 토의한 후 VC는 View에 가깝고 데이터를 처리하고 가공하는 등의 로직에 관한 내용을 알 필요가 없다는 결론을 얻었습니다.
- MainVC에서 처리하던 로직을 관리하는 `MainViewManager`객체를 구현하여 해당 문제를 해결했습니다.

#### MainViewManager의 데이터 처리 로직 방법
- `MainViewManager`객체에 저장되고 불러오는 로직을 메서드를 통해서 구현하려고 했습니다. 메서드를 통해 구현하게 되면 객체에 많은 메서드를 가지는 문제가 발생했습니다.
- 저장 프로퍼티와 연산 프로퍼티를 따로 구현해 데이터를 저장할 때 연산 프로퍼티의 `set`을 이용하여 저장 프로퍼티의 원하는 로직의 결과를 저장하도록 구현하였고, 연산 프로퍼티의 `get`을 통해 저장프로퍼티의 데이터를 원하는 형태로 불러오게 구현했습니다.

<br>

## 7. 프로젝트 수행 중 핵심 경험

- JSON 이해와 활용
- ScrollVeiw의 이해와 활용
- tableView와 Cell의 이해와 활용
- 화면 간 데이터 전달 
- lldb 활용
- 다양한 기기에 대응할 수 있는 오토 레이아웃을 적용
- Word Wrapping, Line Wrapping, Line Break 방식의 이해 및 활용
- Dynamic Types을 적용해 텍스트 접근성 향상

<br>

## 8. 참고 링크
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
    - [NSAttributedString](https://developer.apple.com/documentation/foundation/nsattributedstring)
    - [HIG - Typography](https://developer.apple.com/design/human-interface-guidelines/foundations/typography)

---
[🔝 맨 위로 이동하기](#만국박람회)

