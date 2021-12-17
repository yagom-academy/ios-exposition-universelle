
## 🇰🇷 만국박람회

#### 🗓️ 프로젝트 기간: 2021.12.06 - 2021.12.17

#### Contributor
🐶 [Allie](https://github.com/wooyani77) 🦖 [허황](https://github.com/hwangjeha) 🐹 [제리](https://github.com/llghdud921)

#### Reviewer
🍎 [도미닉](https://github.com/AppleCEO)


## ❐ UML

![](https://i.imgur.com/sY2NLVO.jpg)


## ✏️학습 키워드
- JSON data Parsing
- TableView
- AutoLayout
- Accessibilty
- Custom View
- 화면 회전


## 프로젝트 설명

### ✔️ 구현모습
![](https://i.imgur.com/5OUVpro.gif)


#### [**JSON Data를 이용한 테이블 뷰 앱**]
✔️ 파리 만국박람회에 대한 정보와 출품작 보러가기 기능 

✔️ 파리 박람회의 한국 출품작 리스트 TableView로 구현

✔️ 리스트 출품작 클릭 시 상세 설명 화면 보여주는 기능

✔️ 앱 내 모든 텍스트와 이미지에 VoiceOver 및 Dynamic Font 적용

<br> 

## Step 1. 모델 타입 구현

### 💡 1-1. 구현 내용

- JSON 포멧과 매칭할 모델 타입 구현
- CodingKeys를 활용해 JSON Data Key와 프로퍼티 명 매칭 
- JSONDecoder() 재사용성을 위해 제네릭 타입 메소드 `decode()` 구현
- `decode()` Unit Test 




<br>


## Step 2. 화면 구현

### 💡 2-1. 구현 내용

- TableView를 활용한 리스트 화면 구현
- CustomView로 구현하고 awakeFromNib를 이용하여 각 View의 초기설정 구현  
- Navigation Controller를 활용한 화면 전환
- NavigationBar 활성화/비활성화 구현

### ❓ 2-2. 고민했던 점
- `awakeFromNib()`
    
    StoryBoard에서 View를 구성하고 CustomView 클래스에 IBOutlet으로 View와 연결하는 방식을 사용했습니다.
    
    `awakeFromNib()`을 사용하기전 CustomView 내부 `init()`에서 `setUp()` 메소드를 사용하여 초기설정을 하려 했으나 
    
    오류가 발생해 원인을 찾아보니 뷰 컨트롤러 `loadView()`메소드가 호출되기 전 CustomView 내부 `init()`이 먼저 호출되어
    
    메모리 올라가지 않은 뷰에 접근하려 해서 생긴 문제였습니다.
    
    `awakeFromNib()` 메소드는 View가 인스턴스화 된 직후 호출되기 때문에
    
    커스텀 뷰 초기설정을 `awakeFromNib()`내부에서 호출해 줬습니다.
    
    ```swift
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp() // 커스텀 뷰 초기 설정하는 메소드
    }
    ```
    
- Navigation Controller 활성화/비활성화 호출 위치
    
    첫번째 main 화면에서는 navigation Bar Item을 나타내지 않기 위해서 ViewLifeCycle 메소드를 이용해 `isNavigationBarButton` 속성을 이용하였습니다.
    
    - ViewWillAppear : 화면이 나타나기 전에 navigationBarButton을 숨김
    - viewWillDisappear : 화면이 사라지고 나서 navigationBarButton를 나타냄
    
    ```swift
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    ```


- Custom Cell 구성 방법
    1. `Xib 파일로 Cell View 구성`
    2. `StoryBoard에 Cell View 구성`
    
    Cell View를 구성할 때 두 가지 방식 모두 적용해봤습니다.
    
    2번 방식 `StoryBoard에 Cell View 구성` 방법을 선택한 이유는 `만국박람회 앱`에는 하나의 TableView를 가지고 있어 `Xib 파일의 장점인 View 재사용성`의 이점을 가지지 못하다고 판단했습니다.
    

<br>

## Step 3. 오토레이아웃 적용

### 💡 3-1. 구현 내용
- 첫 화면은 세로방향 고정
- 모든 화면이 다른 아이폰 기기에서도 알맞은 크기로 보여지도록 구현
- Dynamic Type 적용
- 텍스트가 잘리거나 줄임표(…) 처리가 되지 않도록 구현

### ❓ 3-2. 고민했던 점
- 화면 방향 고정에 대한 고민
    
    각 `ViewController`에 `supportedInterfaceOrientations` 를 지정하기 보다 상위에 있는 `Controller`인  `navigationController` 에서 화면 방향을 컨트롤 하는 것이 override 측면에서 안전하고 
    
    각 `ViewController`에서 방향을 관리하는 것보다 용이하다고 생각했습니다.
    
    `navigationController`내부에 `topViewController` 즉, 현재 화면에 가장 상위에 위치한 `ViewController` 정보를 받아서 화면 방향을 조정해주었습니다.
    
    ```swift
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if let _ = self.topViewController as? ExpoInformationViewController {
            return .portrait
        } else {
            return .all
        }
    }
    ```
    

- Label 내부 텍스트의 사이즈를 각각 다르게 지정해주기위해 `NSMutableAttributedString` 적용
    
    <img src="https://i.imgur.com/8pyXdyE.png" width="300" height="100">
    
    ```swift
    // extension으로 메소드 구현
    extension NSMutableAttributedString {
        func setTextSize(string: String, fontSize: UIFont.TextStyle) -> Self {
            let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: fontSize)]
            self.append(NSAttributedString(string: string, attributes: attributes))
            return self
        }
    }
    visitorsLabel.attributedText = NSMutableAttributedString().setTextSize(string: "방문객", fontSize: .title3).setTextSize(string: " : \(visitors) 명" , fontSize: .body)
    ```

    

- 버튼 title 개행 관련 문제
    
    button에 dynamic font를 적용하고 일정 크기 이상은 커지면 버튼의 타이틀에 개행이 일어났습니다.  
    `numberOfLines = 1` 로 설정하게 되면 개행이 되지 않을 줄 알았는데 개행이 되는 현상이 발생했습니다.
    
    <img src="https://i.imgur.com/74Opj4P.png)" width="200" height="150">

    
    ```swift
    // 1. numberOfLines 설정 잘됨.
    // 하지만 버튼을 눌렀을 때 title이 button으로 바뀜.
    entryListButton.titleLabel?.text = "한국의 출품작 보러가기"
    entryListButton.titleLabel?.numberOfLines = 1 
    ```
    
    <img src="https://i.imgur.com/n2Yol6q.png" width="200" height="150">

    
    ```swift
    // 2. numberOfLines 설정 안됨.
    entryListButton.setTitle("한국의 출품작 보러가기", for: .normal)
    entryListButton.titleLabel?.numberOfLines = 1 
    ```
    
    고민해본 결과 버튼 스타일 문제였다는 것을 알게되었습니다
    
    스토리보드에서 버튼을 생성하게 되면 버튼 스타일이 기본적으로 `Plain`으로 생성되는데 `Default`로 설정을 바꿔서 테스트 해보니 정상적으로 `numberOfLines = 1` 동작하는 것을 확인했습니다.
    
    이를 통해 버튼 스타일 `Plain`, `Default` 등 스타일 별 차이를 알게되었습니다.

<br>

### 💢 3-3. Trouble Shooting

- 디테일 뷰에서 이름이 긴 entry들은 `back button`이 "한국의 출품작"이 아닌 "Back"으로 나오는 것을 확인했습니다. 

    해당 문제가 dynamic Font의 적용할 때 글자가 커지면 짤리는 문제를 발견하여 `navigationBar`의 `title`의 사이즈를 작게 고정시켰는데도 해결되지 않았습니다.

    ![](https://i.imgur.com/Ga3fCUL.png)
    
    **문제 해결 시도**

    아래 코드를 이용해서 title 텍스트를 동적으로 변환하는 것을 방지해보았지만
    동일한 결과가 발생했습니다.
    
    ```swift
    let label = UILabel()
    label.text = entryData.name
    label.adjustsFontForContentSizeCategory = false
        
    self.navigationItem.titleView = label
    ```
    ![](https://i.imgur.com/5kQ3P0q.png)

    
