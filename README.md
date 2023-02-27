# 만국박람회

## ⭐️ 목차

1. [팀원소개](#팀원소개)
2. [프로젝트 소개](#프로젝트-소개)
3. [타임라인](#타임라인)
4. [다이어그램 보기](#다이어그램-보기)
5. [파일 구조](#파일-구조)
6. [트러블 슈팅](#트러블-슈팅)
7. [참고](#참고)
8. [아쉬웠던 점](#아쉬웠던-점)

---

## 팀원소개

|<center>세홍</center>|<center>송준</center>|<center>무리</center>|
|---|---|---|
|<img width= "200" alt="img" src=https://i.imgur.com/vBfH23K.png>|<img height="210px" src="https://i.imgur.com/9Bd6NIT.png">|<img width="200" alt="image" src=https://i.imgur.com/U7TmXby.jpg>|

---



---

## 프로젝트 소개

> 1900 만국박람회에 출품된 한국의 작품들을 볼 수 있는 앱입니다.

### 스텝 수행 중 핵심 경험

<details>
<summary>스텝별 핵심경험</summary>

### STEP 1
    
- [x] JSON 포멧의 데이터와 매칭할 모델 타입 구현 

### STEP 2

- [x] JSON Decode 해보기
- [x] AssetData 불러오기
- [x] TableView 구현

</details>

---

## 타임라인

<details>
<summary>타임라인</summary>

| STEP | 날짜 | 타임라인 |
| --- | --- | --- |
| STEP1 | 2023.02.20 | - 파일분리 및 주석 삭제, 수정 </br>-  MainView model 타입 구현 </br>- Items model타입 구현 </br>- 파일 이름 및 타입 명 수정 |
| STEP1 | 2023.02.21 | - ViewController안에 사용되지않는 viewDidLoad메서드 삭제</br>-EntryItem으로 이름 변경, DeCodable채택으로 변경</br>- 오타 수정</br>|
| STEP2 | 2023.02.22 | - decoder생성 </br>- 첫번째 UI 구현 </br>- 데이터파일 추가 </br>- 첫번째 뷰 스크롤기능 구현</br>- NavigateController 생성 및 SecondViewController UI 구현</br>- SecondViewController구현 및 ListTableViewCell 타입 구현</br>- SecondViewController UI 수정</br>- itemDetailViewController 생성 및 UI구현</br>- prepare()메소드로 데이터 전달</br>- ItemDetailViewController UI 수정</br>- SecondViewController UI 변경|
| STEP2 | 2023.02.23 | - 방문자 수 numberFormatter적용</br>- viewController Label 수정</br>- viewController에서 navigationBar 숨김기능 구현</br>- viewController titleLabel 수정 </br>- 접근제어자 설정 및 코드컨벤션 </br>- 파일이름 변경 

</details> 

---

## 다이어그램 보기

<details>
<summary>Class Diagram</summary>

### STEP2 UML

![만국박람회-UML](https://user-images.githubusercontent.com/88870642/220834512-0e52f8c9-7b0c-4c3e-ab46-13ce43042d78.jpg)
    
</details>

## 파일 구조

```
|____Extension
| |____Int+Extension.swift
|____App
| |____AppDelegate.swift
| |____SceneDelegate.swift
|____Models
| |____Exposition.swift
| |____ExpoItem.swift
|____Base.lproj
|____Controller
| |____MainViewController.swift
| |____testViewController.swift
| |____SecondViewController.swift
| |____ItemDetailViewController.swift
|____Model
|____View
| |____Assets.xcassets
| |_____AssetsFile생략
| |____Base.lproj
| | |____LaunchScreen.storyboard
| | |____Main.storyboard
| |____ListTableViewCell.swift
|____Info.plist

```

---

## 트러블 슈팅

### 1️⃣ 상세정보 페이지에 데이터 전달하기
- 한국의 출품작 목록을 나타내는 뷰컨트롤러에서 셀(출품작)을 선택하게되면 출품작의 상세정보를 보여주는 페이지를 나타내주어야했습니다.
처음엔 Decoder를 이용하여 한 번 더 데이터를 파싱해오는 방법을 생각했는데, Segue를 이용하여 데이터를 넘기는 방법이 생각 나 이용해보았습니다.
- prepare()메소드를 이용하여 데이터를 넘겨받을 뷰컨트롤러를 설정 한 후 현재 뷰컨트롤러의cell이 가지고있는 데이터를 다음뷰컨트롤러의 전역변수에 담아 사용해보았습니다.

### 2️⃣ 구조체 내에서 read-only computed property
- 구조체 내에서 아래 예시와 같이 저장 프로퍼티를 통해 init()되지 않은 visitors프로퍼티를 다른 저장 프로퍼티에 담으려고 할 때 이러한 오류 메시지가 나옵니다. 저장 프로퍼티 안에 값이 초기화되지 않은 상태에서 다른 저장 프로퍼티에 담으려고 하여 오류가 발생된거 같습니다.

<img width="532" alt="image" src="https://user-images.githubusercontent.com/88870642/220825662-6e9468f9-940d-4d41-b3b4-9cd47de5b872.png">

- 변경 전
    ```swift
    struct Exposition: Decodable {
        let visitors: Int
    
        var visitorLabelText: String = "방문객 : \(visitors.setDecimal()) 명"
    }
    ```
- 위 문제를 해결하기 위해 연산 프로퍼티를 사용했습니다. 연산 프로퍼티의 경우 구조체가 인스턴스되고 난 이후에 호출이 가능하기 때문에 구조체가 인스턴스되는 과정에서 저장 프로퍼티의 값이 초기화되어 사용이 가능하다고 이해했습니다.
- 변경 후
    ```swift
    struct Exposition: Decodable {
    let visitors: Int

    var visitorLabelText: String {
        return "방문객 : \(visitors.setDecimal()) 명"
        }
    } 
    ```

---

## 참고
- [애플 공식문서 - UITableView](https://developer.apple.com/documentation/uikit/uitableview)
- [애플 공식문서 - Table Views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)
- [애플 공식문서 - UIScrollView](https://developer.apple.com/documentation/uikit/uiscrollview)

---
## 아쉬웠던 점
### 1️⃣ StoryBoard 사용
- 코드 리뷰 시 스토리보드를 사용하면 코드리뷰가 어렵다는 점을 몰라 StoryBoard를 사용한것이 아쉽습니다. 
STEP3를 진행하며 코드로 바꾸어 진행해봐야겠다는 생각이 듭니다.

### 2️⃣ Segue 사용
- 데이터 전달을 Segue를 이용해 구현했는데, 코드리뷰를 받고 나니 좋은 방향은 아니었다고 생각이 들어 다른 방법도 시도해보았으면 합니다.

### 3️⃣ 코드를 작성하는 기준과 근거
- 코드를 작성할 때, 타당한 근거와 기준이 부족했던 부분이 있었습니다.
