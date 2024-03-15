## 만국박람회 🇰🇷

### 0. 목차
- [1. 소개](#1-소개)
- [2. 팀원](#2-팀원)
- [3. UML](#3-uml)
- [4. 타임라인](#4-타임라인)
- [5. 실행 화면](#5-실행-화면)
- [6. 트러블 슈팅](#6-트러블-슈팅)
- [7. 팀 회고](#7-팀-회고)
- [8. 참고자료](#8-참고자료)

### 1. 소개
- 1900 만국박람회 어플을 소개합니다. 만국박람회는 지난 세기를 기념하고 다음 세기를 향한 발전을 가속하자는 의미에서 1900년 4월 14일부터 11월 12일까지 프랑스 파리에서 열린 세계 박람회를 기념한 어플입니다. 👍
- 한국의 출품작이 무엇이 있는 지 확인할 수 있으며, 각각의 출품작의 상세 설명도 확인이 가능합니다! 🇰🇷

### 2. 팀원
| [Danny](https://github.com/dannykim1215) | [Gray](https://github.com/yawoong2) |
| --- | --- |
| <img src="https://avatars.githubusercontent.com/u/154333967?v=4" width="200"> | <img src="https://avatars.githubusercontent.com/u/139211436?v=4" width="200"> |

### 3. UML
![image](https://github.com/dannykim1215/ios-exposition-universelle/assets/154333967/91ff4e08-59e7-4320-8af0-6e5f1b2cfdf0)



### 4. 타임라인
| 날짜 | 제목 |
| --- | --- |
| 24.03.04(월) ~ 03.06(수) | JSON 파일을 복호화하여 앱에 보여줄 수 있도록 Model 구현 |
| 24.03.07(목) ~ 03.08(금) | 박람회 소개 화면 구현 및 <br>한국의 출품작 Table View 구현 |
| 24.03.10(일) ~ 03.11(월) | 한국 출품작 목록화면에서 상세 품목으로 화면 전환 및 <br>상세 품목 화면 Scroll View 구현 |
| 24.03.12(화) ~ 03.13(수) | 스토리보드 기반으로 UI 구현 |
| 24.03.14(목) ~ 03.15(금) | 코드 기반으로 UI를 구현하도록 리팩토링 |



### 5. 실행 화면
![exposition_simulation_step2](https://github.com/yagom-academy/ios-exposition-universelle/assets/154333967/76a35a5b-da4f-4f18-915c-f0b226a79f04)

<details>
<summary>[STEP 1](24.3.8)까지 진행된 UI 및 기능입니다. </summary>

<!-- summary 아래 한칸 공백 두어야함 -->
<img src="https://cdn.discordapp.com/attachments/1199370366167027834/1215537959449661470/exposition_execute_screen.gif?ex=65fd1cf1&is=65eaa7f1&hm=c3db31a8d18bf699184b617b7e4c8dabb5dbf455689e525fcd8c6fc57cb3fa5d&" width="70%">
</details>

<details>
<summary>[STEP 2](24.3.15)까지 진행된 UI 및 기능입니다. </summary>


> __첫 화면과 출품작 목록 그리고 품목 상세를 볼 수 있는 화면을 구현합니다.__
>- 첫 화면에는 1900 만국박람회 포스터와 각종 설명을 표시합니다.
>- 출품작 목록에는 사진, 이름, 간단 설명 항목이 포함된 리스트를 출력합니다.
>- 출품작 상세화면에는 이름, 사진 설명을 보여줍니다.

![exposition_simulation_step2](https://github.com/yagom-academy/ios-exposition-universelle/assets/154333967/76a35a5b-da4f-4f18-915c-f0b226a79f04)

**- 첫 화면에는 1900 만국박람회 포스터와 각종 설명을 표시합니다.**

![첫화면 스크린샷](https://github.com/yagom-academy/ios-exposition-universelle/assets/154333967/24b26868-f6ad-41fc-8852-b4e73030fbde)
**- 출품작 목록에는 아래의 항목이 포함된 리스트를 출력합니다.**
  - 출품작 사진
  - 출품작 이름
  - 출품작 간단 설명
  - 출품작을 선택했을 때 출품작 상세화면으로 이동합니다.

![출품작목록 스크린샷](https://github.com/yagom-academy/ios-exposition-universelle/assets/154333967/210f4f75-abb6-4dca-a9f0-a9dfa567f1bc)

**- 출품작 상세화면에는 아래의 항목을 보여줍니다.**
  - 출품작 이름
  - 출품작 사진
  - 출품작 설명

![스크린샷 2024-03-15 오후 4 36 20](https://github.com/yagom-academy/ios-exposition-universelle/assets/154333967/2857190a-63be-4ce9-b393-fa725cdb6a62)
</details>

### 6. 트러블 슈팅
#### 1. CustomTableViewCell 내부의 프로퍼티를 private 접근제어자 부여 및 메소드를 생성(캡슐화 적용)
**[변경전]**
- HeritageTableViewCell 클래스의 저장프로퍼티에 직접 접근하여 데이터 값을 할당했었습니다.
```swift=
// HeritageTableViewCell
cell.titleLabel.text = koreanHeritage[indexPath.row].name
cell.itemImageView.image = UIImage(named: koreanHeritage[indexPath.row].imageName)
cell.shortDescriptionLabel.text = koreanHeritage[indexPath.row].shortDescription
```

**[변경후]**
- HeritageTableViewCell 클래스의 해당 저장프로퍼티를 private 접근제어자를 적용하고, 메소드를 생성하였습니다. KoreanHeritageViewController 클래스에서 생성된 메소드를 이용해서 프로퍼티에 값을 할당하도록 변경하였습니다.
```swift=
// HeritageTableViewCell
func useTitleLabel(titleLabelText: String?){
	guard let titleLabelText = titleLabelText else {
		return
	}
	titleLabel.text = titleLabelText
}

func useShortDescriptionLabel(shortDescriptionText: String?){
	guard let shortDescriptionText = shortDescriptionText else {
		return
	}
	shortDescriptionLabel.text = shortDescriptionText
}

func useitemImageView(itemImageName: String?) {
	guard let itemImageName = itemImageName else {
		return
	}
	itemImageView.image = UIImage(named: itemImageName)
}

//KoreanHeritageViewController
cell.useTitleLabel(titleLabelText: koreanHeritage[indexPath.row].name)
cell.useShortDescriptionLabel(shortDescriptionText: koreanHeritage[indexPath.row].shortDescription)
cell.useitemImageView(itemImageName: koreanHeritage[indexPath.row].imageName)

```

#### 2. 문자열 내부에서 특정 문자만 속성 변경하기
- 초기 박람회 화면에서, "방문객 : 00명" 처럼 레이블이 보여지는 구간은 요구사항에서는 콜론을 기준으로 좌,우의 폰트 크기가 달라서 특정 문자만 속성을 변경해주어야 했습니다.
**[변경전]**
```swift
// ExpositionViewController.swift
private func showExpositionIntroduction(){
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let visitorString: String = numberFormatter.string(for: expositionIntroduction.visitors) else {
            return
        }
        
        mainTitleLabel.text = String(expositionIntroduction.title.prefix(13))
        subTitleLabel.text = String(expositionIntroduction.title.suffix(28))
        posterImageView.image = UIImage(named: "poster.png")
        visitorLabel.text = "\(visitorString) 명"
        locationLabel.text = "개최지 : \(expositionIntroduction.location)"
        durationLabel.text = "개최 기간 : \(expositionIntroduction.duration)"
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = expositionIntroduction.description
        koreanHeritageButton.addTarget(self, action: #selector(openKoreanHeritageViewController), for: .touchUpInside)
    }
    .
    .
}
```

**[변경후]**
- NSAttributedString을 활용하여 특정 문자열만 폰트 크기를 조절하여 속성을 변경할 수 있도록 아래와 같이 구현했습니다.
속성을 변경하는 코드는 textAttributedToString으로 메서드로 분리하여 방문객, 개최지, 개최 기간 레이블에서 재사용 할 수 있게끔 했습니다.
아래와 같이 구현한다면 방문객, 방문객 수 레이블을 두 개 따로 만들지 않아도 됩니다.
```swift
private func showExpositionIntroduction(){
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let visitorString: String = numberFormatter.string(for: expositionIntroduction.visitors) else {
            return
        }
        
        mainTitleLabel.text = String(expositionIntroduction.title.prefix(13))
        subTitleLabel.text = String(expositionIntroduction.title.suffix(28))
        posterImageView.image = UIImage(named: "poster.png")
        visitorLabel.attributedText = textAttributedToString(text: "방문객 : \(visitorString) 명", length: 3)
        locationLabel.attributedText = textAttributedToString(text: "개최지 : \(expositionIntroduction.location)", length: 3)
        durationLabel.attributedText = textAttributedToString(text: "개최 기간 : \(expositionIntroduction.duration)", length: 6)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = expositionIntroduction.description
        koreanHeritageButton.addTarget(self, action: #selector(openKoreanHeritageViewController), for: .touchUpInside)
    }
    .
    .
} 
private func textAttributedToString(text: String, length: Int) -> NSAttributedString {
    let textAttributes:[NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 20)]
    let textAttributedToString = NSMutableAttributedString(string: text)
    textAttributedToString.addAttributes(textAttributes, range: NSRange(location: 0, length: length))
    
    return textAttributedToString
}
.
.
```

#### 3. 테이블뷰의 셀을 터치 했을 때, 터치 회색이 유지되는 현상 트러블 슈팅
**[변경전]**
- 셀을 터치 후, KoreanDetailViewcontroller로 이동하게 됩니다. 이동하고나서 다시 테이블뷰로 돌아왔을 때 선택된 셀이 회색 색깔이 유지되는 현상이 발생되었습니다. 
```swift=
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
	let koreanHeritageDetailViewController = KoreanHeritageDetailViewController()
        
        koreanHeritageDetailViewController.setItemInformation(
            title: koreanHeritage[indexPath.row].name,
            imageName: koreanHeritage[indexPath.row].imageName,
            description: koreanHeritage[indexPath.row].description
        )
        navigationController?.pushViewController(koreanHeritageDetailViewController, animated: true)
}
    
```

**[변경후]**
- tableView의 deselectRow 메소드를 활용하여 셀 선택 후에 바로 선택된 셀이 deselect 되도록 하여 트러블 슈팅을 할 수 있었습니다. 
```swift=
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
	let koreanHeritageDetailViewController = KoreanHeritageDetailViewController()
        
        koreanHeritageDetailViewController.setItemInformation(
            title: koreanHeritage[indexPath.row].name,
            imageName: koreanHeritage[indexPath.row].imageName,
            description: koreanHeritage[indexPath.row].description
        )
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(koreanHeritageDetailViewController, animated: true)
}
```

<details>
<summary> [STEP 1](24.3.8)까지 진행된 트러블슈팅 내용입니다. </summary>

<!-- summary 아래 한칸 공백 두어야함 -->
#### 1. json 파일의 Key값을 일치시키기 위한 CodingKeys 생성
**[변경전]**
- struct 타입에서 json 파일의 콘텐츠를 복호화(decode) 하여 프로젝트에 출력할 수 있도록 하기 위해 아래와 같이 모델을 생성하였습니다. 하지만, 아래와 같이 선언할 경우에는 json파일의 키,값을 찾을 수 없습니다.
```swift=
struct KoreanHeritage: Equatable {
    let name: String
    let imageName: String
    let shortDescription: String
}
```

**[변경후]**
- json으로 암호화(encode) 또는 반대로 복호화(decode)하여 프로젝트에 적용하기 위해서는 Codable 프로토콜을 준수하도록 명시해야합니다. 이는 Encodable, Decodable 프로토콜이 합쳐진 typealias입니다. 그리고 아래의 코드처럼 CodingKey enum 타입으로 케이스를 작성해야 json 타입의 키가 어느 프로퍼티와 일치하는지 매칭해 줄 수 있습니다.
```swift=
struct KoreanHeritage: Equatable, Codable {
    let name: String
    let imageName: String
    let shortDescription: String

    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
    }
}
```

#### 2. 방문객 수의 소수점 자리 표현
**[변경전]**
- String index를 활용하여, 각 숫자의 자리 단위를 표현하여 출력하였습니다. **<U>하지만, 숫자의 단위가 늘어나면 늘어날수록 지속적으로 이러한 형태로 숫자 자리를 표현하기엔 비효율적이라고 생각하게 되었습니다.**</U>
```swift=
let visitorsString = String(expositionIntroduction.visitors)
        
let rangeStartIndex = visitorsString.index(visitorsString.startIndex, offsetBy: 2)
let rangeEndIndex = visitorsString.index(visitorsString.endIndex, offsetBy: -3)

let visitorsFristNumber = visitorsString.prefix(2)
let visitorsSecondNumber = visitorsString[rangeStartIndex..<rangeEndIndex]
let visitorsThridNumber = visitorsString.suffix(3)

visitorLabel.text = "\(visitorsFristNumber),\(visitorsSecondNumber),\(visitorsThridNumber) 명"
```

**[변경후]**
- NumberFormatter를 활용하여 numberStyle을 decimal로 지정하였습니다. decimal 형태로 지정하면 Int 형태를 천의 자리마다 ", "로 표현할 수 있었습니다.
```swift=
let numberFormatter: NumberFormatter = NumberFormatter()
numberFormatter.numberStyle = .decimal

guard let visitorString: String = numberFormatter.string(for: expositionIntroduction.visitors) else {
	return
}
visitorLabel.text = "\(visitorString) 명"
```

</details>

### 7. 팀 회고
#### 우리팀이 잘한 점 😍
	1. 커밋 규칙을 잘 지켰습니다.
	2. 포기하지 않고, [STEP 2] 만국박람회 전면 코드화 진행하였습니다. 
	3. 서로 구현한 부분과 이해가 되지 않는 부분들에 대해서 토의를 거쳐 의견을 조율하였습니다.
- Danny
  - 
- Gray 
  - 
	
	
### 8. 참고자료
- UITableView: https://developer.apple.com/documentation/uikit/uitableview
- Table Views: https://developer.apple.com/documentation/uikit/views_and_controls/table_views
- Filling a Table with Data: https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data
- Configuring the Cells for Your Table: https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table
- JSON: https://developer.apple.com/documentation/foundation/jsondecoder
- JSONDecoder: https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types
- Using JSON with Custom Types: https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types
- Encoding and Decoding Custom Types: https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types
- LLDB 정복하기: https://yagom.net/courses/start-lldb/
- 야곰 TableView 강의: https://www.boostcourse.org/mo326/joinLectures/12973?isDesc=false
- 야곰 AutoLayout 정복하기 강의: https://yagom.net/courses/autolayout/
- Codebase UI 참고 링크 세팅: https://chobikim.tistory.com/77
