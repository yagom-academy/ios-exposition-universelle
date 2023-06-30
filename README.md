파리 만국박람회에 대한 안내와 한국의 출품작을 볼 수 있는 앱

> 프로젝트 기간: 2023-06-26 ~ 2023-07-07

## 🕺 팀원
|Erick|비모|
|:-:|:-:|
|<img src="https://user-images.githubusercontent.com/109963294/235300758-fe15d3c5-e312-41dd-a9dd-d61e0ab354cf.png" width="200" height="200">|<img height="200px" src="https://avatars.githubusercontent.com/u/67216784?v=4">
|[Github Profile](https://github.com/h-suo)|[Github Profile](https://github.com/bubblecocoa)|

</br>

## 📝 목차
1. [타임라인](#타임라인)
2. [실행화면](#실행-화면)
3. [시각화된 프로젝트 구조](#시각화된-프로젝트-구조)
4. [트러블 슈팅](#트러블-슈팅)
5. [주요 학습 내용](#주요-학습-내용)
6. [참고링크](#참고링크)
7. [팀회고](#팀회고)

</br>

<a id="타임라인"></a>

# 📆 타임라인  
<table>
    <thead>
        <th style="text-align: center;">날짜</th>
        <th style="text-align: center;">진행 사항</th>
    </thead>
    <tbody>
        <tr>
            <td>2023-06-26</td>
            <td>
                제공된 JSON 데이터와 매칭할 모델 생성
            </td>
        </tr>
        <tr>
            <td>2023-06-27</td>
            <td>
                만국박람회 소개 화면 생성 <br>
                한국의 출품작 리스트 화면 생성 <br>
                JSON Data 디코딩 로직 추가
            </td>
        </tr>
        <tr>
            <td>2023-06-28</td>
            <td>
                출품작 상세보기 화면 생성 <br>
                JSON Data 디코딩 로직을 모델로 분리
            </td>
        </tr>
        <tr>
            <td>2023-06-29</td>
            <td>
                Asset을 이용한 JSON 디코딩 로직을 JSONDecoder에 확장<br>
                코드 개선을 위한 리팩토링
            </td>
        </tr>
        <tr>
            <td>2023-06-30</td>
            <td>
                README 작성
            </td>
        </tr>
    </tbody>
</table>

</br>

<a id="실행-화면"></a>

# 🖥️ 실행 화면
| **만국 박람회 첫 화면** | **첫 화면에서 한국의 출품작 화면으로 이동** |
|:----:|:----:|
|<img src="https://github.com/h-suo/TIL/assets/109963294/aee3d9ab-7382-42e7-b9b0-0a0f2c091b60" width="300"/>|<img src="https://github.com/h-suo/TIL/assets/109963294/483b2103-c0e0-4a39-8c98-127af5a96764" width="300"/>|

| **한국의 출품작 화면에서 여러 데이터를 표시** | **데이터가 담겨있는 행을 누르면 상세보기로 이동** |
|:----:|:----:|
|<img src="https://github.com/h-suo/TIL/assets/109963294/0684e76c-8d5b-4183-aca7-58bcf0614f41" width="300"/>|<img src="https://github.com/h-suo/TIL/assets/109963294/9ee5f26f-1cff-481b-b34e-f3a6cb0b7313" width="300"/>|

</br>

<a id="시각화된-프로젝트-구조"></a>

# 💎 시각화된 프로젝트 구조

## 클래스 다이어그램
**추후 추가 예정**

## 🗂️ 폴더구조
```
Expo1900
├── Controller
│   ├── AppDelegate.swift
│   ├── ExpositionUniverselleViewController.swift
│   ├── ItemDetailViewController.swift
│   ├── ItemsTableViewController.swift
│   └── SceneDelegate.swift
├── Extension
│   └── JSONDecoder+.swift
├── Model
│   ├── AssetName.swift
│   ├── ExpositionUniverselle.swift
│   ├── Item.swift
│   └── NSDataAssetError.swift
└── View
    ├── Base.lproj
    │   └── Main.storyboard
    └── ItemTableViewCell.swift
```

</br>

<a id="트러블-슈팅"></a>

# 🚀 트러블 슈팅

## 1️⃣ JSON Dataset을 이용한 Decode를 위한 메서드 추가

### 🔍 문제점
`ExpositionUniverselleViewController`와 `ItemsTableViewController`에서 사용 될 `data`를 `Assets`에 위치한 `dataset`을 이용해 가져와야 했습니다. `NSDecoder`에서 바로 `asset name`을 이용하여 디코딩 해주는 메서드는 없었기 때문에 해당 로직이 뷰컨트롤러 안에 작성되었습니다. 이 두 뷰컨트롤러에 적지 않은 분량의 `decode` 로직을 작성해주어야 했고, 같은 로직이 반복되고 있었습니다. 또한 해당 로직은 객체지향적 관점에서 `SRP(Single Responsibility Principle, 단일 책임 원칙)`을 준수한다고 볼 수 없었습니다.

### ⚒️ 해결방안
`NSDecoder`에 `Extension`으로 `asset name`과 `generic` 타입을 받는 메서드를 만들었습니다. 이 메서드 추가로 인해 각 뷰 컨트롤러에는 `decode` 역할을 수행하는 로직이 제거되었습니다.

```swift
extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, from assetName: String) throws -> T {
        guard let json = NSDataAsset(name: assetName) else {
            throw NSDataAssetError.assetNotFound
        }
                
        return try JSONDecoder().decode(type, from: json.data)
    }
}
```

</br>

## 2️⃣ ViewController의 init을 이용한 데이터 주입 

### 🔍 문제점
초기에는 첫화면에서 다음 화면으로 넘어갈 때 `ViewController` 내의 프로퍼티로 직접 접근하여 데이터를 넣어줬습니다.
하지만 이럴 경우 `ViewController`의 프로퍼티로의 접근이 쉬워지고 데이터 은닉화가 불가능했습니다.

**변경 전**
```swift
final class ItemsTableViewController: UITableViewController {
    ...
    var navigationTitle: String?
    ...
}

final class ExpositionUniverselleViewController: UIViewController {
    ...
    @IBAction private func tapShowItemsButton(_ sender: UIButton) {
        guard let nextViewController = storyboard?.instantiateViewController(withIdentifier: ItemsTableViewController.id) as? ItemsTableViewController else {
            return
        }
        ...
    }
    ...
}
```

### ⚒️ 해결방안
프로퍼티를 은닉화 해줄 방법으로 데이터를 받을 화면에 `init`을 이용하여 데이터를 넘겨줄 화면에서 데이터를 주입시켜 주는 방식으로 변경하였습니다.

**변경 후**
```swift
final class ItemsTableViewController: UITableViewController {
    ...
    private let navigationTitle: String
    
    init?(navigationTitle: String, coder: NSCoder) {
        self.navigationTitle = navigationTitle
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    ...
}

final class ExpositionUniverselleViewController: UIViewController {
    ...
    @IBAction private func tapShowItemsButton(_ sender: UIButton) {
        guard let nextViewController = storyboard?.instantiateViewController(
            identifier: ItemsTableViewController.id,
            creator: { coder in
                let title = sender.currentTitle?.replacingOccurrences(of: " 보러가기", with: "") ?? ""
                return ItemsTableViewController(navigationTitle: title, coder: coder)
            }
        ) else {
            return
        }
        ...
    }
    ...
}
```

## 3️⃣ catch에서 error.localizedError를 함께 이용

### 🔍 문제점
```swift
private func decodeJSONToItems() {
    do {
        items = try JSONDecoder().decode([Item].self, from: AssetName.items)
    } catch NSDataAssetError.assetNotFound {
        print("JSON Asset을 찾지 못했습니다.") // 에러 내용 프린트1
    } catch {
        print(error.localizedDescription) // 에러 내용 프린트2
    }
}
```
`do-catch`문에서 `NSDataAssetError.assetNotFound`에러가 발생 시 에러 내용을 `print` 해주는 것 이외에 처리해줄만한 것이 없었습니다. `default catch`와 `명시된 catch`문의 내용은 사실상 같았지만, 각각의 `catch`문을 이용한다는 것이 불편했습니다.

### ⚒️ 해결방안
`LocalizedError`를 채택하여 `errorDescription`을 만들어주면 `error.localizedDescription`으로 다른 에러들과 같이 에러에 대한 설명을 볼 수 있습니다.
따라서 에러처리를 따로 해주는 것이 아닌 `LocalizedError`를 이용하여 에러를 한번에 `catch`하여 설명을 출력해주었습니다.

```swift
extension NSDataAssetError: LocalizedError {
    // 연산 프로퍼티 명은 꼭 errorDescription 이어야 합니다.
    public var errorDescription: String? {
        switch self {
        case .assetNotFound:
            return "JSON Asset을 찾지 못했습니다."
        }
    }
}
```

```swift
private func decodeJSONToItems() {
    do {
        expositionUniverselle = try JSONDecoder().decode([Item].self, from: AssetName.items)
    } catch {
        print(error.localizedDescription) // 에러 내용 프린트가 통합되었습니다.
    }
}
```

</br>

<a id="주요-학습-내용"></a>

# 📚 주요 학습 내용

## 1️⃣ prepareForReuse()
<img src="https://github.com/h-suo/TIL/assets/109963294/d38aad70-99d8-49b6-98c1-9176169f2421" width="400">

테이블뷰에서 `tableView(_:cellForRowAt:)`메서드의 `dequeueReusableCellWithIdentifier` 호출 시 `Cell`이 반환되기 전  `UITableCell`을 상속받는 타입에서 항상 호출되는 메서드입니다. `override`하여 재사용 되는 셀의 내용의 기본 값을 지정할 수 있습니다. `override` 시에는 **반드시** `super.prepareForReuse()`를 호출해야 합니다.

`override`된 `prepareForReuse()` 내부의 로직이 많은 리소스를 필요로 하는 경우 별도의 `Cell`을 생성하여 `dequeueReusableCell`시 분기처리 하는것이 좋습니다.

</br>

## 2️⃣ UIImageView Content Mode
뷰가 콘텐츠를 어떻게 배치하는지 결정하는데 사용되는 프로퍼티입니다.

### scaleToFill
- 비율을 유지하지 않고 뷰에 맞게 콘텐츠를 늘려서 채웁니다.
<img src="https://github.com/h-suo/TIL/assets/109963294/fdd83cdc-82f0-48c4-8151-cfa6db04a310" width="200">


### scaleAspectFit
- 비율을 유지하며 콘텐츠를 뷰에 맞춰 넣습니다. (비는 부분은 투명하게 표시합니다.)
<img src="https://github.com/h-suo/TIL/assets/109963294/aa1cbe9f-a683-437e-a432-5fa400b32b73" width="200">

### scaleAspectFill
- 비율을 유지하며 콘텐츠를 뷰에 맞게 채웁니다. (넘어가는 콘텐츠는 잘리게 됩니다.)
<img src="https://github.com/h-suo/TIL/assets/109963294/b0b1ebb2-de5e-4c4e-b454-29d49acd5c64" width="200">

### 그 외 Mode들
- **bottom**
- **bottomLeft**
- **bottomRight**
- **center**
- **left**
- **redraw**
- **right**
- **top**
- **topLeft**
- **topRight**

</br>

<a id="참고링크"></a>

# 🔗 참고링크
- [🍎 Developer Apple - instantiateViewController(identifier:creator:)](https://developer.apple.com/documentation/uikit/uistoryboard/3213989-instantiateviewcontroller)
- [🍎 Developer Apple - JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
- [🍎 Developer Apple - prepareForReuse()](https://developer.apple.com/documentation/uikit/uitableviewcell/1623223-prepareforreuse)
- [🍎 Developer Apple - contentMode](https://developer.apple.com/documentation/uikit/uiview/1622619-contentmode)
- [🍎 Developer Apple - LocalizedError](https://developer.apple.com/documentation/foundation/localizederror)
- [김종권 블로그 - Error, LocalizedError, localizedDescription](https://ios-development.tistory.com/849)

</br>

<a id="팀회고"></a>

# 🙆🏻 팀회고
**추후 추가 예정**
