# 만국박람회 프로젝트 🇰🇷
> 파리 만국박람회 1900에 출품됐던 우리나라의 출품작을 소개하는 프로젝트
---
## 목차 📋
1. [팀원 소개](#1-팀원-소개)
2. [타임 라인](#2-타임라인-230220--230303)
3. [UML](#3-uml)
4. [실행화면](#4-실행화면)
5. [트러블 슈팅](#5-트러블-슈팅)
6. [Reference](#6-reference)
7. [팀 회고](#7-팀-회고)

---
## 1. 팀원 소개
|Andrew|혜모리|
|---|---|
|<img src="https://github.com/hyemory/ios-exposition-universelle/blob/step2/images/Andrew.png?raw=true" width="200">|<img src="https://github.com/hyemory/ios-exposition-universelle/blob/step2/images/hyemory.png?raw=true" width="200">|

## 2. 타임라인 (23.02.20 ~ 23.03.03)
|날짜|진행 내용|
|---|---|
|2023-02-20|프로젝트 시작, step 1 모델 타입 구현 완료|
|2023-02-21|UI Table View 학습|
|2023-02-22|UI 구현 시작, data set 디코딩|
|2023-02-23|Step 2 구현 완료|
|2023-02-24|Pull request 작성 및 프로젝트 회고|
|2023-02-27|세로모드 고정 및 가로모드에 맞게 AutoLayout 수정|
|2023-02-28|TableViewCell 동적으로 높이변경 구현|
|2023-03-01|코드컨벤션 수정, Text를 Dynamic Type으로 설정|
|2023-03-02|Step 3 구현 완료|
|2023-03-03|Pull request 작성 및 프로젝트 회고|

## 3. UML

<details>
<summary> Class Diagram 보기 </summary> <br/>
<img src="https://github.com/hyemory/ios-exposition-universelle/blob/39daa6dfc3de97f7c4fc77baa306451333a7060a/images/class_diagram.png?raw=true">
</details>
<br/>

## 4. 실행화면

<details>
<summary> STEP 2 실행화면 </summary> <br/>
    
|만국박람회 메인페이지에서 <br/> 한국의 출품작 목록으로 이동|한국의 출품작 목록에서 <br/> 상세 페이지로 이동|
|---|---|
|![](https://github.com/hyemory/ios-exposition-universelle/blob/39daa6dfc3de97f7c4fc77baa306451333a7060a/images/mainAndList.gif?raw=true)|![](https://github.com/hyemory/ios-exposition-universelle/blob/39daa6dfc3de97f7c4fc77baa306451333a7060a/images/listAndView.gif?raw=true)|

</details>


<details>
<summary> STEP 3 실행화면 </summary> <br/>
    
|만국박람회 메인페이지에서 <br/> 한국의 출품작 목록으로 이동|한국의 출품작 목록에서 <br/> 상세 페이지로 이동|Dynamic Type 적용|
|---|---|---|
|![](https://github.com/hyemory/ios-exposition-universelle/blob/39daa6dfc3de97f7c4fc77baa306451333a7060a/images/step3_main.gif?raw=true)|![](https://github.com/hyemory/ios-exposition-universelle/blob/39daa6dfc3de97f7c4fc77baa306451333a7060a/images/step3_list.gif?raw=true)|![](https://github.com/hyemory/ios-exposition-universelle/blob/39daa6dfc3de97f7c4fc77baa306451333a7060a/images/step3_dynamicType.gif?raw=true)|

<br/>

|메인페이지 세로모드 고정 / 그외 페이지 가로모드 지원|
|---|
|![](https://github.com/hyemory/ios-exposition-universelle/blob/39daa6dfc3de97f7c4fc77baa306451333a7060a/images/step3_orientations.gif?raw=true)|

</details>
<br/>

## 5. 트러블 슈팅
### 1️⃣ **JSON의 key와 프로퍼티의 네이밍이 다른 점** <br/>
- Swift는 camel case를 사용하고 JSON은 snake case를 사용하기 때문에 Key값이 달라서 nil값을 반환할 수 있다고 합니다. 
- ✅ CodingKey 프로토콜을 사용하여 이를 방지 하였습니다.

### 2️⃣ **self(ViewController)가 초기화 되지 않았을 때의 프로퍼티 할당** <br/>
![](https://i.imgur.com/0xiCWki.png)
![](https://i.imgur.com/H2udvWP.png)
- self를 ExpoInfoMainViewController.self로 변경하라는 경고메시지가 출력되었습니다.
- ✅ 버튼의 인스턴스화를 연기하는 lazy var를 사용해서 문제를 해결했습니다.

### 3️⃣ **메인페이지의 navigation bar만 숨겨야 하지만 다른 navigation bar도 숨겨질 때** <br/>
- 메인페이지의 네비게이션만 숨기기 위해 뷰 컨트롤러의 상태 메서드를 사용하였습니다.
화면이 나타날 때 숨겼다가, 화면이 사라질 때 다시 보이도록 구현하였습니다.

```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
}

override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.navigationBar.isHidden = false
}
```

### 4️⃣ **Label가 View내에서 줄바꿈되지 않는 현상** <br/>
```swift
label.numberOfLines = 0
label.lineBreakMode = .byWordWrapping
```
- Label 옵션을 주어서 설정을 해주었지만 줄바꿈이 되지 않았습니다.
```swift
mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
```
- ✅ Label의 상위뷰인 mainStackView의 width값을 주어서 해결했습니다.


### 5️⃣ **코드로 Table View에서 다음 View로 정보를 전달이 안될 때** <br/>
- 스토리보드 없이 코드로만 UI를 구현해서 스토리보드 세그를 사용하는 `prepare` 메서드로 셀의 정보를 보내는 것이 어려웠습니다.

``` swift
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let entryInfoViewController = EntryInfoViewController(entry: entryList[indexPath.row])
    navigationController?.pushViewController(entryInfoViewController, animated: true)
}
```
✅ 다음에 올 페이지에 Entry 타입의 정보를 받을 프로퍼티를 구현하고, `Table view delegate`를 사용해 Entry 타입의 값을 전달하도록 구현하였습니다.

### 6️⃣ **특정 뷰에만 세로 모드로 고정이 안될 때** <br/>
- 메인페이지만 가로모드로 변경이 되어서는 안된다는 조건이 있었습니다.
- Xcode내에 프로젝트에 설정할 경우 모든 View에서 설정이 되는 문제가 있었습니다
![](https://i.imgur.com/QAzJwJu.png)
- ✅ `AppDelegate` 클래스 내부에 지원하는 화면 방향을 설정해주는 `supportedInterfaceOrientationsFor` 메서드를 사용하여 처리하였습니다.
`changeOrientation` 프로퍼티를 `false`로 주면 `.portrait`(세로 고정)로 설정되고, `true`로 주면 모두 가능하도록 구현하였습니다.

``` swift
// AppDelegate 클래스 내부
var changeOrientation: Bool = true

func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    if changeOrientation == false {
        return [.portrait]
    } else {
        return [.all]
    }
}
```

- ✅ 뷰 컨트롤러에는 `UIApplication`의 싱글톤을 사용하여 세로모드 고정 여부를 적용하였습니다.
``` swift
open class var shared: UIApplication { get }
```
- 아래 코드와 같이 뷰가 나타날 때 세로모드로 고정되게 하였고, 뷰가 사라지려고 하면 다시 모든 방향을 지원합니다.

``` swift
// ExpoInfoMainViewController 클래스 내부
private let delegate = UIApplication.shared.delegate as! AppDelegate

// ...
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
    delegate.changeOrientation = false

}

override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.navigationBar.isHidden = false
    delegate.changeOrientation = true
}
```


### 7️⃣ **Table View Cell의 서브 뷰의 길이만큼 height값이 동적으로 변경되지 않을 때** <br/>
- 커스텀 셀에서 이미지, 이름, 간단 소개글을 각각 셀 내에서 오토 레이아웃을 적용하였는데
아래와 같이 간단 소개글을 줄바꿈 처리하면 셀 밖으로 빠져나가는 현상이 발생했습니다.<br/>
![](https://i.imgur.com/w8h9Vjr.png)
- ✅ 이름, 간단 소개글 Label을 스택 뷰로 묶고, 그 스택뷰와 이미지를 또 다시 스택뷰로 묶어 오토레이아웃을 주니 셀의 height가 동적으로 늘어났습니다.
![](https://i.imgur.com/KfJQsER.png)



## 6. Reference

1. [애플 공식문서 - UITableViewCell](https://developer.apple.com/documentation/uikit/uitableviewcell)
2. [커스텀 셀 만들기 - centerYAnchor](https://feelsodev.tistory.com/7)
3. [애플 공식문서 - layoutSubviews()](https://developer.apple.com/documentation/uikit/uiview/1622482-layoutsubviews)
4. [ViewController initialization](https://woozzang.tistory.com/168)
5. [애플 공식문서 - UITableView](https://developer.apple.com/documentation/uikit/uitableview)
6. [애플 공식문서 - Table views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)
7. [애플 공식문서 - Filling a table with data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)
8. [애플 공식문서 - JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
9. [애플 공식문서 - Typography](https://developer.apple.com/design/human-interface-guidelines/foundations/typography/)
10. [블로그 - Dynamic type](https://velog.io/@minni/Dynamic-Type-egjn26z5)


## 7. 팀 회고

<details>
<summary> 팀 회고 내용 보기 </summary>

### 우리팀이 잘한 점
- 스토리보드 없이 모든 Layout을 코드로 작성
    
### 우리팀 개선할 점
- 구글링한 코드를 좀 더 분석하고 완벽 이해해서 우리에게 필요한 부분만 적용할 수 있도록 더 노력할 것

### 서로 칭찬하기
- Andrew -> 혜모리
: 짝 프로그래밍 시간 외에도 쉽게 지나칠수도 있는 문제점을 찾아내어서 문제점을 해결하고 해결한 방법을 공유해주셔서 예상했던 것보다 훨씬 더 많은 학습을 하게 되었습니다.🤗
다음에도 또 같이 했으면 좋겠어요 👏

- 혜모리 -> Andrew
: 뷰를 코드로 구현하는 방법에 대해 앤드류에게 엄청 많이 배웠습니다! 
문제 해결에 열정적이시고 의견을 잘 수용해 주셔서 편하게 프로젝트 진행할 수 있었습니다. 👍
또 같이하게 돼서 너무 좋았어요. 다음에 또 같이해요~

</details>
