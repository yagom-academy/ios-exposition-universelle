# 🕍 만국박람회
>프로젝트 기간: 2022-10-17 ~ 2022-10-28

## 📑 프로젝트 소개
- JSON 데이터를 디코딩해 모델 타입을 구현하고, 만국박람회 애플리케이션을 제작하는 프로젝트 입니다.
- Table View, JSON 데이터 디코딩, 접근성(Accessibility), Dynamic Type 개념을 기반으로 진행되었습니다.

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
<img width = 1000px, src = "https://i.imgur.com/6V6netG.png">


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
  - STEP2 PR

- **2022.10.21**
  - UML 수정
  - 접근 제어 레벨 수정
  - STEP2 README.md</b> 작성

- **2022.10.24**
  - `itemListVC` TableView를 CustomCell로 리팩토링

- **2022.10.26**
  - 에러 로그 출력 메서드 생성

- **2022.10.27**
  - 요구사항에 따라 메인 화면은 세로 방향 고정되도록 구현
  - Accessibility 설정
    - UI 요소별 적절한 `accessibilityLabel` 설정
    - Dynamic types 적용
  - STEP3 PR

- **2022.10.28**
  - UML 수정
  - STEP3 README.md</b> 작성
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

### [STEP 3]
- 다양한 아이폰 기기에 적용 가능한 오토레이아웃을 구현하였습니다.
- Accessibility 설정을 위해 `accessibilityLabel`과 Dynamic Type을 적용하였습니다. 

 |**메인 화면**|**출품작 화면**|**품목 상세 화면**|
 |:---:|:---:|:---:|
 |<img width=300px, src="https://i.imgur.com/oDGUvrH.png">|<img width=300px, src="https://i.imgur.com/BZ8A7o5.png">|<img width=300px, src="https://i.imgur.com/zNOBOEa.png">|

- **Dynamic Type 적용**

 |**메인 화면**|**출품작 화면**|**품목 상세 화면**|
 |:---:|:---:|:---:|
 |<img width=300px, src="https://i.imgur.com/bnQBTSc.png">|<img width=300px, src="https://i.imgur.com/vQevSgi.png">|<img width=300px, src="https://i.imgur.com/N4H6RES.png">|


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

#### 👻 문제 2
테이블 뷰에서 아래 → 위로 빠르게 스크롤 할 때 틱틱거리면서 스크롤이 제대로 되지 않는 문제

#### 🔫 문제 2 해결
기본 셀을 사용할 시 나타나는 문제로 추정되며, 커스텀 셀을 구현해주니 해결되었습니다.
(uitableviewcell default cell issue, bug, tick 등으로 구글링해 보았지만 관련된 게시물을 찾지 못함)

---

### [STEP3]
#### 👻 문제 1
요구사항에 따라 하나의 화면(`MainVC`)만 세로 화면으로 고정하고, 나머지는 가로/세로 화면을 모두 지원하도록 설정해야하는 문제

#### 🔫 문제 1 해결
ViewController의 인스턴스 프로퍼티로 VC가 지원하는 인터페이스 방향을 지정할 수 있는 `supportedInterfaceOrientations` 를 override 하여 해결하였습니다.
```swift
class MainViewController: UIViewController {
    
    ...
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait]
    }
}
```

---

#### 👻 문제 2
UILabel에 여러 줄의 텍스트가 있을 때 `adjustsFontSizeToFitWidth` 적용하기

