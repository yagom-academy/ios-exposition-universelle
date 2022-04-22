# 만국박람회 프로젝트 저장소
> 프로젝트 기간 2022.04.11 ~ 2022.04.22 <br/>
팀원 : [@grumpy-sw](https://github.com/grumpy-sw) [@Donnie](https://github.com/westeastyear)
리뷰어 : [stevenkim18](https://github.com/stevenkim18)

- [만국박람회](#만국박람회)
- [STEP 1](#[STEP-1])
    + [궁금한 점](#[STEP-1]-궁금한-점)
- [STEP 2](#[STEP-2])
    + [고민한 점 & 해결한 방법](#[STEP-2]-고민한-점-&-해결한-방법)
    + [궁금한 점](#[STEP-2]-궁금한-점)
- [STEP 3](#[STEP-3]-화면-구현)
    + [고민한 점 & 해결한 방법](#[STEP-3]-고민한-점-&-해결한-방법)
    + [궁금한 점](#[STEP-3]-궁금한-점)

# 만국박람회

# [STEP 1]
## [STEP 1] 궁금한 점
1. 테스트코드 작성 시 타입으로 `Decode`가 제대로 되었는지 확인하기 위해 `XCTAssertEqual`함수를 사용하여 `JSON`의 내용과 비교하였는데 일일이 값 비교를 하지 않는 방법이 있는지 궁금합니다.

2. 현재 프로젝트는 `Asset`으로 데이터를 담아서 진행하는데, 현업에서도 `Asset`을 활용하여 프로젝트를 하나요? 어떤 방식으로 진행하게 되나요?

3. `Codable`은 `Encoder`와 `Decoder`가 합쳐져있는걸로 알고 있는데, 때에 따라서 용도에 맞게 각각 채택을 해줘도 될거 같다는 생각이 들었습니다. 그럼에도 Codable을 사용하는 이유가 편리성 때문일까요? 개발자의 취향 혹은 선택의 문제일까요?

---

# [STEP 2]

## [STEP 2] 고민한 점 & 해결한 방법
**1. 메인뷰의 제목을 원하는 부분에서 개행을 하기위해 고민하였습니다.** 
> => `insertNewLine()`함수를 새로 만들고 메인뷰의 제목 데이터를 매개변수로 받아서 원하는 위치`"("`앞에 `"\n"`을 넣어주어 해결하였습니다.

**2. 메인뷰에서 방문객, 개최지, 개최 기간의 `label`의 크기가 다르다고 생각하여 같은 문자열에서 다른 폰트크기를 주는 방법에 대해 고민하였습니다.**
> => 처음엔 별도의 `label`을 사용하는 방식을 채택했으나, `NSMutableAttributedString`의 `addAttribute()`함수를 활용하여 방문객, 개최지, 개최 기간이 적힌 부분에만 폰트 크기가 변경된 `alternativeFont`의 속성을 부여하는 방법으로 해결했습니다.
```swift
private func convertTextSize(of value: String, target: String) -> NSAttributedString {
        let alternativeFont = UIFont.systemFont(ofSize: 20)
        let attributedText = NSMutableAttributedString(string: value)
        attributedText.addAttribute(.font, value: alternativeFont, range: (value as NSString).range(of: target))
        return attributedText
    }
```

**3. 방문객의 `Int`값에 콤마를 넣어주기 위해 고민하였습니다.**
> => `insertComma()`함수 내에 `numberFormatter`를 구현하여 방문객`Int`을 매개변수로 받고 콤마를 추가하여 반환하는 형태로 구현하였습니다.

**4. 메인뷰에서는 `NavigationBar`가 안보여야하고 다음뷰에서 부터는 `NavigationBar`가 보여야 해서 이를 구현하기 위해 고민하였습니다.**
> => 메인뷰에서 `View`의 `LifeCycle`메서드를 활용하였습니다.
메인뷰가 `viewWillAppear`되면 `isNavigationBarHidden = true`을 하여 숨김처리를 하였습니다. 
다른 뷰에서는 `NavigationBar`가 보여야 하기에 메인뷰가 `viewWillDisappear`되면 `isNavigationBarHidden = false`을 하여 해결하였습니다.
```swift
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
```

**5. `TableViewList`에서 `DetailView`로 전환될때 선택한 `Cell`의 데이터를 넘겨주는 방법을 고민하였습니다.**
> => 데이터를 받는 `ViewController`에서 미리 데이터를 담을 변수를 구현한 후, 데이터를 보내는 `ViewController`에서 `prepare(for segue: UIStoryboardSegue)`메서드를 구현하였고 이를 활용하여 해결하였습니다.


**6. `iOS15`부터 업데이트된 `NavigationBar`의 기본적으로 투명한 상태를 화면구현예시와 같은 불투명 상태로 설정하기 위해 고민하였습니다.**
> => `AppDelegate`에서 전체적으로 `NavigationBar`의 상태를 설정하기 위해 다음과 같은 코드를 작성하여 해결하였습니다.
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        return true
    }
```

## [STEP 2] 궁금한 점
**1. 뷰 컨트롤러 사이의 데이터 전달**
> - 출품작 목록에서 출품작 상세화면으로 이동할 때, 상세화면에 표시할 내용을 전달하기 위해 해당 뷰 컨트롤러의 변수에 값을 할당하는 방법을 채택했습니다. 
> - 그러나 출품작 상세화면을 관장하는 뷰 컨트롤러에서 해당 값을 `private`으로 설정하지 못하게 되어 외부에서 값을 변경이 가능할 위험이 있다고 생각됩니다.😱
> - 이에 대해 스티븐의 생각이 궁금합니다. 

```swift
let entryDetailViewController = segue.destination as? EntryDetailViewController
            
entryDetailViewController?.detailDescription = entries[indexPath.row].description
entryDetailViewController?.imageName = entries[indexPath.row].imageName
entryDetailViewController?.koreanEntryTitle = entries[indexPath.row].name
```


**2. 에러 핸들링**
> - 이번 프로젝트를 진행하면서 `NSDataAsset(name:)`으로 불러올 파일이 없는 경우를 제외하면 에러가 발생할 상황이 없다고 생각해서 별도의 Error Handling을 하지 않았습니다. 
> - JSON 파싱할 때 매칭이 되지 않는 경우 `nil`을 반환하기 때문에 충분히 제어가 가능하다고 판단했는데요, 혹시 저희가 놓친 부분이 있을지 의견을 듣고 싶습니다.🤩

**3. 뷰 컨트롤러 내 상수 사용**
> - 프로그램 내에서 하드코딩을 지양하기 위해 상수를 사용하고자 노력했는데요, 어느 정도까지 상수로 생성해야 할 지 많은 고민을 했습니다. 
> - 자주 사용하는 `Identifier`나 특수 문자 같은 경우는 어려움이 없었으나 파일 이름이나 폰트 사이즈, "방문객"이나 "개최 기간" 같은 문자열까지 상수로 만들어야 할 지 나름대로의 기준을 잡는 게 무척 어려웠습니다.😂 
> - 스티븐이 생각하시기에 개선해야 할 점("이건 상수로 사용하는 것이 좋겠다"라고 생각하시는 것)이 있다면 알려주시면 감사하겠습니다! 그리고 스티븐이 생각하는 기준도 말씀해주시면 좋을 것 같아요.

**4. Naming**
> - 리팩토링 과정 진행 중 다음 세 함수의 이름을 어떻게 작성할 지 고민했습니다. 
> - "어떤 동작을 수행하는지"와 "어떤 결과물을 반환하는지"의 관점에 따라 명사형으로 지을 것인지 동사형으로 지을 것인지, 어떤 단어를 사용할 것인지가 정해진다고 생각하는데요.
> - 스티븐은 이런 함수 네이밍에 있어 어떤 부분을 중요하게 생각하시는지 의견을 듣고 싶습니다.🤔

```swift
private func insertNewLine(at value: String) -> String
private func insertComma(at value: Int) -> String
private func convertTextSize(of value: String, target: String) -> NSAttributedString
```
---

# [STEP 3]

## [STEP 3] 고민한 점 & 해결한 방법

#### **1. [STEP 2]에서 구현했었던 `setTextAttribute() - (하나의 레이블에 다른 폰트 사이즈를 적용하는 기능)`에서, `Dynamic Type`이 전체적으로 적용되지 않는 현상을 발견하였고, 어떻게 하면 다른 사이즈를 가진 `TextStyle`를 하나의 레이블에 적용할 수 있을지 고민하였습니다.**
> => `attribute`를 변경할 문자열에 `NSRange`를 활용하여 다른 스타일로 변경하고자 하는 부분을 접근하는 코드를 작성하였고 `Dynamic Type TextStyle`을 지정하여 해결하였습니다.
 
- **before**
```swift
func setTextAttribute(of value: String, target: String, attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: value)
        attributedText.addAttributes(attributes, range: (value as NSString).range(of: target))
        return attributedText
    }
```

- **after**
```swift
func setTextAttribute(of value: String, target: String, attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: value)
        attributedText.addAttributes(attributes, range: (value as NSString).range(of: target))
        attributedText.addAttributes([.font: UIFont.preferredFont(forTextStyle: .body)], range: NSRange(location: target.count, length: value.count - target.count))
        return attributedText
    }
```

#### **2. `Json Decode` 후 방문객을 표시하기 위해 사용하는 `NumberFormatter`를 어느 곳에 위치시킬지 고민했습니다. `Exposition`에서 사용하기 때문에 해당 타입 안에 위치시키는 것을 가장 먼저 고려했지만, 다른 곳에서도 사용할 수 있도록 기능을 위치시키고 이를 빌리는 형태로 구현하고 싶었습니다.**
> => `ParsingAssistant`와 마찬가지로 `NumberFormatterAssistant`를 생성하여 마찬가지로 싱글톤 인스턴스로 관리하였습니다.

#### **3. Exposition Main View에서 Korean Entry View로 이동할 때 화면 회전된 상태에서 이동하면 디바이스 상태에 맞게 회전이 되지 않는 문제가 있었습니다. `UIDevice.current.orientation.rawValue` 값을 확인해본 결과 `OrientationHelper의 acceptOrientation()` 함수 내에서 `UIDevice.current.setValue()`를 호출하여 디바이스의 상태를 변경해주고 있다는 것을 알게 되었습니다.** 

**<메인 뷰 세로로만 표시하도록 구현된 방법>**
> - 화면 회전 -> `orientation` 값 변경됨
> - 메인 뷰로 화면 이동
> - `viewWillAppear`에서 함수 호출 -> `orientation` 값을 `portrait`로 변경
> - **시뮬레이터는 물리적으로 `landscape` 상태이지만 본인의 상태값을 `portrait`로 인식하기 때문에 화면을 세로로 표시**
>
> 굵게 표시한 부분에서 문제가 발생해 다음과 같이 다른 뷰로 화면 전환 시 문제가 발생하였고 이를 해결하기 위해 고민했습니다.

<img src="https://user-images.githubusercontent.com/63997044/164584710-b9d575c8-c0a1-4f63-abb6-83eb5e67b79e.gif"><br>

> => `OrientationHelper의 acceptOrientation()`가 호출되기 전에 현재의 orientation 상태를 저장하고 다시 덮어씌워주는 방법으로 해결했습니다.
```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    let currentOrientationRawValue = UIDevice.current.orientation.rawValue
    OrientationHelper.acceptOrientation(.portrait, andRotateTo: .portrait)
    UIDevice.current.setValue(currentOrientationRawValue, forKey: "orientation")
}
```

## [STEP 3] 궁금한 점
#### **1. Singleton**

> - `NumberFormatterAssistant`를 생성했듯이, `Exposition`내의 문자열 값을 변경하는 기능들을 모두 포함하는 싱글톤 인스턴스를 만들 수 있을 것 같습니다.
> - `Exposition` 타입은 단순히 `Json`을 `decode`하는 용도로만 사용하고, 값을 처리하는 부분을 분리할 수 있을 것 같은데 어떻게 생각하시나요?🤔 


#### **2. 화면회전**
> - 저희가 작성한 화면회전해주는 방식(`OrientationHelper`)에 대해 어떻게 생각하시나요?🤔




## TIL 깃커밋 메세지
✅[chore]: 코드 수정, 내부 파일 수정. <br>
✨[feat]: 새로운 기능 구현. <br>
📐[style]: 스타일 관련 기능.(코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우) <br>
➕[add]: Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 파일 생성 시. <br>
🔨[fix]: 버그, 오류 해결. <br>
⚰️[del]: 쓸모없는 코드 삭제. <br>
📝[docs]: README나 WIKI 등의 문서 개정.<br>
💄[mod]: storyboard 파일,UI 수정한 경우.<br>
✏️[correct]: 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다.<br>
🚚[move]: 프로젝트 내 파일이나 코드의 이동.<br>
⏪️[rename]: 파일 이름 변경이 있을 때 사용합니다.<br>
⚡️[improve]: 향상이 있을 때 사용합니다.<br>
♻️[refactor]: 전면 수정이 있을 때 사용합니다.<br>
🔀[merge]: 다른브렌치를 merge 할 때 사용합니다.<br>
