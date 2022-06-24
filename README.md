
# 만국박람회 프로젝트 🏛
## 🪧 목차
- [👨‍👨‍👦‍👦 팀원 및 리뷰어](#-팀원-및-리뷰어)
- [📜 프로젝트 내용](#-프로젝트-내용)
- [📱 실행 화면](#-실행-화면)
- [🏗 프로젝트 구조](#-프로젝트-구조)
- [🗓 타임라인](#-타임라인)
- [⚡️ [Step 2] 트러블 슈팅](#%EF%B8%8F-step-2-트러블-슈팅)
- [⚡️ [Step 3] 트러블 슈팅](#%EF%B8%8F-step-3-트러블-슈팅)
- [🔗 참고 링크](#-참고-링크)
<br>

## 👨‍👨‍👦‍👦 팀원 및 리뷰어
- **minsson**🎾 (@minsson) 
- **Judy**🐰 (@Judy-999) 
- 리뷰어: **하리보**🧸(@HARIBO)
<br>

## 📜 프로젝트 내용
> 만국박람회 행사 소개, 한국의 출품작, 그리고 각 출품작별 상세 설명 화면으로 구성된 앱입니다.
> 
> 각 작품별 Image Set과 JSON 데이터를 가져와 Swift 컨벤션에 맞게 변환하고, Table View를 이용해 화면에 표시해주었습니다.
> 
> Table View, JSON, Codable, Navigation, Delegation, Design Patterns(MVC) 등의 개념을 활용했습니다.
> 
<br>

## 📱 실행 화면

| 앱 전체 구동화면 |
| :--: |
|![만국박람회_소개](https://user-images.githubusercontent.com/96630194/175500562-8e6aa740-5b78-4504-8d8d-84d587fc71df.gif)|

|메인화면 1|메인화면 2|
|:------:|:-----:|
| ![](https://i.imgur.com/EfQMVbH.png)| ![](https://i.imgur.com/pozoglJ.png)|


|한국의 출품작 화면|출품작 상세 화면|
|:-----------:|:----------:|
| ![](https://i.imgur.com/Ve8UsMw.png) | ![](https://i.imgur.com/XBsY7a6.png)|


<br>

## 🏗 프로젝트 구조
![](https://i.imgur.com/jRIRS16.png)
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
**6월 20일 (월):** : 리뷰를 기다리며 개인 공부(코드로 뷰 만들기)

**6월 21일 (화):** : Step 2 리팩토링
- 불필요한 프레임워크 제거
- 메서드의 네이밍 또는 위치 변경
- 같은 역할을 하는 메서드는 하나로 통합
- 셀의 속성과 내용을 채우는 위치 변경

**6월 22일 (수):** : Step 2 마무리 및 Step 3 시작
- 셀의 높이를 동적으로 변경
- 첫 번째 화면의 오리엔테이션을 세로로 고정
- 버튼과 레이블에 다이나믹타입 적용

**6월 23일 (목):** : Step 3 진행
- 화면 오리엔테이션 고정하는 방식 변경
- 오토레이아웃 오류 수정

**6월 24일 (금):** : Step 3 PR 제출 및 README 작성
<br>

## ⚡️ [Step 2] 트러블 슈팅
### 1. 출품작 리스트 화면에서 출품작별 페이지로의 데이터 전달 방식

#### [문제점] 처음에 생각한 데이터 전달 방식

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


#### [문제 원인] ViewController와 View에 대한 개념 이해 부족
- 구글링 결과, 아웃렛 변수들이 메모리에 올라가기 전 접근했기 때문에 에러가 발생했다는 글을 볼 수 있었음
    `@IBOutlet private weak var contentImageView: UIImageView!`
    `@IBOutlet private weak var descriptionLabel: UILabel!`
- `guard let contentViewController = segue.destination as? ContentViewController else { return }` 라는 코드에서 에러가 발생하지 않는다는 것은 `contentViewController` 클래스의 인스턴스가 생성된 상태라는 것을 의미하고, 이는 메모리에도 올라간 상태라는 걸 의미한다고 생각함
- `contentViewController` 클래스의 인스턴스가 생성되었다면, 내부의 아웃렛 변수도 초기화 되었을 것이라고 생각해, 메모리에 올라가기 전에 접근했다는 점을 이해하기 어려웠음

#### [개념 재정립] ViewController와 View는 별개의 개념
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
    

#### [해결책] 현재 프로젝트에서 사용한 방식
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
<br>

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

> **프로젝트 내에서는 두 번째 방식인 performSegue, prepare 사용** <br>
> 근거: segue를 이용해 화면 이동을 구현하는 것이 가장 직관적으로 느껴졌음. 테이블 뷰의 델리게이트 함수인 `tableView(_: didSelectRowAt:)` 함수 역시 사용해보는 것이 좋다고 생각함.

<br>

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
<br>

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
<br>

### 5. 메인화면의 setAllImages 메서드에서 이미지를 불러오는 방법

#### 1) #imageLiteral 사용
- 장점: 어떤 이미지가 들어가게 될지 코드 상에 시각적으로 보여 직관적
- 단점: 이미지가 동적으로 변경되어야 하는 경우 사용할 수 없음
#### 2) UIImage(named:) 사용
- 장점: 이미지를 동적으로 변경할 수 있음
- 단점: 코드 상에서는 이미지 파일명을 통해 어떤 이미지일지 파악해야 함

> **프로젝트 내에서는 #imageLiteral을 사용**
> 근거: 현재 관련 이미지가 정적으로 고정된 상태이므로, 코드 내에서 이미지를 시각적으로 볼 수 있는 #imageLiteral이 더 유용하다고 생각함

<br>

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
<br>

### 7. segue의 네이밍
- 스토리보드에서 테이블 뷰인 한국의 출품작 화면에서 출품작 상세 화면으로 이동하는 segue를 지정 
- `ContentViewController`로 넘어간다는 의미로 **contentViewSegue**로 식별자를 지정 
- 방향성을 나타내는 `to`나 다른 표현을 사용하는지 segue의 네이밍 컨벤션이 궁금해짐
<br>

## ⚡️ [Step 3] 트러블 슈팅
### 1. 메인 화면의 오리엔테이션 고정
#### [문제점]
- 첫 번째 화면, 즉 메인 화면은 세로로 고정하는 요구사항이 존재
- 이를 적용하기 위해 다음과 같은 시도를 했으나 해결되지 않는 문제가 발생함
<br>

#### 1) 첫 번째 시도
- `AppDelegate`에서 세로로 고정하는지 확인하는 `Bool` 변수인 **isVerticalOrientationBlocked**를 선언
- `application(_:supportedInterfaceOrientationsFor:)` 메서드에서 방향을 결정하는 로직 작성

```swift
var isVerticalOrientationBlocked = true

func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    if isVerticalOrientationBlocked {
	return .portrait
    } else {
	return .all
    }
}
```

<br>

- 첫 번째 뷰 컨트롤러인 `MainViewController`에서 `AppDelegate`의 인스턴스를 가져옴
- 뷰가 생길 때(`viewWillApper`) 세로 고정을 설정
- 뷰가 사라질 때(`viewWillDisappear`) 세로 고정 풀기

```swift
// MainViewController.swift
private let appDelegate = UIApplication.shared.delegate as? AppDelegate ?? AppDelegate()

override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    appDelegate.isVerticalOrientationBlocked = true
}

override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    appDelegate.isVerticalOrientationBlocked = false
}
```

- 테스트 결과 메인 화면은 세로로 고정이 되고, 다른 뷰는 회전 가능 확인
<br>

#### [문제점]
- 회전한 상태로 이동을 하면 다음 뷰는 세로로 고정이 되지 않은 상태임에도 바로 회전이 적용되지 않음
- 하지만 다시 회전을 반복하면 적용이 돼있음을 확인 가능
<br>

#### 첫 번째 시도의 결과
> - 첫 번째 화면 세로 고정 잘 적용됨
> - 첫 번재 화면에서 가로로 회전 후 두 번째 화면으로 넘어가면 화면 전환이 바로 적용되지 않음
> - 두 번째 화면에서 가로로 회전 후 첫 번째 화면으로 돌아오면 세로 고정이 바로 적용되지 않음
> - 위 두 가지 경우 모두 바로 적용만 안 될 뿐 다시 회전해보면 적용이 되어 있음

<br>

#### [고민한 점]
- 뷰의 라이프 사이클을 혼동하여 화면의 오리엔테이션을 적용하는 시점이 문제일 수 있다고 생각해서 해결해보려 함
<br>

![](https://i.imgur.com/0on04L0.png)

<br>

- 위 사진과 같이 함수가 호출되는 순서와 시점을 확인하면서 아래와 같은 경우로 실험함
<br>

 |세로고정 적용|세로고정 해제|
 |:--------:|:-------:|
 | 첫 번째 뷰의 `willAppear`  | 첫 번째 뷰의 `willDisapper` |
 | 첫 번째 뷰의 `willAppear`  | 첫 번째 뷰의 `DidDisapper`  |
 | 첫 번째 뷰의 `viewDidLoad` | 첫 번째 뷰의 `willDisapper` |
 |  첫 번째 뷰의 `viewLoad`   | 첫 번째 뷰의 `willDisapper` |
 | 첫 번째 뷰의 `willAppear`  |  두 번째 뷰의 `willAppear`  |
 | 첫 번째 뷰의 `viewDidLoad` | 두 번째 뷰의 `viewDidLoad`  |

- 위의 모든 경우를 해봤음에도 해결되지 않음
- 적용 시점의 문제는 아닌 것으로 결론을 내림

<br>

#### 2) 두 번째 시도

- 위의 문제와 더불어 `AppDelegate`의 인스턴스를 직접 사용하는 것이 마음에 걸림
- `UIViewController`에 **뷰 컨트롤러가 지원하는 인터페이스 방향**인 `supportedInterfaceOrientations` 프로퍼티가 있음을 알게 됨
<br>

#### [문제점]
- `supportedInterfaceOrientations`의 공식문서를 살펴 본 결과 해당 뷰의 루트 뷰 또는 최상위 뷰의 오리엔테이션을 따라감
- 따라서 오리엔테이션을 변경하는 뷰의 `supportedInterfaceOrientations` 값을 설정해도 최상위 뷰인 네비게이션 뷰 컨트롤러의 오리엔테이션이 다르면 변경한 오리엔테이션이 적용되지 않음
<br>

```swift
class NavigationController: UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.topViewController?.supportedInterfaceOrientations ?? [.all]
    }
}
```

#### [해결방법]

- `UINavigationController`을 상속한 클래스를 생성
- 스토리보드의 `NavigationViewController`에 클래스 연결
- `supportedInterfaceOrientations`는 네비게이션 스택의 가장 위의 뷰(=`topViewController`)의 오리엔테이션 값을 가지도록 설정
- 결과: 세로 고정 적용 됨
<br>

#### [고민한 점]
- 혹시 이전 방법의 문제도 루트 뷰의 오리엔테이션을 따라가기 때문인지 확인해봄
<br>

#### 두 번째 시도의 결과
> - 첫 번째 화면 세로 고정 잘 적용됨
> - 첫 번재 화면에서 가로로 회전 후 두 번째 화면으로 넘어가면 화면 전환이 바로 적용 안 됨 -> 해결 ❌
> - 두 번째 화면에서 가로로 회전 후 첫 번째 화면으로 돌아오면 세로 고정이 바로 적용되지 않던 문제 -> 해결 ⭕️

- 두 번째 문제는 해결이 되고, 첫 번째 문제는 해결되지 않음
<br>

#### 3) 세 번째 시도

- 혹시 시뮬레이터에서 회전을 감지하는 오류가 있는건가 의문이 듦
- 직접 기기에 빌드해서 확인해 본 결과 기기에서도 해당 문제는 해결되지 않음

<br>

#### 해결되지 않은 문제의 예시
![](https://i.imgur.com/3Lmcqls.gif)


<br>

### 2. 테이블 뷰 셀 이미지의 크기

#### [원했던 것]
1) 셀 이미지 width를 superView의 width 대비 30% 이다
2) 우측의 다이나믹 타입이 적용된 텍스트 크기가 달라지더라도 이미지는 superView의 width 대비 30%를 유지한다
<br>

#### [문제점] 잘못된 제약 설정
1) `Content Image View.width = 0.3 x width @1000`
    - 위에서 작성한 `원했던 것`을 실행하기 위한 제약 조건
    - 결과적으로 올바른 제약이었음
2) `Content Image View.height = 100 @750`
    - 이미지의 비율이 유지되기 때문에, 논리적으로는 없어도 생각했던 제약
    - 컴파일러가 높이를 지정해주지 않으면 에러를 발생시키기에 설정
    - 이 제약식의 priority는 750이므로, 무조건 너비에 대한 조건이 우선할 것이라고 생각함
    - 따라서, 이 제약식에는 어떤 숫자를 넣어도 아무런 효력이 발생하지 않을 것이라고 생각함
    - 결과적으로 이 제약이 문제였음

> 처음에는 모두 잘 설정된 것으로 보였으나, 이미지 높이를 200 등으로 변경하니, 
> **화면 너비 비율에 대한 조건을 무시하고 높이에 맞춰 이미지 크기가 변경하는 것을 알 수 있었음**
<br>

#### [문제원인] 서로 상충하지 않는 제약에 대한 우선순위 지정과 논리 오류
1) `Content Image View.width = 0.3 x width @1000`
2) `Content Image View.height = 100 @750`

- 위 제약식 2개는 `같은 대상`에 대해 제약을 거는 것이 아니므로, 우선순위를 설정하는 것은 의미가 없음
- 유동적인 width와 달리 height는 고정적이므로 서로 상충하는 조건이지만 Autolayout은 에러를 발생시키지 않음
- 두 제약 조건 중 어떤 것이든 constant를 수정할 때마다 이미지 크기는 두 조건 중 하나를 따르며, 그 기준은 알 수 없었음
    (constant를 바꾸다보면 몇 분 전과 같은 값임에도 불구하고 빌드한 결과물이 달라지는 경우가 있었음)
<br>

#### [개념재정립]
- priority에 대한 설정은 서로 같은 대상을 지정할 때만 유효하다
- Autolayout은 같은 대상에 대한 설정이 상충하지 않는 한 오류나 워닝을 표시하지 않는다
<br>

#### [해결책]
너비가 유동적으로 변하는 것이 목적이므로, 높이는 너비에 비례하게 설정함

> <전> `Content Image View.height = 100 @750`
<후> `Content Image View.height = Content Image View.width`

<br>

### 3. 셀의 동적인 높이 설정과 스택 뷰의 Distribution 관계
- 출품작의 설명이 길면 `'...'`으로 잘리는 경우가 있음
- 요구사항에 따라 셀의 높이를 유동적으로 조절하도록 함

```swift
contentTableView.rowHeight = UITableView.automaticDimension
```
<br>

#### [문제점]
- 예상과 달리 셀의 높이가 조절되지 않음
- 찾아본 결과 Constraint가 알맞게 적용되어 있어야 한다는 것을 알게 됐지만 해당 `Label`이 들어있는 스택 뷰의 Constraint는 문제를 찾을 수 없음


#### [해결방법]
- 혹시나 해서 스택 뷰의 distribution을 **Fill Proportionally**에서 **Equal Spacing**으로 변경
- 셀의 유동적인 높이가 적용됨

<br>

- distribution 변경에 따른 셀 높이 변경가능 결과 
> - **Fill**: 높이 유동적 가능은 하지만 Constraint 경고
> - **Fill Equally**: 늘어나긴 하는데 길어지면 이상함
> - **Fill Proportionally**: 셀의 기본 높이로 나옴
> - **Equal Spacing**: 높이 유동적 가능
> - **Equal Centering**: 높이 유동적 가능

<br>

#### [의문]
- **Fill Proportionally**일 때는 적용되지 않은 문제를 고민
- `Label`의 크기가 늘어나야 셀의 높이가 늘어날 수 있는데 **Fill Proportionally**는 `Label`에 맞춰 글자를 우겨넣었다고 생각함
- 위의 생각이 맞는건지, 왜 distribution의 차이에 따라 셀의 유동적인 높이 적용 여부가 달라지는지 궁금함

<br>

### 4. 출품작 상세 페이지의 이미지 높이
#### [문제점]
- 마지막 뷰에는 출품작의 이미지와 설명이 들어있음 
- 대부분 알맞게 나왔지만 세로로 된 이미지, 특히 **<해금>** 항목은 아래와 같이 이미지의 높이가 비정상적으로 크게 나오는 문제 발생


<img src="https://i.imgur.com/T6guLYQ.png" width="50%" height="50%">

<br><br>

- 이미지의 높이를 일괄적으로 지정해주면 잘 나오던 다른 항목의 이미지의 높이가 변경되는 문제가 생김
- 높이가 높은 경우에만 제약을 주고 싶었음

#### [해결방법]
- 이미지 높이 제약을 200으로 설정한 후 `Equal`이 아닌 `Less Than Or Equal`로 하여 이미지의 높이가 큰 경우에만 해당 제약을 받도록 함

<br>

### 5. 아이폰 기종별 화면 하단의 여백 차이
#### [문제점]
- 물리적 버튼이 없는 신형 아이폰 기종에서 스크롤뷰의 끝단과 화면 하단 간의 간격이 의도했던 것보다 더 떨어짐

 | |물리적 홈버튼이 있는 모델|물리적 홈버튼이 없는 모델|
 |:---: |:--------:|:-------:|
 | 수정 전 |<img src="https://i.imgur.com/8TseuH1.png" width="300">| <img src="https://i.imgur.com/Hxso8kM.png" width="300">|
 | 수정 후 | <img src="https://i.imgur.com/8TseuH1.png" width="300"> | <img src="https://i.imgur.com/kQyUJwU.png" width="300">|
 
<br>

#### [문제원인] 
기종별 SafeArea의 영역 차이에 대한 고려 없이 물리적 홈버튼이 없는 모델만을 고려한 오토레이아웃 설정

`Safe Area.bottom = Scroll View.bottom + 20`

- 물리적 홈버튼이 있는 모델: SafeArea와 Super View의 bottom이 동일
- 물리적 홈버튼이 없는 모델: SafeArea의 bottom이 Super View의 bottom에서 일정 간격 떨어져 있음

##### Safe Area가 차지하는 높이
물리적 홈버튼이 없는 모델
- top : 44pt
- bottom : 34pt

물리적 홈버튼이 있는 모델
- top : 20pt
- bottom : 0pt
<br>

#### [해결방법]
##### 수정 전:
`Safe Area.bottom = Scroll View.bottom + 20 @750`
##### 수정 후:
`Safe Area.bottom = Scroll View.bottom + 20 @750`
`Superview.bottom <= Scroll View.bottom + 24`

##### 새로 추가한 `Superview.bottom <= Scroll View.bottom + 24`의 의미:

1) 스크롤뷰의 하단과 화면의 하단 사이의 간격이 24 이하가 되도록 함
    - 홈버튼이 없는 아이폰의 경우 기본적으로 SafeArea와 화면 하단 간의 거리가 있으므로, 이 제약 조건에 의해서 스크롤뷰의 하단과 화면의 하단 사이의 간격이 24 이하가 됨
2) 위 조건이 만족된다면, 스크롤뷰의 하단과 화면의 하단 사이의 간격은 20임
    - 홈버튼이 있는 아이폰의 경우 기본적으로 SafeArea와 화면 하단의 위치가 같으므로, 이 제약 조건에 의해서 스크롤뷰의 하단과 화면의 하단 사이의 간격이 20이 됨

<br>

## 🔗 참고 링크
[Table Views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views) <br>
[Filling a Table with Data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data(https://developer.apple.com/documentation/uikit/uitableview)) <br>
[JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder) <br>
[Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types) <br>
[supportedInterfaceOrientations](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621435-supportedinterfaceorientations)
