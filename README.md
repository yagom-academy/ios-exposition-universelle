# 만국박람회

## ⭐️ 목차

1. [팀원소개](#팀원소개)
2. [프로젝트 소개](#프로젝트-소개)
3. [타임라인](#타임라인)
4. [다이어그램](#다이어그램)
5. [파일 구조](#파일-구조)
6. [트러블 슈팅](#트러블-슈팅)
7. [참고문서](#참고문서)
8. [팀 회고](#팀-회고)

---

## 팀원소개

|<center>세홍</center>|<center>송준</center>|<center>무리</center>|
|---|---|---|
|<img width= "200" alt="img" src=https://i.imgur.com/vBfH23K.png>|<img height="210px" src="https://i.imgur.com/9Bd6NIT.png">|<img width="200" alt="image" src=https://i.imgur.com/U7TmXby.jpg>|

## 프로젝트 소개

> 1900 만국박람회에 출품된 한국의 작품들을 볼 수 있는 앱입니다.

## 실행화면 


| <center>프로젝트 메인화면</center> | <center>출품작리스트 화면</center> | <center>출품작의 상세화면</center> |
| --- | --- | --- |
| <img src="https://i.imgur.com/oRMLXTs.gif">| <img src="https://i.imgur.com/rolmdF5.gif"> | <img src="https://i.imgur.com/kFbOBpp.gif">|


 
### 스텝 수행 중 핵심 경험

<details>
<summary>핵심경험</summary>

- [X] Codable을 채택하여 JSON 데이터와 매칭할 모델 타입 구현
- [X] 스네이크 케이스 또는 축약형인 JSON 키 값을 스위프트의 네이밍에 맞게 변환
- [X] 테이블뷰의 Delegate와 Data Source의 역할의 이해
- [X] 테이블뷰의 셀의 재사용 이해
- [X] 테이블뷰의 전반적인 동작 방식의 이해
- [X] 주어진 JSON 데이터를 파싱하여 테이블뷰에 표시
- [X] 내비게이션 컨트롤러를 활용한 화면 전환
- [X] 뷰 컨트롤러 사이의 데이터 전달
- [X] 오토 레이아웃을 적용하여 다양한 기기에 대응
- [ ] Word Wrapping / Line Wrapping / Line Break 방식의 이해
- [X] 접근성(Accessibility)의 개념과 필요성 이해
- [X] Dynamic Types를 통해 텍스트 접근성 향상

</details>

## 타임라인

<details>
<summary>타임라인</summary>

| STEP | 날짜 | 타임라인 |
| --- | --- | --- |
| STEP1 | 2023.02.20 | - 파일분리 및 주석 삭제, 수정 </br>-  MainView model 타입 구현 </br>- Items model타입 구현 </br>- 파일 이름 및 타입 명 수정 |
| STEP1 | 2023.02.21 | - ViewController안에 사용되지않는 viewDidLoad메서드 삭제</br>-EntryItem으로 이름 변경, DeCodable채택으로 변경</br>- 오타 수정</br>|
| STEP2 | 2023.02.22 | - decoder생성 </br>- 첫번째 UI 구현 </br>- 데이터파일 추가 </br>- 첫번째 뷰 스크롤기능 구현</br>- NavigateController 생성 및 SecondViewController UI 구현</br>- SecondViewController구현 및 ListTableViewCell 타입 구현</br>- SecondViewController UI 수정</br>- itemDetailViewController 생성 및 UI구현</br>- prepare()메소드로 데이터 전달</br>- ItemDetailViewController UI 수정</br>- SecondViewController UI 변경|
| STEP2 | 2023.02.23 | - 방문자 수 numberFormatter적용</br>- viewController Label 수정</br>- viewController에서 navigationBar 숨김기능 구현</br>- viewController titleLabel 수정 </br>- 접근제어자 설정 및 코드컨벤션 </br>- 파일이름 변경 
| STEP2 | 2023.02.24 | - 불필요한 .self코드 삭제</br>- IBOutlet 접근제어자 설정</br>- setNavigationBar 메서드 생성하여 기능 분리</br>- viewController에 존재하는 decodedData()메서드 객체화를 분리</br>- 두 개의 guard문 통합</br>- setUpView()로 ExpoItemViewController의 prepare()기능 분리</br>- ExpoItemDecoder, ExpositionDecoder 파일 내의 class 타입 struct로 변경</br>- ExpoItemDecoder, ExpositionDecoder의 변수 private(set) 선언</br>- ExpoItemListViewController의 UITableViewDelegate 채택 해제</br>- MainViewController의 View State Method super메소드 호출</br>- Resource파일 생성하여 Assets, Info파일 이동</br>- Extension setDecimal 함수명 convertDecimal함수로 변경 </br>- 매직리터럴 지양을 위한 NameSpace생성 </br>- xCode가 info.plist를 찾지 못해 위치 변경 </br>- Exposition struct의 String 기능을 ViewController로 이동 </br>- ListTableViewCell 타입에 configureCellData메서드 생성하여 ExpoItemListViewController의 cell 설정 기능 분리</br>-  ListTableViewCell view 폴더로 이동</br>- ExpoItemListViewController에 nextViewController변수 itemDetailViewController로 리네이밍 </br>- 불필요한 TestViewController파일 삭제
| STEP2 | 2023.02.27 | - 데이터 파싱 실패시 알림 구현
| STEP3 | 2023.02.27 | - itemDetailViewController에서 접근제어 설정</br>- 객체 내에서 데이터를 변경할 수 있게 receiveData메서드 생성
| STEP3 | 2023.02.28 | - main.storyboard 연결 해제, SceneDelegate에서 window rootView 설정</br>- mainViewController에서 코드로 UI 구현</br>- mainViewController에서 stackView 생성 및 scrollView 기능 구현</br>- MainViewController에서 다음 페이지로 넘어가는 버튼을 StackView를 통해 UI 구현</br>- 글자 크기 변경을 위한 makeBigText(), makeNormalText() 메서드 구현 및 적용</br>- NSMuatableAttributedString 파일 분리</br>- MainViewController 화면 세로 고정 구현</br>- pushExpoItemListViewButton 클릭 시 화면 이동되게 이벤트 설정</br>- ExpoItemListViewController에서 코드로 TableViewUI, TableViewCell 구현</br>- MainVIewController 스택뷰 이미지 spacing 수정 및 폰트 사이즈 수정</br>- ItemDetailViewController 코드로 UI 구현, ExpoItemListViewController화면 이동 구현</br>- 컨벤션 수정</br>- error타입 생성 및 decode 에러 처리 수정
| STEP3 | 2023.03.01 | - 전체 Label Dynamic Type 지정</br>- MainViewController button accessibility 추가</br>- ListTableViewCell Dynamic Type 적용
| STEP3 | 2023.03.02 | - main.storyboard 삭제 </br>- MainVewController titleLabel 글씨크기 수정 및 NSMutableExtension 글씨크기 수정

</details> 

## 다이어그램

<details>
<summary>Class Diagram</summary>

### UML
    
![만국박람회-UML](https://user-images.githubusercontent.com/88870642/222355758-4ac91753-6f75-45a2-8e97-d887dde2ade6.jpg)
    
</details>

## 파일 구조

```
|____Extension
|     |____Int+Extension.swift
|____App
|     |____AppDelegate.swift
|     |____SceneDelegate.swift
|____Models
|     |____Exposition.swift
|     |____ExpoItem.swift
|____Base.lproj
|____Controller
|     |____MainViewController.swift
|     |____testViewController.swift
|     |____SecondViewController.swift
|     |____ItemDetailViewController.swift
|____Model
|____View
|     |____Assets.xcassets
|     |_____AssetsFile생략
|     |____Base.lproj
|     |    |____LaunchScreen.storyboard
|     |    |____Main.storyboard
|     |____ListTableViewCell.swift
|____Info.plist

```

## 트러블 슈팅
    
### 1️⃣ 상세정보 페이지에 데이터 전달하기 
**변경 전**
>- 한국의 출품작 목록을 나타내는 뷰컨트롤러에서 셀(출품작)을 선택하게되면 출품작의 상세정보를 보여주는 페이지를 나타내주어야했습니다.
처음엔 Decoder를 이용하여 한 번 더 데이터를 파싱해오는 방법을 생각했는데, Segue를 이용하여 데이터를 넘기는 방법이 생각 나 이용해보았습니다.
>- prepare()메소드를 이용하여 데이터를 넘겨받을 뷰컨트롤러를 설정 한 후 현재 뷰컨트롤러의cell이 가지고있는 데이터를 다음뷰컨트롤러의 변수에 담아 사용해보았습니다.

**변경 후**
- STEP2를 진행하며 받았던 피드백 중 `github에 올라간 스토리보드는 코드로써 보기 어렵다.`는 피드백과 `cell에 정보를 configure하는 메소드가 하나 있으면 좋겠다.`는 피드백이 있었습니다. 
- 화면전환
팀원끼리 상의하여 UI를 스토리보드가 아닌 코드로 구현을 해보기로 마음먹게되었습니다.
위의 과정을 거치며 변경 전 사용했던 화면전환 방법인`segue` 대신 navigator의 `push`로 변경하게 되었습니다.

- 데이터 전달
ListTableViewCell에 정보를 configure하는 메서드를 생성 후, 이를 이용하여 ItemDetailViewController에서 ExpoItem의 정보를 받아올 수 있게 구현해보았습니다. 
```swift
// ListTableViewCell.swift
func configureCellData(expoItem: ExpoItem) {
    expoTitleLabel.text = expoItem.name
    expoShortDescriptionLabel.text = expoItem.shortDescription
    expoShortDescriptionLabel.numberOfLines = 0
    expoImageView.image = UIImage(named: expoItem.imageName)
    expoDescription = expoItem.description
    expoImageName = expoItem.imageName
}

// ItemDetailViewController.swift
func receiveData(from cell: ExpoItem) {
    expoItemName = cell.name
    expoItemDescription = cell.description
    expoItemImage = cell.imageName
}

// ExpoItemListViewController.swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let navigationController = self.navigationController
    let itemDetailViewController = ItemDetailViewController()
    itemDetailViewController.receiveData(from: decodedExpoItem.expoItems[indexPath.row])
    navigationController?.pushViewController(itemDetailViewController, animated: true)
}
```


### 2️⃣ 구조체 내에서 read-only computed property
- 구조체 내에서 아래 예시와 같이 저장 프로퍼티를 통해 init()되지 않은 visitors프로퍼티를 다른 저장 프로퍼티에 담으려고 할 때 이러한 오류 메시지가 나옵니다. 저장 프로퍼티 안에 값이 초기화되지 않은 상태에서 다른 저장 프로퍼티에 담으려고 하여 오류가 발생된거 같습니다.

<img width="532" alt="image" src="https://user-images.githubusercontent.com/88870642/220825662-6e9468f9-940d-4d41-b3b4-9cd47de5b872.png">

- 변경 전
    ```swift
    struct Exposition: Decodable {
        let visitors: Int
    
        var visitorLabelText: String = "방문객 : \(visitors.setDecimal()) 명"
    }
    ```
- 위 문제를 해결하기 위해 연산 프로퍼티를 사용했습니다. 연산 프로퍼티의 경우 구조체가 인스턴스되고 난 이후에 호출이 가능하기 때문에 구조체가 인스턴스되는 과정에서 저장 프로퍼티의 값이 초기화되어 사용이 가능하다고 이해했습니다.
- 변경 후
    ```swift
    struct Exposition: Decodable {
    let visitors: Int

    var visitorLabelText: String {
        return "방문객 : \(visitors.setDecimal()) 명"
        }
    } 
    ```

### 3️⃣ 하나의 Label에서 다양한 font size 표현 및 Dynamic Type 적용
- 하나의 Label에 다양한 font size를 넣기 위해서는 `NSMutableAttributedString`을 사용해야 한다는 것을 알았습니다.
- `NSMutableAttributedString`은 class타입으로 특성 문자열의 내용을 변경하기 위한 메서드입니다.
- 저희는 `NSMutableAttributedString`를 `extension`해서 사용했습니다.
- `attributes`변수를 선언하고 font의 특성을 저장한 후, 매개변수로 받 아온 `string`에 적용시켜주었습니다.
- 또한`NSMutableAttributedString`의 사용으로 이미 특정 글꼴의 스타일을 가가지고 있기 때문에 dynamic Type이 적용되지 않는 다는 것을 알고 `UIFontMetrics`를 사용하여 글꼴 크기를 동적으로 조정 할 수 있게 수정하였습니다. 

```swift
extension NSMutableAttributedString {
    func makeBigText(string: String) -> NSMutableAttributedString {
        let metric = UIFontMetrics(forTextStyle: .body)
        let font = metric.scaledFont(for: UIFont.systemFont(ofSize: 17))
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        append(NSAttributedString(string: string, attributes: attributes))
        
        return self
    }
    
    func makeNormalText(string: String) -> NSMutableAttributedString {
        let metric = UIFontMetrics(forTextStyle: .body)
        let font = metric.scaledFont(for: UIFont.systemFont(ofSize: 17))
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        append(NSAttributedString(string: string, attributes: attributes))
        
        return self
    }
}
```

### 4️⃣ 에러 처리
- STEP3를 진행하며 에러 처리에 대한 코멘트를 받게되었습니다. 분기로 에러처리하지않고 LocalizedError를 채택하여 LocalizedDescription을 써보는 방향에 대해 제시해주셔서 사용해보게 되었습니다.
```swift 
// Error.swift
extension DecodeError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .expositionDecodeError:
            return NSLocalizedString("박람회 정보를 불러오는데 실패했습니다.", comment: "박람회정보 오류")
        case .expoItemDecodeError:
            return NSLocalizedString("출품작의 상세정보를 불러오는데 실패했습니다.", comment: "상세정보 오류")
        }
    }
}

// MainViewController.swift

 private func checkValidDecodedData() {
        do {
            try decodedExposition.decodeData()
        } catch {
            presentAlert(title: DecodeError.title, message: error.localizedDescription)
        }
    }
    
private func presentAlert(title: String?, message: String?) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let string = NSLocalizedString("확인", comment: "확인버튼")
    let action = UIAlertAction(title: string, style: .default)
    alert.addAction(action)

    present(alert, animated: true)
}
```
- 결과적으로 위와 같이 Alert을 띄워주는 메서드인 `presentAlert`과 데이터 파싱이 유효한지 체크하는 `checkValidDecodedData`메서드로 기능을 분리할 수 있었고, do-catch문에서 코드가 길어지며 가독성이 떨어지던 부분을 깔끔하게 사용할 수 있었던 것 같습니다.

### 5️⃣ 특정화면 회전 제한 

저희는 요구사항에 첫 화면을 세로로만 볼 수 있도록 하는 부분을 
`AppDelegate`의`application(_:supportedInterfaceOrientationsFor:)`메서드로 App의 가장 상위 view의 방향을 제어 하는 방법을 사용했습니다. 

```Swift
static var portraitOrientation: Bool = true

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {

        if AppDelegate.portraitOrientation == true {
            return UIInterfaceOrientationMask.portrait
        } else {
            return UIInterfaceOrientationMask.all
        }
    }
```

리뷰어의 조언을 받아 AppDelegate에서 전역으로 접근하지 않고, 
UINavigationViewController를 오버라이딩 하는 방법으로 변경하였습니다.

먼저 `UINavigationViewController`를 상속받는 클래스를 생성하여 UINavigationController에서 이미 정의된 `supportedInterfaceOrientations` 프로퍼티를 override하여 현재 표시되는 viewController의  supportedInterfaceOrientations 프로퍼티 값을 반환해주는데 여기서는 topViewController가 nil인 경우 현재 표시되는 viewController가 없는 경우에는 [.all] 모든 방향을 지원할 수 있도록 기본 값을 설정해주었습니다. 

```swift
final class NavigationViewController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return topViewController?.supportedInterfaceOrientations ?? [.all]
    }
}
```

```swift 
//mainViewController.swift 
override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
   return .portrait
    }
``` 
 
### 6️⃣ 프로젝트에서 dynamic Type을 적용하였는데 글씨크기를 크게하면 버튼과 바로 위 레이블이 겹치는 문제

- 위와같은 질문을 PR에 남겨놓고 `button의 baseline`이라는 키워드를 답변받았습니다. 
button의 baseline을 stackView의 bottom과 제약을 걸어보니, 버튼의 numberOfLines가 먹히지 않고 `한...가기`와 같은 레이블이 보였습니다.
- 리뷰어에게 다시한번 질문을 드렸고, button이 담겨있는 stackView의 alignment를 center로 설정하니 다음과 같이 dynamic type에서도 아래와같이 잘 보이게 되었습니다🥲
~~어렵고도어려운 오토레이아웃~~


<img src="https://i.imgur.com/0mjT5FB.png" width="40%">

</br>

## 참고문서

- [애플 공식문서 - UITableView](https://developer.apple.com/documentation/uikit/uitableview)
- [애플 공식문서 - Table Views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)
- [애플 공식문서 - UIScrollView](https://developer.apple.com/documentation/uikit/uiscrollview)
- [애플 공식문서 - 오토레이아웃](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/index.html#//apple_ref/doc/uid/TP40010853-CH7-SW1)
- [애플 공식문서 - NSAttributedString](https://developer.apple.com/documentation/foundation/nsattributedstring)
- [애플 공식문서 - UIFontMetrics](https://developer.apple.com/documentation/uikit/uifontmetrics) 
- [StackOverFlow - 에러 처리](https://codereview.stackexchange.com/questions/273696/best-way-to-do-input-validation-on-swift-ios-uikit)


---

## 팀 회고
- [팀회고 링크](https://github.com/parkmuri/ios-exposition-universelle/blob/step3/%ED%8C%80%ED%9A%8C%EA%B3%A0.md)
