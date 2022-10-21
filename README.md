# 🇰🇷만국박람회🇰🇷

## 🗒︎목차
1. [소개](#-소개)
2. [개발환경 및 라이브러리](#-개발환경-및-라이브러리)
3. [팀원](#-팀원)
4. [타임라인](#-타임라인)
5. [실행화면](#-실행-화면)
6. [트러블 슈팅 및 고민](#-트러블-슈팅-및-고민)
7. [참고링크](#-참고-링크)


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
- ExhibitionWork 파일 생성 & 구조체 타입 설정
- ExpositionPoster 타입 추가 구조체 설정
- ExpositionPoster Codable프로토콜 채택 및 ExhibitionWork CodingKeys 열거형 구현
- 스토리보드 메인 포스터 화면 설정

### 2022.10.20
- ScollView 추가
- 스토리보드에 TableView 생성, ExhibitionWorkListViewController 소스파일 생성
- setUpJSONData 메서드 추가
- ExhibitionWorkListViewController 타입에 UITableViewDataSource, UITableViewDelegate를 확장
- detailView 스토리 보드 구현
- DetailWorkViewController 소스 파일 생성
- imageView와 textView 뷰컨트롤러로 연결
- DetailWorkViewController 데이터 전달 및 구현
- 스토리보드 수정, formatNumber 메서드 추가, setUpPosterData 메서드 수정

### 2022.10.21
- detailView의 ScrollView 제약 조건 수정
- formatNumber Int extension 리팩토링
- ExhibitionMainViewController 컨트롤러 split 함수 삭제

## 💻 실행 화면 

<img src="https://i.imgur.com/rPGG5NG.gif" width="300px">

## 🎯 트러블 슈팅 및 고민
- `UITableViewCell`
현재 UITableViewCell은 스토리보드 상 Subtitle로 구성이 되어 있습니다. 하지만 예시 화면과 조금 다르게 표시되었습니다.

    |예시 화면|구현한 화면|
    |:---:|:---:|
    |<img src="https://i.imgur.com/M97gnD7.png" width="200px">|<img src="https://i.imgur.com/5w491aM.png" width="200px">|

    그래서 커스텀 셀로 구현할까 고민했지만, Step 3에서 테이블 뷰의 오토레이아웃 문제를 해결하는 걸로 알고 있어, 일단은 보류하였습니다. 

- `prepare`메서드의 위치
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
    `prepare` 메서드는 `tableView`의 cell의 데이터 전환전에 실행하면서 데이터를 전달하는 메서드로 `UITableViewDataSource`채택하며 `ExhibitionWorkListViewController`의 확장에 구현을 할지 아니면 위쪽에 정의를 할지 고민이 되었습니다.

    하지만 `UITableViewDataSource`의 확장과는 관련이 없어보여 원래의 class정의한 곳에 구현하였습니다.


## 📚 참고 링크

[[iOS] scrollView 개념 부터 구현까지 뽀개기 - HoonIOS](https://boidevelop.tistory.com/100)
[iOS ) Label의 부분 글자 크기/폰트/색상 변경방법](https://zeddios.tistory.com/300)
[Apple Developer - indexPathForSelectedRow](https://developer.apple.com/documentation/uikit/uitableview/1615000-indexpathforselectedrow)
[[iOS] scrollView 개념 부터 구현까지 뽀개기 - HoonIOS](https://boidevelop.tistory.com/100)
