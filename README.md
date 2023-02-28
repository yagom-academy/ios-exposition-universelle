# 만국박람회 프로젝트 🇰🇷
> 파리 만국박람회 1900에 출품됐던 우리나라의 출품작을 소개하는 프로젝트
---
## 목차 📋
1. [팀원 소개](#1-팀원-소개)
2. [타임 라인](#2-타임라인-230220--230303)
3. [프로젝트 순서도](#3-프로젝트-순서도)
4. [실행화면](#4-실행화면)
5. [트러블 슈팅](#5-트러블-슈팅)
6. [Reference](#6-reference)

---
## 1. 팀원 소개
|Andrew|혜모리|
|---|---|
|<img src="https://github.com/hyemory/ios-exposition-universelle/blob/step2/images/Andrew.png?raw=true" width="200">|<img src="https://github.com/hyemory/ios-exposition-universelle/blob/step2/images/hyemory.png?raw=true" width="200">|

## 2. 타임라인 (23.02.20. ~ 23.03.03.)
|날짜|진행 내용|
|---|---|
|2023-02-20|프로젝트 시작, step 1 모델 타입 구현 완료|
|2023-02-21|UI Table View 학습|
|2023-02-22|UI 구현 시작, data set 디코딩|
|2023-02-23|Step 2 구현 완료|
|2023-02-24|Pull request 작성 및 프로젝트 회고| 

## 3. 프로젝트 순서도

<details>
<summary> Class Diagram 보기 </summary> <br/>
<img src="https://github.com/hyemory/ios-exposition-universelle/blob/step2/images/class_diagram.png?raw=true">
</details>
<br/>

## 4. 실행화면
- *프로젝트 완성 후 업데이트 예정*

## 5. 트러블 슈팅
### 🔒 **JSON의 key와 프로퍼티의 네이밍이 다른 점** <br/>
- Swift는 camel case를 사용하고 JSON은 snake case를 사용하기 때문에 Key값이 달라서 nil값을 반환할 수 있다고 합니다. 
- CodingKey 프로토콜을 사용하여 이를 방지 하였습니다.

### 🔒 **lazy var** <br/>
![](https://i.imgur.com/0xiCWki.png)
![](https://i.imgur.com/H2udvWP.png)
- self를 ExpoInfoMainViewController.self로 변경하라는 경고메시지가 출력되었습니다.
- 버튼의 인스턴스화를 연기하는 lazy를 사용해서 문제를 해결했습니다.

### 🔒 **메인페이지 네비게이션 바 숨기기** <br/>
- 메인페이지의 네비게이션만 숨기기 위해 뷰 컨트롤러의 상태 메서드를 사용하였습니다.
- 화면이 나타날 때 숨겼다가, 화면이 사라질 때 다시 보이도록 구현하였습니다.

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

### 🔒 **Label 자동 줄바꿈** <br/>
```swift
label.numberOfLines = 0
label.lineBreakMode = .byWordWrapping
```
- Label 옵션을 주어서 설정을 해주었지만 줄바꿈이 되지 않았습니다.
```swift
mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
```
- Label의 상위뷰인 mainStackView의 width값을 주어서 해결했습니다.


### 🔒 **Table view delegate의 메서드 사용하기** <br/>
- 스토리보드 없이 코드로만 UI를 구현해서 스토리보드 세그를 사용하는 `prepare` 메서드로 셀의 정보를 보내는 것이 어려웠습니다.
- 다음에 올 페이지에 Entry 타입의 정보를 받을 프로퍼티를 구현하고, `Table view delegate`를 사용해 Entry 타입의 값을 전달하도록 구현하였습니다.

``` swift
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let entryInfoViewController = EntryInfoViewController(entry: entryList[indexPath.row])
    navigationController?.pushViewController(entryInfoViewController, animated: true)
}
```

## 6. Reference

1. [애플 공식문서 - UITableViewCell](https://developer.apple.com/documentation/uikit/uitableviewcell)
2. [커스텀 셀 만들기 - centerYAnchor](https://feelsodev.tistory.com/7)
3. [애플 공식문서 - layoutSubviews()](https://developer.apple.com/documentation/uikit/uiview/1622482-layoutsubviews)
4. [ViewController initialization](https://woozzang.tistory.com/168)
5. [애플 공식문서 - UITableView](https://developer.apple.com/documentation/uikit/uitableview)
6. [애플 공식문서 - Table views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)
7. [애플 공식문서 - Filling a table with data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)
8. [애플 공식문서 - JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
