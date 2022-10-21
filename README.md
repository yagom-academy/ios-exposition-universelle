# 🕍 만국박람회
>프로젝트 기간: 2022-10-17 ~ 2022-10-28

## 📑 프로젝트 소개
- JSON 데이터를 디코딩해 모델 타입을 구현하고, 만국박람회 애플리케이션을 제작하는 프로젝트 입니다.
- Table View, JSON 데이터 디코딩, LLDB 개념을 기반으로 진행되었습니다.

<img height = 21px, src = "https://img.shields.io/badge/swift-5.6-green">

## 🌱 팀 소개
 |[SummerCat](https://github.com/ttokin)|[애쉬](https://github.com/ash-youu)|
 |:---:|:---:|
| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://i.imgur.com/TVKv7PD.png">| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://avatars.githubusercontent.com/u/101683977?v=4">|

- `SummerCat`와 `애쉬` 팀의 계산기입니다.

###
## 📝 목차
#### 1. [UML](#🔖-1.-UML)
#### 2. [타임라인](#⏱-2.-타임라인)
#### 3. [기능 설명(실행 화면)](#💻-3.-기능-설명(실행-화면))
#### 4. [트러블 슈팅](#🚀-4.-트러블-슈팅)
#### 5. [고민한 점](#🤷‍♀️-5.-고민한-점)
#### 6. [참고 링크](#📎-6.-참고-링크)

---

## 🔖 1. UML
<img width = 800px, src = "https://i.imgur.com/0ay80KG.png">


---

## ⏱ 2. 타임라인
- **2022.10.18**
  - STEP1 요구사항에 따른 모델 타입 구현 (`Exposition`, `Item`)
  - STEP1 PR

- **2022.10.19**
  - UML 작성
  - 모델 타입 리팩토링 (`Codable` 채택 -> `Decodable` 채택)
  - `MainVC`, `ItemListVC`, `ItemVC` 스토리보드 파일 구현 및 오토레이아웃 제약 설정
  - `MainVC` -> `ItemListVC` 화면 전환 방식 변경 (세그를 이용한 전환에서 코드로 전환)
  - json 데이터 디코딩 코드 작성
  - 커스텀 셀 `ItemTableViewCell` 구현

- **2022.10.20**
  - `MainVC` 메서드 기능 분리
  - 오류 발생 시 사용자에게 보여줄 alert 구현
  - 테이블 뷰의 셀 타입 변경 (커스텀 셀에 -> 기본 제공되는 `subtitle` 타입)
  - `MainVC`, `ItemVC` 스크롤 뷰 추가 및 오토레이아웃 제약 수정
  - 네이밍, 컨벤션 수정

- **2022.10.21**
  - UML 수정
  - 접근 제어 레벨 수정
  - STEP2 README.md</b> 작성

---

## 💻 3. 기능 설명(실행 화면)

### [STEP 1]
- JSON 파일을 기준으로 매칭될 모델 타입을 구현하였습니다.
- Swift Convention의 UpperCamelCase 네이밍을 지키기 위해 JSON 데이터의 Key 네이밍은 `CodingKey` 프로토콜을 채택한 열거형의 원시값을 사용하였습니다.
```
Item - items.json
name - name
imageName - image_name
shortDesc - short_desc
desc - desc
Exposition - exposition_universelle_1900.json
```

### [STEP 2]
- `ScrollView` 및 `TableView` 를 활용해 앱의 화면을 구현하였습니다.

 |**메인 화면**|**버튼 클릭시 출품작 화면으로 전환**|
 |:---:|:---:|
 |![](https://i.imgur.com/OTM4FCa.gif)|![](https://user-images.githubusercontent.com/101683977/197129044-fb21afd7-043f-4645-8749-37183246c129.gif)|
 |**한국의 출품작 화면**|**셀 클릭시 품목 상세 화면으로 전환**|
 |<img width=320px, src="https://user-images.githubusercontent.com/101683977/197129289-2edc5834-3a72-4132-88e4-e4bfddb0220b.png">|![](https://user-images.githubusercontent.com/101683977/197129414-97514679-8a84-4db7-8be9-f4fcc3c543a9.gif)|

---

## 🚀 4. 트러블 슈팅

### [STEP 2]

#### 👻 문제 1
커스텀 테이블 뷰 셀 구현 시 오토레이아웃 제약이 불완전하여 제대로 화면에 표현되지 않는 문제

```swift
extension KoreanItemViewController: UITableViewDataSource {
    
    ...
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        
        cell.itemImage.image = UIImage(named: items[indexPath.row].imageName)
        cell.itemLabel.text = items[indexPath.row].name
        cell.itemDescription.text = items[indexPath.row].shortDesc
        cell.translatesAutoresizingMaskIntoConstraints = true
        cell.itemDescription.sizeToFit()
        return cell
    }
}
```

커스텀 셀의 높이를 `.automaticDemension`으로 명시적으로 지정하든, 지정하지 않든 현재 셀의 높이를 별도로 지정해주지 않았기 때문에 `rowHeight`가 `automaticDimension`으로 설정되어 셀의 높이를 자동으로 계산할 수 있다고 생각했는데, 위 코드에서 **`sizeToFit()`을 주석 처리할 경우 셀 크기를 자동으로 계산하지 못하는** 문제가 있었습니다.
`sizeToFit()`을 넣어주면 정상적으로 표시는 되지만, 셀을 탭했을 때 텍스트 뷰를 제외한 영역만 회색으로 선택 표시가 되는 문제가 있어 커스텀 뷰에서 레이블 1개, 텍스트 뷰 1개를 사용하는 대신 레이블 2개를 사용하도록 수정해보았습니다.

이미지 뷰 1개, 레이블 2개를 포함하는 **커스텀 셀을 구현**한 경우 아래 사진과 같이 모든 행이 일정하게 큰 높이로 표시되는 문제가 있었습니다. (가장 긴 텍스트 뷰의 높이와 무관하게 더 길게). 오토레이아웃 제약에 문제가 있는 것으로 생각되지만 어느 부분이 문제인지 찾지 못했습니다.
![sizeToFit 제거 예시](https://i.imgur.com/ndVvmxb.png)

#### 🔫 문제 1 해결 
커스텀 셀을 사용해서 화면이 의도대로 표시되도록 해결은 하지 못했습니다. 대신, 커스텀 셀이 아닌 기본 셀 타입 중 `subtitle`을 활용하도록 수정하였습니다.
테이블 뷰 셀 내의 콘텐트에 관한 오토레이아웃 제약을 설정하는 부분은 STEP3 요구사항이기 때문에, STEP3를 진행하면서 추가로 수정하기로 했습니다.

---

## 🤷‍♀️ 5. 고민한 점

### 1. `MainVC` 메서드 역할 분리
최대한 관계 있는 역할을 가진 메서드끼리 묶어서 역할 분리를 해 보려고 노력했습니다. `viewDidLoad()` 메서드에서 아래의 메서드들을 별도의 함수로 분리해주었습니다.
- 제목 레이블을 업데이트 하는 함수 `updateTitleLabel()`
- 제목을 제외한 모든 레이블 텍스트를 업데이트 하는 함수 `updateLabelText()`
- 모든 이미지 뷰를 업데이트 하는 함수 `updateImage()`

### 2. 옵셔널 바인딩 시 오류 처리
다음의 총 4가지 상황에서 옵셔널 바인딩 처리가 필요했습니다.
1. 데이터 애셋을 가져오는 상황
2. json 데이터를 디코딩하는 상황
3. 각 VC가 가지고 있는 객체의 인스턴스(`exposition`, `item` 등)의 프로퍼티를 불러오는 상황
4. 화면 전환을 위해 `instantiateViewController(withIdentifier:)` 메서드를 사용해 다음 ViewController의 인스턴스를 생성하는 경우

이 때, 단순히 `return` 하는 대신 어떻게 처리를 할 수 있을까 고민을 하다 각 상황에 맞는 alert를 띄워주도록 처리했습니다.
- 데이터 애셋을 불러오지 못하거나 json 데이터 디코딩에 실패한 경우 `showDataAlert()`
- 화면 전환에 실패한 경우 `showTransitionErrorAlert()`
- 이미지 디코딩에 실패한 경우 SFSymbol 이미지를 표시

---

## 📎 6. 참고 링크
- [UML: 클래스 다이어그램과 소스코드 매핑](https://www.nextree.co.kr/p6753/)
- [UITableView - Apple Developer](https://developer.apple.com/documentation/uikit/uitableview)
- [Table views - Apple Developer](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)
