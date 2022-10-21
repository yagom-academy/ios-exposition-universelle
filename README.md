## 야곰 아카데미
# README - 만국박람회

## iOS 커리어 스타터 캠프
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
| 날짜 | 중요 진행 상황&nbsp; | 코드 관련 사항 |
|---|---|---|
|10/18| `STEP1` 구현 | JSON데이터를 분석할 ExhibitData, ExpositionData 구조체 구현
|10/20| `STEP2` 구현 | ExpositionViewController의 UI요소 생성 및 구성(configureView()), JSONDecode의 parse메서드 생성, 
|10/21| `STEP2` 구현 | ExhibitViewController와 테이블 뷰 생성 및 ExhibitTableVIewCell 생성, </br>화면 전환 기능 구현, ExhibitDetailViewController의 UI요소 생성 및 구성


# 3.시각화된프로젝트구조
<img src="https://i.imgur.com/LmRGwvy.png" width=600>

# 4.실행화면
(오토레이아웃 반영 후 추가 예정)

---
# 5.트러블슈팅
### 1️⃣ Step1
#### JSON 포맷 데이터의 `decodable` 프로토콜 채택
- 데이터를 주고받을때, 특정 포맷으로 변환하기 위해 `codable`프로토콜을 채택한다.
그리고 `Codable`은 `encodable & decodable`의 type alias인데, 이번 프로젝트에서는 `encoding`의 과정이 없기때문에 `decodable`프로토콜만 채택했다.
➡️ 나중의 확장성을 고려한다면 `Codable`을 채택하는 것이 맞지만, 아직 니즈가 없는데 미리 만들어두는 오버엔지니어링을 하게된다. 오버엔지니어링의 단점은 추후 기획이 변경되었을 때 유연한 대응이 어렵다는 것이다.

### 2️⃣ Step2
#### JSONDecoder의 extension
- JSON을 디코딩할때마다 `JSONDecoder`인스턴스가 불필요하게 여러번 생성되어 메모리가 낭비되는 부분을 보완하기 위해 JSONDecoder클래스에 타입 프로퍼티인 `jsonDecoder`을 생성하여 인스턴스가 한번 생성되도록 구현했다. (비용이 많이드는 object인`DateFormatter`를 활용하는 방법에서 배운 방법이다.)

```swift
static let jsonDecoder: JSONDecoder = .init()
```
</br>

- 프로젝트 내에서 JSON데이터를 디코딩할때, 반복되는 부분을 줄이고 하나의 메서드로 묶은 뒤 제네릭 타입을 이용해서 원하는 타입대로 디코딩할 수 있는 메서드를 구현했다.
    
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
</br>

#### 화면 전환 방법 `NavigationController`사용 / `Segue`사용
- `NavigationController`사용한 방법</br>
**장점** : 코드로 명시적으로 지정할 수 있어 실수할 가능성이 적다.</br>
**단점** : 스토리보드상에서 화면의 흐름을 한눈에 볼 수 없다.</br>
- `Segue`사용한 방법</br>
**장점** : 구현방법이 간단하다.(스토리보드 ctrl + drag)</br>
**단점** : `Segue`식별자 지정하는 것을 빠뜨리거나 하는 등의 실수할 가능성이 높다. 어떤 Segue가 어떤 식별자이름인지 일일히 확인해야 한다. `Segue`가 많아졌을때, 스토리보드 화면이 복잡해진다.</br>
- 스토리보드에서 발생하는 에러는 빌드하여도 에러로 잡히지 않기때문에 나중에 원인을 찾기가 쉽지 않다. 두가지 방법 중 에러날 가능성이 적은 NavigationController사용한 방법으로 구현했다.

```swift
guard let nextViewController: ExhibitViewController = self.storyboard?.instantiateViewController(withIdentifier: "exhibitViewController") as? ExhibitViewController else {
    return
}
        
self.navigationController?.pushViewController(nextViewController, animated: true)
```
</br>

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

---
# 6.참고링크
[UITableView](https://developer.apple.com/documentation/uikit/uitableview/)

[UITableViewDelegate](https://developer.apple.com/documentation/uikit/uitableviewdelegate/)

[UITableViewDataSource](https://developer.apple.com/documentation/uikit/uitableviewdatasource/)

[pushViewController](https://developer.apple.com/documentation/uikit/uinavigationcontroller/1621887-pushviewcontroller/)

[JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)

[Codable](https://developer.apple.com/documentation/swift/codable/)
