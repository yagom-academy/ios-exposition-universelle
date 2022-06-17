
# 만국박람회 프로젝트 🏛
## 🪧 목차
- [📜 프로젝트 내용](#-프로젝트-내용)
- [👨‍👨‍👦‍👦 팀원 및 리뷰어](#-팀원-및-리뷰어)
- [🗓 타임라인](#-타임라인)
- [🏗 프로젝트 구조](#-프로젝트-구조)
- [⚡️ 트러블 슈팅](#%EF%B8%8F-트러블-슈팅)
- [📱 실행 화면](#-실행-화면)
- [🔗 참고 링크](#-참고-링크)
<br>

## 📜 프로젝트 내용
> 만국박람회 행사 소개, 한국의 출품작, 그리고 각 출품작별 상세 설명 화면으로 구성된 앱입니다.
> 
> 각 작품별 Image Set과 JSON 데이터를 가져와 Swift 컨벤션에 맞게 변환하고, Table View를 이용해 화면에 표시해주었습니다.
> 
> Table View, JSON, Codable, Navigation, Delegation, Design Patterns(MVC) 등의 개념을 활용했습니다.
> 
<br>

## 👨‍👨‍👦‍👦 팀원 및 리뷰어
- **minsson**🎾 (@minsson) 
- **Judy**🐰 (@Judy-999) 
- 리뷰어: **하리보**🧸(@HARIBO)
<br>

## 🗓 타임라인
> **프로젝트 기간** : 22.06.13 ~ 22.06.24

### 1주차  
**6월 13일 (월): Step 1 기능 구현 및 PR**
- Assets에 Json 데이터 추가
- 파싱한 데이터를 담을 **Content**와 **Exposition** 타입 구현
- README 작성

**6월 14일 (화): Step 1 리팩토링 및 Step 1 Merge 완료**
- 타입이 Codable대신 Decodable을 채택하도록 수정
- Assets에서 JSON 파일을 폴더로 분리

**6월 15일 (수): Step 2 기능 구현**
- 메인 페이지 UI 구현
- 박람회 데이터를 디코딩하는 메서드 구현 및 화면에 표시
- 에러 케이스를 담은 **DataHandlingError** 타입 구현

**6월 16일 (목): Step 2 기능 구현**
- 메인 페이지의 방문객 수에 쉼표를 넣는 메서드 구현
- 한국의 출품작 테이블 뷰 화면 생성 및 이동
- Custom Cell 생성
- 출품작 데이터를 디코딩하는 메서드 구현 및 화면에 표시

**6월 17일 (금): Step 2 기능 구현 및 PR**
- 출품작 별 상세 페이지 UI 구현
- segue를 이용한 화면이동 및 데이터 전달 구현
- 전달받은 데이터로 출품작 데이터 표시

### 2주차
**6월 21일 (월):**
**6월 22일 (화):**
**6월 23일 (수):**
**6월 24일 (목):**
<br>

## 🏗 프로젝트 구조
![](https://i.imgur.com/jRIRS16.png)
<br>

## 📱 실행 화면

|메인화면 1|메인화면 2|
|:------:|:-----:|
| ![](https://i.imgur.com/PTsQQdM.png) | ![](https://i.imgur.com/xsI1KI1.png) |


|한국의 출품작 화면|출품작 상세 화면|
|:-----------:|:----------:|
| ![](https://i.imgur.com/jXklHIW.png) | ![](https://i.imgur.com/thUc8JB.png) |

<br>

## ⚡️ 트러블 슈팅
### 1. 출품작 리스트 화면에서 출품작별 페이지로의 데이터 전달 방식

#### 1) [문제점] 처음에 생각한 데이터 전달 방식

> **ContentViewController 내부에 프로퍼티를 생성하지 않고 데이터를 전달하는 방식**
> 
- `KoreanContentListViewController`에서 `prepare(for:sender:)`를 통해 `ContentViewController`에 데이터를 전달받고, 전달 받은 메서드 내에서 UI를 세팅해, `ContentViewController`에는 저장속성을 별도로 정의하지 않고자 함
- 사용하고자 했던 코드는 아래와 같음

##### KoreanContentListViewController 내부 prepare(for:sender:) 메서드 내부

```swift
contentViewController.recieveData(content[indexPath.row])
```

##### ContentViewController의 메서드
```swift
func receiveContentData(_ data: Content) {
    setData(of: data)
}
    
private func setData(of data: Content) {
    itemImageView.image = UIImage(named: data.imageName)
    descriptionLabel.text = data.description
}
```

##### 에러 발생
![](https://i.imgur.com/XPcRGBr.png)


#### 2) [문제 원인] ViewController와 View에 대한 개념 이해 부족
- 구글링 결과, 아웃렛 변수들이 메모리에 올라가기 전 접근했기 때문에 에러가 발생했다는 글을 볼 수 있었음
    `@IBOutlet private weak var contentImageView: UIImageView!`
    `@IBOutlet private weak var descriptionLabel: UILabel!`
- `guard let contentViewController = segue.destination as? ContentViewController else { return }` 라는 코드에서 에러가 발생하지 않는다는 것은 `contentViewController` 클래스의 인스턴스가 생성된 상태라는 것을 의미하고, 이는 메모리에도 올라간 상태라는 걸 의미한다고 생각함
- `contentViewController` 클래스의 인스턴스가 생성되었다면, 내부의 아웃렛 변수도 초기화 되었을 것이라고 생각해, 메모리에 올라가기 전에 접근했다는 점을 이해하기 어려웠음

#### 3) [개념 재정립] ViewController와 View는 별개의 개념
- ViewController의 인스턴스가 생성되었다고 해서 View가 생성된 것은 아님
- 아웃렛 변수들은 View에서 코드로 가져오는 것이므로, View가 생성되지 않았다면 접근할 수 없음
- ViewController 인스턴스 생성 -> View 생성하면서 `loadView()`를 호출 -> View 생성이 완료되면서 `viewDidLoad()`를 호출 -> 이 시점부터 View의 데이터에 접근 가능
- 관련 메서드 정의부 내부에 `print(#function)`을 작성하면 메서드의 호출 순서를 볼 수 있음
    ##### 관련 코드
    ```swift
    prepare(for:sender:)
    loadView()
    viewDidLoad()
    ```
    

#### 4) [해결책] 현재 프로젝트에서 사용한 방식
> **`ContentViewController`에 `private var content: Content?`를 정의**
- `ContentViewController`에 `content` 저장 속성과 `receiveContentData(_:)` 메서드 정의
- `KoreanContentListViewController`에서 `receiveContentData(_:)` 메서드를 통해 데이터를 전달받음
- 전달받은 데이터를 화면에 표시하기 위한 `setUIComponents()` 메서드를 정의
- `viewDidLoad()`에서 `setUIComponents()` 메서드를 실행
- View가 생성된 후에 `setUIComponents()` 메서드를 통해 아웃렛 변수에 접근해 값을 수정하므로, 트러블 슈팅 완료

##### 관련 코드
```swift
    private var content: Content?

    func receiveContentData(_ data: Content) {
        content = data
    }
    
    private func setUIComponents() {
        guard let content = content else { return }
        contentImageView.image = UIImage(named: content.imageName)
        descriptionLabel.text = content.description
        title = content.name
    }

```

### 2. 출품작 리스트 화면에서 출품작별 페이지로의 화면이동 
#### 방식 1) prepare(for:sender:)만 사용 
- 장점: `prepare(for:sender:)` 함수만 사용해서 간편함
- 단점: 데이터를 전달하기 위해 파라미터인 sender에서 indexPath값을 추출해야 함
#### 방식 2) performSegue(withIdentifier:sender:) 사용
- 장점: sender로 indexPath값을 보내 전달할 데이터를 쉽게 얻을 수 있음
- 단점: `prepare(for:sender:)`와 `tableView(_: didSelectRowAt:)` 모두 사용해야 함
#### 방식 3) instantiateViewController(withIdentifier:) 사용
- 장점: `tableView(_: didSelectRowAt:)`에서만 처리할 수 있음
- 단점: segue 없이 코드로만 되어 있어 직관적이지 못함 
<br>
> **프로젝트 내에서는 두 번째 방식인 performSegue, prepare 사용**
> 근거: segue를 이용해 화면 이동을 구현하는 것이 가장 직관적으로 느껴졌음. 테이블 뷰의 델리게이트 함수인 `tableView(_: didSelectRowAt:)` 함수 역시 사용해보는 것이 좋다고 생각함.

### 3. catch 에러처리
- 디코딩하는 동안 발생할 수 있는 에러를 처리하기 위해 `DataHandlingError` 타입을 구현
- `DataHandlingError`과 관련된 에러는 지정한 **description**을 출력
- 추가적으로 그 외 모든 에러를 처리하기 위한 마지막 `catch` 블럭이 필요한데, 추가적으로 처리해야할 작업을 판단하기 어려웠음. 구글링을 통해 아래 코드와 같이 처리할 수 있다는 점을 알게되어 적용함

```swift
do {
    contents = try decodeContentData()
} catch let error as DataHandlingError {
    print(error.description)
} catch {
    print("Unexpected error: \(error)") 
}
```
- 단순히 어떤 에러인지 출력하는 코드라면, 이러한 처리 방식이 어떤 것을 의도한 것인지 의문이 생김
- 현재 프로젝트에서는 별도로 처리할 동작이 없어 이런 처리 방식도 유효하지만, 현업에서는 어떻게 처리하는지 알고 싶어짐


### 4. tableView(_:cellForRowAt:) 메서드의 로직

- 셀의 Accessory와 내부 UI에 대한 속성을 코드로 설정
- `ContentCell`은 Custom한 셀이라 테이블 뷰가 있는 `KoreanContentListViewController` 자체에서 셀에 접근이 어려움
- 해결방안으로 `ContentCell`에서 `UITableCell`의 메서드를 이용하는 방법을 고민
- `prepareForReuse` 또는 `init(style:reuseIdentifier:)`와 같은 함수로 시도하였으나 적절하지 않았음

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = contentTableView.dequeueReusableCell(withIdentifier: "contentCell", for: indexPath) as? ContentCell ?? ContentCell()
    let currentContent = contents[indexPath.row]
    
    // cell의 UI 요소의 attribute 설정
    cell.descriptionLabel.numberOfLines = 0
    cell.titleLabel.font = .preferredFont(forTextStyle: .title2)
    cell.accessoryType = .disclosureIndicator
    
    // cell의 내용 채우기
    cell.contentImageView.image = UIImage(named: currentContent.imageName)
    cell.titleLabel.text = currentContent.name
    cell.descriptionLabel.text = currentContent.shortDescription
        
    return cell
}
```
> **프로젝트 내에서 처리한 방식**
결국 위에 코드처럼 `tableView(_:cellForRowAt:)`에서 셀의 속성에 대한 처리도 진행함

- 셀의 속성은 계속 변경할 필요 없이 한 번만 설정하면 되는데`tableView(_:cellForRowAt:)` 함수가 불릴 때마다 불필요하게 코드가 실행됨
- 하나의 함수에서 셀의 내용과 속성을 동시에 설정하는 것이 적절하지 못하다고 생각함
- 위 두 가지 이유로 다른 곳에서 처리 가능한지 고민

### 5. 메인화면의 setAllImages 메서드에서 이미지를 불러오는 방법

#### 1) #imageLiteral 사용
- 장점: 어떤 이미지가 들어가게 될지 코드 상에 시각적으로 보여 직관적
- 단점: 이미지가 동적으로 변경되어야 하는 경우 사용할 수 없음
#### 2) UIImage(named:) 사용
- 장점: 이미지를 동적으로 변경할 수 있음
- 단점: 코드 상에서는 이미지 파일명을 통해 어떤 이미지일지 파악해야 함

> **프로젝트 내에서는 #imageLiteral을 사용**
> 근거: 현재 관련 이미지가 정적으로 고정된 상태이므로, 코드 내에서 이미지를 시각적으로 볼 수 있는 #imageLiteral이 더 유용하다고 생각함

### 6. prepare 함수의 위치
- `prepare` 함수를 통해 segue로 화면이 이동하기 전에 작업 수행 가능 
- 해당 함수의 적절한 위치를 고민

#### 1) ViewController 내부
- 새로운 파일을 생성할 때 Cocoa Touch Class에서 `UIViewController`를 선택하면 자동으로 ViewController 내부에 주석처리된 채로 `prepare` 함수가 존재

#### 2) 확장하여 UITableViewDelegate를 채택한 부분 (performSegue 위에)
- 실제로 `performSegue` 함수를 실행하여 `prepare` 함수를 호출하는 위치는 테이블 뷰 델리게이트의 함수인 아래와 같음
```swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "contentViewSegue", sender: indexPath)
}
```


따라서 UITableViewDelegate를 확장한 내부에서 `tableView(_: didSelectRowAt:)` 함수 정의부 상단에 배치하는게 적절하다고 생각해 위치를 현재 위치로 결정함

### 7. segue의 네이밍
- 스토리보드에서 테이블 뷰인 한국의 출품작 화면에서 출품작 상세 화면으로 이동하는 segue를 지정 
- `ContentViewController`로 넘어간다는 의미로 **contentViewSegue**로 식별자를 지정 
- 방향성을 나타내는 `to`나 다른 표현을 사용하는지 segue의 네이밍 컨벤션이 궁금해짐

<br>

## 🔗 참고 링크
[Table Views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)
[Filling a Table with Data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data(https://developer.apple.com/documentation/uikit/uitableview))
[JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
[Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