#### 🔫 문제 2 해결
`numberOfLines`의 값이 0이면 안되고, `lineBreakMode`가 `TruncateTail` 이어야 합니다. (출처: [StackOverflow](https://stackoverflow.com/questions/24636879/why-does-this-break-uilabel-adjustsfontsizetofitwidth))

- 예시: 사용자가 글씨 크기를 키웠을 때, 제목 레이블은 줄 수가 1줄로 제한되어 있어서 `adjustsFontSizeToFitWidth`가 적용되어 글씨 크기가 줄어든 상태.
반면, shortDescription의 경우 줄 수가 제한되어 있지 않기 때문에(`numberOfLines=0`), `adjustsFontSizeToFitWidth`가 적용되지 않아 shortDescription의 폰트 크기가 더 커진 화면.
<img width=200px, src="https://i.imgur.com/4BciOW8.png">
- 제목 레이블의 폰트 크기가 shortDescription 레이블의 폰트 크기보다 크게 유지하기 위해 제목 레이블을 `numberOfLines = 0`, `lineBreakMode = .truncateTail`로 수정한 화면.
<img width=200px, src="https://i.imgur.com/kB3khC9.png">

---

#### 👻 문제 3
`DateFomatter`를 사용해 String 타입의 날짜를 Date 타입으로 parsing할 때, String 타입의 날짜값과 Date 타입의 날짜값이 상이한 문제

- 예시: "1990. 04. 14" 문자열을 매개변수로 주었는데, 결과값으로 나온 Date는 `1990.04.13`
```swift
let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy. MM. dd"
    formatter.dateStyle = .short
    return formatter
}()

let str = "1900. 04. 14"
let date: Date = dateFormatter.date(from: str)!
print(date)
```
- 출력값: 
![](https://i.imgur.com/kMD5LMJ.png)

#### 🔫 문제 3 해결
- `init?(secondsFromGMT seconds: Int)` 이니셜라이저의 매개변수로 GMT와 현재 기기에 설정된 위치(=한국표준시)의 시차를 `timezone`이라는 변수로 전달해주어 `dateFormatter`의 time zone을 설정하고, `locale`에 `"ko_kr"`을 전달해 올바른 날짜 형식을 반환받을 수 있도록 하였습니다.

```swift
let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy. MM. dd"
    formatter.locale = Locale(identifier: "ko_kr")
    formatter.timeZone = TimeZone(secondsFromGMT: timezone)
    formatter.dateStyle = .short
    return formatter
}()

let str = "1900. 04. 14"
let date: Date = dateFormatter.date(from: str)!
print(date)
```
- 출력값: 
![](https://i.imgur.com/cFgu1ZO.png)

---

## 🤷‍♀️ 5. 고민한 점

### 1. `MainVC` 메서드 역할 분리
최대한 관계 있는 역할을 가진 메서드끼리 묶어서 역할 분리를 하였습니다. `viewDidLoad()` 메서드에서 아래의 메서드들을 별도의 함수로 분리해주었습니다.
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

### 3. DateFormatter 구현 방식
`MainVC`에서 개최 기간을 voiceover가 읽어줄 때 자연스럽게 읽어줄 수 있도록 하기 위해 레이블의 날짜 값을 파싱해야 했습니다. 파싱할 때 사용할 DateFormatter를 아래의 3가지 중 어떤 방법으로 구현할지 고민했습니다.
  - extension을 만들어서 `static let`으로 DateFormatter의 프로퍼티를 정의해 사용하는 방법
  - DateFormatter의 하위 클래스를 정의해, VC 내에서 해당 클래스의 인스턴스를 활용하는 방법
  - 기존과 같이 VC 메서드 내에서 DateFormatter의 인스턴스를 지역변수로 정의해 사용하는 방법
 
처음에는 1번 방법을 활용하려고 했지만, 날짜를 파싱해야 하는 부분이 `MainVC`의 `durationLabel.accessibilityLabel` 밖에 없기 때문에 3번 방법을 활용했습니다.


### 4. 에러 로그 구현
`print(error)`로 단순하게 에러 로그를 출력하는 형태에서, 에러가 발생한 정확한 지점을 알려주기 위한 에러 로그를 다음과 같이 구현하였습니다. [참고 링크](https://jinsangjin.tistory.com/103)

```swift
func printErrorLog(_ fileName: String = #file, _ line: Int = #line , _ funcName: String = #function) {
    print("Error at: file: \(fileName), line: \(line), func: \(funcName)")
}
```

에러 로그 출력 예시
![에러 로그 출력 예시](https://i.imgur.com/x58jmYT.png)


---

## 📎 6. 참고 링크
- [UML: 클래스 다이어그램과 소스코드 매핑](https://www.nextree.co.kr/p6753/)
- [UITableView - Apple Developer](https://developer.apple.com/documentation/uikit/uitableview)
- [Table views - Apple Developer](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)
- [야곰닷넷 - 오토레이아웃 정복하기](https://yagom.net/courses/autolayout/)
- [Accessibility Inspector (WWDC 2019)](https://developer.apple.com/videos/play/wwdc2019/257/)
- [Writing Great Accessibility Labels (WWDC 2019)
](https://developer.apple.com/videos/play/wwdc2019/254/)
- [Apple Developer Documentation - supportedInterfaceOrientations](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621435-supportedinterfaceorientations)
- [DateFormatter - Apple Developer](https://developer.apple.com/documentation/foundation/dateformatter)
