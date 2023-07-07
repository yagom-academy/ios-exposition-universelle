# 🕌 만국박람회

## 💬 소개
> 1900년 개최된 파리 만국박람회에 대한 정보와 한국 출품작의 설명을 `TableView`와 `JSON`을 활용하여 보여주는 프로젝트입니다.

</br>

## 🔖 목차 

1. [팀원](#1.)
2. [타임 라인](#2.)
3. [다이어그램](#3.)
4. [폴더 구조](#4.)
5. [트러블 슈팅](#5.)
6. [고민한 부분](#6.)
7. [실행 화면](#7.)
8. [참고 링크](#8.)
9. [팀 회고](#9.)


---

</br>

<a id="1."></a>

## 1. 🎙️ 팀원

|[Karen ♉️](https://github.com/karenyang835)|
| :-: |
| <Img src="https://i.imgur.com/auFOXpc.png" width="150"/>|


---

</br>

<a id="2."></a>

## 2. ⏰ 타임 라인
> 프로젝트 기간 : 2023.06.26. ~ 2023.07.07.
<details><summary span style="color:black; background-color:#23ff2921; font-size:120%"><b>1주차</b></summary></span> 

|**날 짜**|**내 용**|
|:-:|-|
| 2023.06.26.| 📝 프로젝트에서 필요로 하는 핵심기능 공부 - `JSON` 공부 <br> |
| 2023.06.27.| 🆕 `JSON`타입의 `Decoding`을 위한 `Items`, ` InternationalExposition` 구조체 구현  <br> 🆕 `Snake-case`를 `Camel-case`로 변환하는 `CodingKeys` 구현<br> 🆕 `Handling nil`을 위한 `Decodable` 프로토콜내에 존재하는 `init`생성자 구현  |
| 2023.06.28.| 🔬 `info.plist`파일 이동으로 인한 빌드 오류 수정<br> 🛠️ 옵셔널 체이닝으로 통일, 프로퍼티 옵셔널 타입으로 선언 <br> |
| 2023.06.29.| 📝 프로젝트에서 필요로 하는 핵심기능 공부 - `TableView` 공부 |
| 2023.06.30.| 📝 `README` 작성 |

</details>

<details><summary span style="color:black; background-color:#d2ffd2; font-size:120%"><b>2주차</b></summary></span> 


|**날 짜**|**내 용**|
|:-:|-|
| 2023.07.03.|🪡 `StoryBoard` 삭제 및 `CodeBase` 셋팅 <br> 🆕 매직리터럴방지를 위한 `DataNameSpace` 구현 <br> 🆕 방문객수를 `String`값으로 변경해 줄 `formatToDecimal` 구현<br>🆕 `JSON`데이터 디코딩 담당할 구조체 구현 <br> 🆕 `MainViewController`에 `MainScrorllerView` 생성 <br> |
| 2023.07.04.| 🆕 `MainViewController`에 적용시킬 `MainStackView` 구현 <br> 🆕 방문객, 개최지, 개최기간을 담을`ExpositionInformationStackView` 구현 <br> 🆕 하단에 '한국의 출품작 보러가기' 버튼과 양쪽 태극기를 담을 `ExhibitListChangeViewButtonStackView` 구현 <br> 🆕 출품작 리스트를 관리할 `ExhibitListViewController`생성 후 기본 구현 <br> 🆕 한국의출품작 리스트 구현을 위한 `tableView`구현시 필요한 `ExhibitCell`구조체 구현 <br> 🆕 `MainViewController`에 `stackView` 구현 <br>🆕 `MainViewController`에 있는 `StackView` 오토레이아웃 설정 <br> | 
| 2023.07.05.|🖨️ 전체적으로 네이밍 통일 <br> 🪡 누락 된 은닉화 프로퍼티 메서드 `private` 적용  <br>|
| 2023.07.06.|🪡 전체적인 코드 역할 분리 및 컨벤션 정리  <br> 🛠️ `contentMode`활용해 이미지 사이즈 조절 <br>  🆕 `MainViewController`는 화면이 세로 모드로 고정되게 구현 <br>    |
| 2023.07.07.| 🆕 `Dynamic Type` 적용 <br> ✍️ `README` 작성 <br>|

</details>

---

</br>

<a id="3."></a>

## 3.📊 다이어그램
![image](https://github.com/karenyang835/ios-exposition-universelle/assets/124643896/224781cb-cf5e-41e9-bf9e-407f33b944ed)

---

</br>

<a id="4."></a>

## 4. 📂 폴더 구조
![스크린샷 2023-07-07 오후 2 42 12](https://github.com/karenyang835/ios-exposition-universelle/assets/124643896/8f999c10-ac7b-4623-a9de-f118df3053d9)

---

</br>

<a id="5."></a>

## 5. 🤔 고민한 부분
### 1️⃣ `JSON` 포멧의 데이터와 매칭할 모델 타입 구현
- `JSON`이라는 것도 생소했고, `JSON`을 매칭할 모델 타입을 구현한다는 것 자체가 어디서부터 어디까지 해야될지도 막막했습니다. 미션에서 주어진 것은 `JSON`파일 자체를 `import`하는 단계까지는 아닌 것 같고 `JSON`의 데이터를 `Parsing`할 수 있는 정도로만 구현하면 될 것 같았습니다.

### 2️⃣ 네이밍 컨벤션
> `JSON`은 자바스크립트 객체 표기에서 리터럴과 프로퍼티를 표현하는 방법만 가져와서 사용하는 것으로 자바스크립트 언어로부터 영감을 받아 개발된 데이터형식입니다. 
- 자바크스립트의 경우 변수명 표기법이 카멜 케이스와 스네이크 케이스를 둘 다 사용하기 때문에 카멜 케이스만 활용하는 `swift`에서 "_"를 활용해서 네이밍을 하는 스네이크 케이스에 대처를 해주어야했습니다. `CodingKeys`를 활용하여 해결했습니다.


### 3️⃣ `JSON Data Decoding`
> `Encoding` : 일련의 데이터를 `JSON`형식으로 변환하는 과정입니다.
> `Decoding` : `JSON`형식의 데이터를 해당 데이터 형식으로 변환하는 과정입니다.
- 맨 처음에는 `Codable`의 프로토콜을 채택을 했었습니다. `Codable` 프로토콜을 채택하면 `Encoding`에 활용하는 `Encodable`와 `Decoding` 할 수 있는 `Decodable` 모두 활용이 가능해지는데 만국박람회 프로젝트에서 `Encoding`를 할 경우는 없어보여서 `Decoding`시 활용하는 `Decodable`만 활용하여 구현했습니다.

### 4️⃣ `StoryBoard` or `CodeBase` 구현
**<고민>**
- `StoryBoard`로 구현을 할지 `CodeBase`로 구현을 할지 선택하기 전에 고민을 많이 했습니다. 아직 `StoryBoard` 활용하는데에도 익숙하지 않은데 무턱대고 `CodeBase`로 하는게 맞는지도 의문이 들었었습니다.
- 눈에 보여지면서 설정할 수 있는 방법이 저에게는 더 잘 맞는 방법이라 `StoryBoard`로 구현하는 쪽이 저에게는 훨씬 더 간편하고 적응하기에도 수월한 방법입니다.

**<결론>**
- 그럼에도 불구하고 `CodeBase`로 진행하기로 한 이유는 오토레이아웃이라던가 `tableView`를 만들고 `stackView`로 구현하는 부분 등 `CodeBase`로 모든 것을 컨트롤 할 수 있는 방법이 훨씬 더 매력적으로 다가왔고 눈에 보여지고 많은 부분을 제공해주는 `StoryBoard`보다 하나 하나 생각하고 구현해야되는 `CodeBase`로 진행을 하다보면 프로젝트의 구조를 조금 더 상세하게 이해하고 머릿속에서 정리하면서 진행할 수 있을 것 같아 도전하게 되었습니다.

### 5️⃣ `StackView` 만들기
- 이번 프로젝트에서의 핵심 기술 중 한 가지가 아닐까 싶습니다. 출품작 리스트는 `TableView`로 구현하면 되겠지만 처음 보여지는 메인 화면과 출품작 리스트에서 품목을 선택했을 때 보여지는 상세 화면은 어떤걸로 구현을 해줘야 될지 막막했습니다. 쥬스메이커를 진행할 때 `StoryBoard`에서 사용했었던 `StackView`라는게 있었던 것이 기억나서 해당 `StackView`를 활용하면 정렬도 용이하고 관리가 수월할 것 같았습니다.

### 6️⃣ `TableView`의 `cell`은 `stackView` VS `contentView`
- `tableView`의 `Cell`도 처음에는 `stackView`로 관리를 해줘야 되는건가 싶어서 적용해보려고 했는데 도저히 뭘 어떻게 설정을 해줘야 될지를 알 수가 없었습니다. 그래서 검색을 해보니 `stackView`를 사용하면 `Cell`의 계층 구조가 더 복잡해지는 문제로 레이아웃 계산이 더 복잡해진다는 것을 알게 되었습니다. 그리고 학습활동 때 배우기로 `Cell`은 재사용을 한다고 알고 있어서 `StackView`로 레이아웃을 맞추기에는 적합하지 않다고 생각되어졌고 메모리 관리라던가 성능 향상면에서도 `contenView`가 더 용이하기에 `contenView`로 적용시켰습니다.

### 7️⃣ `extension`의 활용
- `SOLID`원칙을 다 지킬 수는 없어도 지금부터라도 할 수 있는 부분이라도 하나씩 적용시켜보는 습관을 들여가는것이 좋을 것 같았습니다.
- 최대한 제가 코드로 구현할 수 있는 방법은 어떤게 있을지 고민해봤습니다. 코드를 구조화 시키고 정보를 숨기는 것은 충분히 구현할 수 있을 것 같았고,제가 할 수 있는 방법은 `private extension`을 활용해서 관련 메서드를 그룹화 하면 클래스 내부에서 해당 기능에 관련된 코드를 쉽게 찾을 수 있고, `private`를 붙여줌으로써 외부에서 접근할 수 없게 차단을 해 정보도 은닉 시킬 수 있게 하였습니다.

</br>

<a id="6."></a>

## 6. 🚨 트러블 슈팅

### 1️⃣ `Main(StoryBoard)`화면을 찾지 못하는 문제
#### ⛔️ 문제점
- `StoryBoard`를 활용하지 않고 `CodeBase`로 진행 시 아무것도 출력 되지 않는 문제점이 발생했습니다.

#### ✅ 해결 방법
-  `SceneDelegate.swift` 파일에 있는 `scene(_:willConnectTo:options:)` 메서드를 활용하여 `UIWindow` 인스턴스를 생성해서 해결해주었습니다.

<details>
<summary>코드 상세</summary>   

#### 수정 전
```swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }   
```

#### 수정 후

```swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let mainViewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
    
       window?.rootViewController = navigationController
       window?.makeKeyAndVisible()
    }
 
```

</details>

### 2️⃣ 네비게이션 바 `Mask` 비 활성화로 인한 화면 가려지는 문제
#### ⛔️ 문제점 
- 메인화면에서 설명 부분을 위로 스크롤할 경우 네비게이션 바에 가려져서 `Mask`되는 현상이 발생했습니다.


#### ✅ 해결 방법
- `Debug View Hierarchy`로 `view`상황을 보다가 깨닫고 `viewWillAppear`일 때 네비게이션 바가 가려지고 `viewWillDisappear`할 때 보여질 수 있게 적용해서 해결했습니다.

<details>
<summary>코드 상세</summary>

```swift
final class MainViewController: UIViewController {
   
    ... 
  
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
}
  
```

</details>
    

### 3️⃣ 화면이 정상적으로 출력되지 않는 현상
#### ⛔️ 문제점
- 코드로 작성을 `UI`를 구성해주어도 하얀색 화면만 보여지고 아무것도 보여지지 않는 문제점이 발생했습니다.

#### ✅ 해결 방법
- `addSubView`를 호출해주지 해주지 않으면 뷰 계층 구조가 구성되어지지 않고 레이아웃이나 이벤트 처리도 안되는 완전 까막눈 상태였다는 것을 알게 되어 적용시켜 해결했습니다.

<details>
<summary>코드 상세</summary>

```swift
private extension MainViewController {
    
    ... 

    func addSubviews() {
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(mainStackView)
    }
    
    ...

}
  
```

</details>

### 4️⃣ 메인 화면이 세로 모드로 고정되지 않는 문제

#### ⛔️ 문제점
- 메인 화면은 세로모드로 고정되게 출력되어져야 하는데 가로, 세로 모두 출력되는 문제점이 발생했습니다. 


#### ✅ 해결 방법
- 처음에는 `ViewController`에서 관리하면 될 것이라고 생각해서 `MainViewController`에 `supportedInterfaceOrientations`을 설정해주었지만 해결되지 않았습니다.

**<처음 적용했던 코드 - `ViewController`>**

```swift
override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
}

 override var shouldAutorotate: Bool {
        return true
}

```

- 화면 전환 모드를 `ViewController`에서 관리하는게 아닌것 같다는 생각이 들었고, 찾아보니 `AppDelegate`에서 앱의 전역적인 동작을 관리한다는 것을 알게 되어서 `supportedInterfaceOrientationsFor`라는 메소드를 활용해 해결했습니다.

**<세로모드 적용 코드 - `AppDelegate`>**
```swift
class AppDelegate: UIResponder, UIApplicationDelegate {
    var shouldSupportAllOrientation = true

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if shouldSupportAllOrientation {
            return .all
        } else {
            return .portrait
        }
    }
}
    
```

### 5️⃣ 버튼에 `Dynamic Type` 적용시 레이아웃과 버튼 역할 상실되는 문제

#### ⛔️ 문제점
- 메인 화면에서 맨 하단에 위치한 '한국의 출품작 보러가기' 버튼에는 `Dynamic type`가 제대로 적용되지가 않고, 적용을 시키면 버튼의 역할을 수행하지 못하는 문제점이 생겼습니다. 
- 게다가 양 옆에 태극기 모양도 글씨가 커지면서 출력되지 않는 문제가 발생했습니다. 

#### ✅ 해결 방법
- 버튼 글씨에 `Dynamic Type`을 적용시켜주고 가운데 정렬을 시켜주었습니다.

<details>
<summary>코드 상세</summary>
    
**수정 전 코드**
```swift
  let exhibitListChangeViewButton: UIButton = {
        let button = UIButton()
        button.setTitle(DataNamespace.buttonTitle, for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .subheadline)
        return button
    }()
                                                    
```
    
**수정 후 코드**
```swift
let exhibitListChangeViewButton: UIButton = {
        let button = UIButton()
        button.setTitle(DataNamespace.buttonTitle, for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .subheadline)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        
        return button
    }()

```

</details>

- 버튼과 양 옆의 태극기 이미지를 담고 있는 `stackView`에 `spacing`을 너무 많이 주다 보니 글씨 크기가 커지면 태극기가 위치할 공간이 부족해 출력되지가 못해 `spacing`를 삭제해주었습니다.

<details>
<summary>코드 상세</summary>
    
**수정 전 코드**
```swift
private extension ExhibitListChangeViewButtonStackView {
    func configureInit() {
        self.axis = .horizontal
        self.spacing = 30
        
        addArrangedSubviews()
        addConstraintsChangeViewButton()
        addConstraintsLeftFlagImageView()
        addConstraintsRightFlagImageView()
    }                                                     
```
    
**수정 후 코드**
```swift
private extension ExhibitListChangeViewButtonStackView {
    func configureInit() {
        self.axis = .horizontal
        
        addArrangedSubviews()
        addConstraintsChangeViewButton()
        addConstraintsLeftFlagImageView()
        addConstraintsRightFlagImageView()
    }
```

</details>

- 이미지의 크기를 설정해주는 부분을 `constraint`에서 `multiplier`를 활용해 설정해주었던 것을 `contentMode`에서 `scaleAspectFit`으로 설정해 주었습니다.


<details>
<summary>코드 상세</summary>
    
**수정 전 코드**
```swift
func addConstraintsLeftFlagImageView() {
        leftFlagImageView.setContentCompressionResistancePriority(.init(1), for: .horizontal)
        leftFlagImageView.setContentCompressionResistancePriority(.init(1), for: .vertical)

        NSLayoutConstraint.activate([
            leftFlagImageView.heightAnchor.constraint(equalTo: leftFlagImageView.widthAnchor, multiplier: 0.65),
            leftFlagImageView.heightAnchor.constraint(equalTo: exhibitListChangeViewButton.heightAnchor)
        ])

    }

    func addConstraintsRightFlagImageView() {
        rightFlagImageView.setContentCompressionResistancePriority(.init(1), for: .horizontal)
        rightFlagImageView.setContentCompressionResistancePriority(.init(1), for: .vertical)    

        NSLayoutConstraint.activate([
            rightFlagImageView.heightAnchor.constraint(equalTo: rightFlagImageView.widthAnchor, multiplier: 0.65),
            rightFlagImageView.widthAnchor.constraint(equalTo: leftFlagImageView.widthAnchor)
        ])
    }
```
    
**수정 후 코드**
```swift
private let leftFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: DataNamespace.flag)
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let rightFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: DataNamespace.flag)
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    ...
    
func addConstraintsLeftFlagImageView() {
        leftFlagImageView.setContentCompressionResistancePriority(.init(1), for: .horizontal)
        leftFlagImageView.setContentCompressionResistancePriority(.init(1), for: .vertical)

        NSLayoutConstraint.activate([
            leftFlagImageView.heightAnchor.constraint(equalTo: exhibitListChangeViewButton.heightAnchor)
        ])
    }

    func addConstraintsRightFlagImageView() {
        rightFlagImageView.setContentCompressionResistancePriority(.init(1), for: .horizontal)
        rightFlagImageView.setContentCompressionResistancePriority(.init(1), for: .vertical)

        NSLayoutConstraint.activate([
            rightFlagImageView.widthAnchor.constraint(equalTo: leftFlagImageView.widthAnchor),
            rightFlagImageView.widthAnchor.constraint(equalTo: leftFlagImageView.widthAnchor)
        ])
    }
```

</details>

- 상세 설명쪽으로 버튼 영역이 침범되는 문제를 해결하기 위해 `Label`의 높이와 `stackView`의 높이가 동일하게 설정을 해주고 왼쪽 태극기의 높이를 버튼 높이와 동일하게 설정해준 뒤 양쪽 플래그의 넓이값이 같아지게 설정해주었습니다.
- 그런 다음 상세 설명의 높이값을 가져와서 상세설명의 끝나는 부분에 버튼과 두 개의 이미지를 담은 `stackView`가 위치할 수 있게 수정해주었습니다. 

<details>
<summary>코드 상세</summary>
    
**수정 전 코드**
```swift
func addConstraintsChangeViewButton() {
        exhibitListChangeViewButton.setContentCompressionResistancePriority(.init(999), for: .horizontal)
        exhibitListChangeViewButton.setContentCompressionResistancePriority(.init(999), for: .vertical) 
    }                                                          
```
    
**수정 후 코드**
```swift    
func addConstraintsChangeViewButton() {
        exhibitListChangeViewButton.setContentCompressionResistancePriority(.init(999), for: .horizontal)
        exhibitListChangeViewButton.setContentCompressionResistancePriority(.init(999), for: .vertical)

        exhibitListChangeViewButton.titleLabel?.heightAnchor.constraint(equalTo: exhibitListChangeViewButton.heightAnchor).isActive = true

        NSLayoutConstraint.activate([
            exhibitListChangeViewButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6)
        ])      
    }
```
</details>

### 6️⃣`Dynamic Type`적용 시 `Accessubility` 4~5단계 시 ₩Back₩버튼의 내용 출력 오류

#### ⛔️ 문제점
- `Dynamic Type`적용 시 `Accessubility`가 4~5단계가 되면 `Back`버튼의 내용이 `Back`로 출력되어지는 문제가 발생했습니다.

#### ✅ 해결 방법
- 시뮬레이션 오류로 핸드폰으로 실행시에 문제점이 발견되지 않습니다.
   - `Xcode버전 : Version 14.3.1 (14E300c)`

---

</br>

<a id="7."></a> 

## 7.📱실행 화면

<br/>

| 화면전환 | 메인 화면 `Dynamic Type` |
| :--------: |:--------: |
|<img src="https://github.com/karenyang835/ios-exposition-universelle/assets/124643896/ad90031b-c2be-4b6c-a118-586e5aa1a39e" style="zoom:70%;" />| <img src="https://github.com/karenyang835/ios-exposition-universelle/assets/124643896/a1397d4d-3160-47d1-80d1-57e7d27a2f31" style="zoom:70%;" />| 
    
| 출품작 리스트 `Dynamic Type` |상세 화면 `Dynamic Type` |
| :--------: | :--------: |
|<img src="https://github.com/karenyang835/ios-exposition-universelle/assets/124643896/6968af73-2ed8-4e38-b345-4fc07c376e2f" style="zoom:70%;" />| <img src="https://github.com/karenyang835/ios-exposition-universelle/assets/124643896/1f29fa86-c399-4f79-87ee-d1cb81570a98" style="zoom:70%;" />|

| 메인화면 `Dynamic Type`(가로모드) |
| :--------: |
|<img src="https://github.com/karenyang835/ios-exposition-universelle/assets/124643896/b8731129-20f4-4f3c-9b39-1524760a8330" style="zoom:70%;" />| 

    
| 출품작 리스트 및 상세화면 `Dynamic Type`(가로모드) |
| :--------: |
|<img src="https://github.com/karenyang835/ios-exposition-universelle/assets/124643896/8f325232-68c9-41ec-9c2c-a6c375b4777d" style="zoom:70%;" />|



---

</br>

<a id="8."></a> 

## 8. 🔗 참고 링크

🍎 [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/) <br>
🍏 [Apple Developer - UINavigationController](https://developer.apple.com/documentation/uikit/uinavigationcontroller)<br>
🍏 [Apple Developer - UITableView](https://developer.apple.com/documentation/uikit/uitableview)<br>
🍏 [Apple Developer - Table views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)<br>
🍏 [Apple Developer - JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)<br>
🍏 [Apple Developer - Filling a table with data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)<br>
🍏 [Apple Developer - Configuring the cells for your table](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table)<br>
📚 [위키백과 - JSON](https://ko.wikipedia.org/wiki/JSON)<br>


---

</br>

<a id="9."></a>

## 9. 💌 팀 회고

### 👏🏻 우리팀이 잘한 점
- 개인 공부를 충분히 하고 진행했습니다.
- 충분한 휴식을 통해 체력 관리를 했습니다.


### 👊🏻 우리팀이 개선할 점
- 미션에 대한 숙지가 부족한 것 같습니다.
- 자꾸 엉뚱한 곳으로 생각이 튀는 것 같습니다.


</br>
