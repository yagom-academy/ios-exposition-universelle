# README - 🇫🇷만국박람회🇰🇷

## iOS 커리어 스타터 캠프

### 계산기 프로젝트 저장소
---
### 목차
1. [개요](#1.개요)
2. [타임라인](#2.타임라인)
3. [시각화된 프로젝트 구조](#3.시각화된프로젝트구조)
4. [실행화면](#4.실행화면)
5. [트러블 슈팅](#5.트러블슈팅)
6. [참고 링크](#6.참고링크)

---
# 1. 개요
### 만국박람회 프로젝트
- 만국박람회에 참가한 한국의 출품작을 볼 수 있는 프로젝트입니다.

### 팀원 

|inho(@inho-98)|LJ(@lj-7-77)|
|:-:|:-:|
---
# 2.타임라인
| 날짜 | 중요 진행 상황&nbsp;&nbsp; | 코드 관련 사항&nbsp;
|---|:-:|---|
|10/18| `STEP1` 구현 | `JSON`데이터를 분석할 `ExhibitData`, `ExpositionData` 구조체 구현
|10/20| `STEP2` 구현 | `ExpositionViewController`의 UI요소 생성 및 구성(`configureView()`), `JSONDecode`의 `parse`메서드 생성, 
|10/21| `STEP2` 구현 | `ExhibitViewController`와 테이블 뷰 생성 및 `ExhibitTableVIewCell` 생성, 화면 전환 기능 구현, `ExhibitDetailViewController`의 UI요소 생성 및 구성
|10/24| `STEP2` 구현 | `ExpositionConstant` 네임스페이스 생성, 코드에 접근 수준 수정
|10/25| `STEP2` 구현 | `ExhibitDetailViewController`의 `configureView`메서드 분리, 클래스에 `final` 키워드 적용, `Error`타입 생성
|10/26| `STEP2` 구현 | `AutoLayout` 구현방법 고민 
|10/27| `STEP2` 구현 | `showAlert`메서드 생성, `fetchData` 메서드 생성
|10/28| `STEP2` 구현 | 뷰컨트롤러의 초기화방법 변경(required Initializer 구현)


# 3.시각화된프로젝트구조
<img src="https://i.imgur.com/53laOW3.png" width=600>

# 4.실행화면
|<img src="https://user-images.githubusercontent.com/97071996/198536163-9b2abf8c-9d1f-4266-9449-49cd263209a1.gif" width=200>|
|:-:|
|실행 화면|


---
# 5.트러블슈팅
### 1️⃣ Step1
#### JSON 포맷 데이터의 `decodable` 프로토콜 채택
- 데이터를 주고받을때, 특정 포맷으로 변환하기 위해 `codable`프로토콜을 채택한다.
그리고 `Codable`은 `encodable & decodable`의 type alias인데, 이번 프로젝트에서는 `encoding`의 과정이 없기때문에 `decodable`프로토콜만 채택했다.</br>
➡️ 나중의 확장성을 고려한다면 `Codable`을 채택하는 것이 맞지만, 아직 니즈가 없는데 미리 만들어두는 오버엔지니어링을 하게된다. 오버엔제니어링의 단점은 추후 기획이 변경되었을 때 유연한 대응이 어렵다는 것이다.

### 2️⃣ Step2
#### JSONDecoder의 extension
- JSON을 디코딩할때마다 `JSONDecoder`인스턴스가 불필요하게 여러번 생성되어 메모리가 낭비되는 부분을 보완하기 위해 JSONDecoder클래스에 타입 프로퍼티인 `jsonDecoder`을 생성하여 인스턴스가 한번 생성되도록 구현했다. (비용이 많이드는 object인`DateFormatter`를 활용하는 방법에서 배운 방법이다.)
</br>

```swift
static let jsonDecoder: JSONDecoder = .init()
```
- 프로젝트 내에서 JSON데이터를 디코딩할때, 반복되는 부분을 줄이고 하나의 메서드로 묶은 뒤 제네릭 타입을 이용해서 원하는 타입대로 디코딩할 수 있는 메서드를 구현했다.
</br>
    
```swift
static func parse<T: Decodable>(assetName: String, to dataType: T.Type) -> T? {
    guard let dataAsset: NSDataAsset = NSDataAsset(name: assetName) else {
        return nil
    }
        
    do {
        return try Self.jsonDecoder.decode(T.self, from: dataAsset.data)
    } catch {
        return nil
    }
}
```

#### 화면 전환 방법 `NavigationController`사용 / `Segue`사용
- `NavigationController`사용한 방법</br>
**장점** : 코드로 명시적으로 지정할 수 있어 실수할 가능성이 적다.</br>
**단점** : 스토리보드상에서 화면의 흐름을 한눈에 볼 수 없다.</br>
- `Segue`사용한 방법
**장점** : 구현방법이 간단하다.(스토리보드 ctrl + drag)</br>
**단점** : `Segue`식별자 지정하는 것을 빠뜨리거나 하는 등의 실수할 가능성이 높다. 어떤 Segue가 어떤 식별자이름인지 일일히 확인해야 한다. `Segue`가 많아졌을때, 스토리보드 화면이 복잡해진다.</br>
- 스토리보드에서 발생하는 에러는 빌드하여도 에러로 잡히지 않기때문에 나중에 원인을 찾기가 쉽지 않다. 두가지 방법 중 에러날 가능성이 적은 NavigationController사용한 방법으로 구현했다.
</br>

```swift
guard let nextViewController: ExhibitViewController = self.storyboard?.instantiateViewController(withIdentifier: "exhibitViewController") as? ExhibitViewController else {
    return
}
        
self.navigationController?.pushViewController(nextViewController, animated: true)
```

#### `UIButton`의 `title` 지정 방법
- `UIButton`의 `title`에 원하는 값을 주기 위해서 버튼의 `titleLabel?.text`에 접근하여 값을 주었는데, 버튼을 한번 눌렀을때 `default`값인 `Button`으로 돌아오는 문제가 있었다. 
- [공식문서](https://developer.apple.com/documentation/uikit/uibutton/1624018-settitle)에서는 버튼의 상태에 따른 레이블을 지정할때 `setTitle()`메서드를 이용해야 하고,  `normal`상태에 대한 값을 지정하지 않으면 기본 텍스트를 사용한다고 한다. 그래서 버튼이 클릭되고, 상태가 바뀐 후에 원래 텍스트인 `Button`으로 바뀌었던 것 같다.
    > If you don’t specify a title for the other states, the button uses the title associated with the normal state. If you don’t set the value for normal, then the property defaults to a system value.
</br>

```swift
//기존 코드
button.titleLabel.text = "한국의 출품작 보러가기"
//새로운 코드
button.setTitle(exposition.exhibitButtonText, for: .normal)
```

#### `Initializer`를 이용하여 초기화
- `ExpositionViewController`의 `ExpositionData`프로퍼티는 뷰컨트롤러가 생성되면서 asset의 파일을 디코딩한 값을 전달받고 있었다. 초기화와 뷰에 로드되는 중간에 디코딩이 발생하고 있어서 프로퍼티를 `ExpositionData?`타입으로 지정해 처음에는 nil값이 할당되었다. (뷰컨트롤러를 생성한 후에 프로퍼티에 값을 변경하는 방법)
- 그런데 뷰를 보여주기 위해서 값이 필요하니 뷰컨트롤러를 초기화하는 시점에 프로퍼티를 함께 초기화하기 위해서 뷰컨트롤러의 `required init?(coder:)`메서드를 이용했다. (뷰컨트롤러 생성과 함께 프로퍼티에 값 초기화하는 방법)

**`required init?(coder:)`가 담고있는 내용**
- `ExpositionViewController`가 상속받은 `UIViewController`는 `NSCoding` 프로토콜을 채택하고, `NSCoding`프로토콜의 필수구현 메서드 중 하나가 `init?(coder: NSCoder)` 이다.
- 이 이니셜라이저는 지정된 `unarchiver`의 데이터에서 초기화된 객체를 반환해준다. 여기서 `unarchiver`의 데이터는 `JSON`파일을 디코드한 `swift`코드형태의 데이터라고 이해했다.
- 매개변수`coder`의 타입인 `NSCoder`타입은 메모리나 타입 사이에서 값을 전송하기위한 기반을 `UIViewController`를 상속받은 서브클래스에 제공하기 때문에 `coder`매개변수의 타입으로 쓰인다고 이해하였다.
- `required`는 필수 이니셜라이저에 붙는 키워드로 필수 이니셜라이저를 가진 클래스를 상속한 모든 자식클래스(subclass)는 해당 이니셜라이저를 구현 해야함을 나타낸다.
- `init?` 초기화가 실패할 수도 있는 `Failable` 이니셜라이저이다. 
</br>

```swift
//수정 후
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //뷰컨트롤러 생성
    guard let nextViewController: ExhibitDetailViewController = self.storyboard?.instantiateViewController(
        withIdentifier: "exhibitDetailViewController") as? ExhibitDetailViewController 
    else {
        return
    }
    //프로퍼티에 데이터 전달
    nextViewController.exhibitData = exhibits[indexPath.row]
    ...
}

//수정 전
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //뷰컨트롤러 생성과 데이터 전달
    guard let nextViewController: ExhibitDetailViewController =
            self.storyboard?.instantiateViewController(
                identifier: "exhibitDetailViewController",
                creator: { coder in
                    return ExhibitDetailViewController(exhibitData: exhibits[indexPath.row], coder: coder)
                }
    ) else {
        return
    }
    ...
}
```

#### 레이블의 텍스트에 특정 부분에 원하는 특성을 주기(`NSAttributedString`)
- 만국박람회의 정보를 보여주는 화면에서 `개최지: 프랑스 파리`와 같은 레이블 중 `개최지`부분의 글자만 크게 적용해야하는 내용이 있었다.처음에는 두개의 레이블을 생성하여 각각 구현할까 하다가 `NSAttributedString`이라는 방법을 찾게 되었다. 
    - `NSAttributedString`은 일부 텍스트에 연관된 속성을 가진 문자열이다. 문자열 내에 개별 문자 또는 일정 범위에만 속성을 적용하고 관리한다.
- 먼저 `UILabel`의 `extension`내에 특정 문자의 폰트를 굵게만드는 역할을 하므로 `bold()`라는 메서드를 정의하고, 문자열을 `attributedString`으로 변환한뒤, `addAttribute(_:value:range:)`메서드를 이용한다.
    - `addAttribute(_:value:range:)`은 첫번째 파라미터로 받은 속성에 `value`파라미터로 받은 값을 저장하고, `range`파라미터로 받은 범위 내의 문자에 적용한다.

</br>

```swift
extension UILabel {
    func bold(_ input: String) {
        guard let text = text else { return }
        
        let fontStyle = UIFont.preferredFont(forTextStyle: .body)
        attributedString.addAttribute(.font,
                                      value: fontStyle,
                                      range: (text as NSString).range(of: input))
        
        self.attributedText = attributedString
    }
}
```

---
# 6.참고링크
- [UITableView](https://developer.apple.com/documentation/uikit/uitableview/)
    - [UITableViewDelegate](https://developer.apple.com/documentation/uikit/uitableviewdelegate/)
    - [UITableViewDataSource](https://developer.apple.com/documentation/uikit/uitableviewdatasource/)
- [UINavigationController](https://developer.apple.com/documentation/uikit/uinavigationcontroller/)
    - [pushViewController](https://developer.apple.com/documentation/uikit/uinavigationcontroller/1621887-pushviewcontroller/)
- [JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
    - [Codable](https://developer.apple.com/documentation/swift/codable/)
- [Initializer](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html#)
    - [NSCoding](https://developer.apple.com/documentation/foundation/nscoding/)
- [NSAttributedString](https://developer.apple.com/documentation/foundation/nsattributedstring)
