# 🇰🇷만국박람회🇰🇷

## 🗒︎목차
1. [소개](#-소개)
2. [개발환경 및 라이브러리](#-개발환경-및-라이브러리)
3. [팀원](#-팀원)
4. [타임라인](#-타임라인)
5. [파일구조](#-파일구조)
6. [UML](#-UML)
7. [실행화면](#-실행-화면)
8. [트러블 슈팅 및 고민](#-트러블-슈팅-및-고민)
9. [참고링크](#-참고-링크)


## 👋 소개
[Aaron](https://github.com/KyoPak), [som](https://github.com/jsa0224), [Aaron](https://github.com/Hashswim)의 만국박람회 프로젝트입니다.


## 💻 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()


## 🧑 팀원
|<img src = "https://i.imgur.com/I8UdM0C.png" width=200 height=170>|<img src = "https://i.imgur.com/Q2htdu3.png" width=200 height=170>|<img src = "https://i.imgur.com/JxcVVie.png" width=200 height=170>| 
|:--:|:--:|:--:|
|[Aaron](https://github.com/hashswim)|[Som](https://github.com/jsa0224)|[Stone](https://github.com/lws2269)|
 

## 🕖 타임라인
### 2022.10.18
- `ExhibitionWork` 파일 생성 & 구조체 타입 설정
- `ExpositionPoster` 타입 추가 구조체 설정
- `ExpositionPoster` Codable 프로토콜 채택 및 `ExhibitionWork` CodingKeys 열거형 구현
- 스토리보드 메인 포스터 화면 설정

### 2022.10.20
- ScollView 추가
- 스토리보드에 TableView 생성, `ExhibitionWorkListViewController` 소스파일 생성
- `setUpJSONData` 메서드 추가
- `ExhibitionWorkListViewController` 타입에 `UITableViewDataSource`, `UITableViewDelegate`를 확장
- `detailView` 스토리 보드 구현
- `DetailWorkViewController` 소스 파일 생성
- `imageView`와 `textView` 뷰컨트롤러로 연결
- `DetailWorkViewController` 데이터 전달 및 구현
- 스토리보드 수정, `formatNumber` 메서드 추가, `setUpPosterData` 메서드 수정

### 2022.10.21
- `detailView`의 `ScrollView` 제약 조건 수정
- `formatNumber Int extension` 리팩토링
- `ExhibitionMainViewController` 컨트롤러 split 함수 삭제

### 2022.10.26
- `ExhibitionMainView` 코드로 오토레이아웃 제약 적용
- `AppDelegate`에서 메인 화면만 세로 모드로 고정되는 메서드 추가
- `TableViewCell` Class 추가, `tableView` 코드 제약조건 추가
- `DetailWorkView` 코드로 오토레이아웃 제약 적용

### 2022.10.27
- 화면이동 전환 `navigation controller`를 사용해 코드로 변경
- `NameSpace` 적용
- 오토레이아웃 제약 방식 통일
- `Dynamic Type` 구현

## 💾 파일구조
```
└── Expo1900/
    ├── Appdelegate
    ├── SceneDelegate
    ├── Assets
    ├── LanchScreen
    ├── info
    ├── Model/
    │   ├── ExhibitionWork
    │   ├── ExpositionPoster
    │   └── Extension/
    │       ├── Int + Extension.swift
    │       ├── ExhibitionMainViewController + Extension
    │       ├── DetailWorkViewController + Extension
    │       └── ExhibitionWorkListViewController + Extension
    ├── View/
    │   └── Main
    └── Controller/
        ├── ExhibitionMainViewController
        ├── ExhibitionWorkListViewController
        ├── DetailWorkViewController
        └── TableViewCell
```

## 📊 UML
 > ![](https://i.imgur.com/55fQ8ms.png)


## 💻 실행 화면

|일반 화면|다이나믹 타입 적용화면|
|:----:|:----:|
|<img src="https://i.imgur.com/vE9Xqbh.gif" width="300px">|<img src="https://i.imgur.com/68Y8ozn.gif" width="300px">|


## 🎯 트러블 슈팅 및 고민****
### `UITableViewCell`
- 현재 UITableViewCell은 스토리보드 상 Subtitle로 구성이 되어 있습니다. 하지만 예시 화면과 조금 다르게 표시되었습니다.

    |예시 화면|구현한 화면|
    |:---:|:---:|
    |<img src="https://i.imgur.com/M97gnD7.png" width="200px">|<img src="https://i.imgur.com/5w491aM.png" width="200px">|

커스텀 셀을 적용하여, `titleLabel`과 `detailLabel`을 `StackView`로 지정하고, `imageView`는 따로 오토레이아웃 제약을 주어 문제를 해결했습니다. 


### `prepare`메서드의 위치
```swift
    class ExhibitionWorkListViewController: UIViewController {
        ...
    }

    extension ExhibitionWorkListViewController: UITableViewDataSource {
        ...

        override func prepare(for segue: UIStoryboardSegue, sender: Any?)     {
            guard let detailViewController: DetailWorkViewContorller = segue.destination as? DetailWorkViewContorller else {
                return
            }
            guard let indexPath = self.exhibitionWorkTableView.indexPathForSelectedRow else {
                return
            }
            detailViewController.exhibitionWork = self.exhibitionWork[indexPath.row]
        }
    }
```

- `prepare` 메서드는 `tableView`의 cell의 데이터 전환전에 실행하면서 데이터를 전달하는 메서드로 `UITableViewDataSource`채택하며 `ExhibitionWorkListViewController`의 확장에 구현을 할지 아니면 위쪽에 정의를 할지 고민이 되었습니다.
- 하지만 `UITableViewDataSource`의 확장과는 관련이 없어보여 원래의 class정의한 곳에 구현하였습니다.
- 

### **메인 뷰만 세로모드가 가능할까?**
```swift
 func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    return .portrait
}
```

- AppDelegate에 해당 메서드를 추가 구현하면 모든 뷰가 세로 모드가 되는 문제가 있었습니다. 그래서 조건문으로 다시 구현하고 해당 Bool 타입 변수를 메인 뷰 컨트롤러에 `viewWillAppear`, `viewWillDisappear` 메서드에서 `Bool` 값을 지정해주었습니다.

```swift
// AppDelegate
func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    if !changeOrientation {
        return [.portrait]
    } else {
        return [.all]
    }
}
// ExhibitionMainViewController
override func viewWillAppear(_ animated: Bool) {
    ...
    delegate.changeOrientation = false
}
    
override func viewWillDisappear(_ animated: Bool) {
    ...
    delegate.changeOrientation = true
}
```


## 📚 참고 링크

[[iOS] scrollView 개념 부터 구현까지 뽀개기 - HoonIOS](https://boidevelop.tistory.com/100) <br>
[iOS ) Label의 부분 글자 크기/폰트/색상 변경방법](https://zeddios.tistory.com/300) <br>
[Apple Developer - indexPathForSelectedRow](https://developer.apple.com/documentation/uikit/uitableview/1615000-indexpathforselectedrow) <br>
[[iOS] scrollView 개념 부터 구현까지 뽀개기 - HoonIOS](https://boidevelop.tistory.com/100) <br>
[[야곰닷넷] 오토레이아웃 정복하기](https://yagom.net/courses/autolayout/) <br>
[iOS Device 방향 처리](https://velog.io/@wonhee010/%ED%8A%B9%EC%A0%95-ViewController%EC%97%90%EC%84%9C-%ED%99%94%EB%A9%B4-%ED%9A%8C%EC%A0%84-%EC%B2%98%EB%A6%AC/) <br>
