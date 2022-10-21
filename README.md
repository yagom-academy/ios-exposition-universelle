# 만국박람회

## 📖 목차
1. [소개](#-소개)
2. [타임라인](#-타임라인)
3. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
4. [실행 화면](#-실행-화면)
5. [트러블 슈팅](#-트러블-슈팅)
6. [참고 링크](#-참고-링크)

## 🌱 소개

`Gundy`와 `Dragon`의 iOS 만국박람회 프로젝트입니다.

## 📆 타임라인

<details>
<summary>STEP 1</summary>

221018
- Exposition
    - exposition_universelle_1900.json 파일과 매칭할 구조체 Exposition 구현
- Exhibition
    - items.json 파일과 매칭할 구조체 Exhibition 구현
- 폴더 정리
    - MVC 패턴의 시각에서 폴더 분류
</details>
<details>
<summary>STEP 1 Feedback 반영</summary>

221020
- 네이밍
    - 직관적이지 못한 네이밍 수정
- 접근제어자
    - 아직 사용하지 않는 프로퍼티들 모두 private 적용
</details>
<details>
<summary>STEP 2</summary>

221020
- InformationViewController
    - 스토리보드 상에서 기본 레이아웃 설정 및 IBOutlet 연결
    - JSONDecoder를 통해 Expoosition 타입의 인스턴스 생성
    - Exposition 인스턴스의 프로퍼티를 통해 레이블의 텍스트를 할당
    - NavigationController 임베드
    - NavigationBar hidden 처리 및 화면 전환시 hidden 해제
    - Segue를 통해 화면전환 구현
- ExhibitionListViewController
    - 스토리보드 상에서 테이블뷰와 프로토타입셀 추가하고 tableView 프로퍼티와 연결
    - JSONDecoder를 통해 [Exbibition] 타입의 인스턴스 생성
    - extension을 통해 UITabelViewDataSource 및 UITableViewDelegate 프로토콜 채택
    - 각 셀별로 기본설정을 해 주는 confogureCells 메서드 구현
    - Segue를 통해 화면전환 구현
    - 다음 화면에 넘겨줄 데이터를 위한 prepare 메서드 내부 코드 작성
- ExhibitionViewController
    - 스토리보드 상에서 기본 레이아웃 설정 및 IBOutlet 연결
    - 이전 화면에서 받아온 데이터를 통해 레이블과 이미지 및 네비게이션 타이틀 설정
    
221021
- refactoring
    - 컨벤션 통일
    - 기능이 많은 메서드 분리 및 연산 프로퍼티 작성
    - 네이밍 수정
    - 은닉화
</details>

## 👀 시각화된 프로젝트 구조
```
[Expo1900]
 ├── Info.plist
 ├── Source
 │   ├── App
 │   │   ├── AppDelegate.swift
 │   │   └── SceneDelegate.swift
 │   ├── Model
 │   │   ├── Exhibition.swift
 │   │   ├── Exposition.swift
 │   │   └── ExhibitionListTableViewCell.swift
 │   ├── View
 │   │   └── Base.lproj
 │   │        └── Main.storyboard
 │   └── Controller
 │       ├── InformationViewController.swift
 │       ├── ExhibitionListViewController.swift
 │       └── ExhibitionViewController.swift
 └── Resource
     ├── Assets.xcassets
     │   ├── AppIcon.appiconset
     │   │   └── Contents.json
     │   ├── AccentColor.colorset
     │   │   └── Contents.json
     │   ├── expo_assets
     │   │   └── Contents.json
     │   └── Contents.json
     └── Base.lproj
         └── LaunchScreen.storyboard
```


## 💻 실행 화면
- STEP3 완료 후 추가할 예정



## ❓ 트러블 슈팅


<details>
<summary>테이블뷰 셀</summary>
    
두 번째 화면(출품작 리스트 테이블뷰)에서 사용할 프로토타입 셀에서 필요한 것은 좌측의 이미지, 타이틀, 간단한 설명의 두 레이블이라고 생각했습니다. 이는 subtitle 스타일의 셀과 유사하다고 생각해 처음에는 기본 셀의 subtitle을 사용하였습니다. 그런데 액세서리뷰를 설정하는 순간부터 스크롤이 튀는 버그가 있고, 일정한 이미지 사이즈를 맞추는 것이 적절한 것 같아 커스텀 셀을 사용하는 것으로 변경하였습니다.
</details>
    
<details>
<summary>매직리터럴 vs 네임스페이스</summary>

`InformationViewController`파일에 작성된 코드 중 `"exposition_universelle_1900"`,`"메인"`와 같이 매직리터럴 사용하는 방식에서 휴먼에러 방지를 위해 enum을 사용하여 namespace 설정을 해야하나 고민해봤으나, 재사용되는 것이 아니기에 STEP2는 매직리터럴을 사용하였습니다.
</details>

<details>
<summary>크기가 다른 문자열</summary>
    
첫 화면의 방문객 수, 개최지, 개최기간 등은 콜론(:)을 기준으로 왼쪽과 오른쪽의 폰트 사이즈가 다릅니다. 해당 사항을 가장 쉽게 구현하는 것은 StackView에 Label을 두 개 넣는 것이라고 생각했는데, attributedLabel을 사용하면 단일 레이블로도 같은 결과를 낼 수 있었습니다. 더 직관적이고 간단한 방법으로 작업하기 위해 attributedLabel을 사용하기로 결정하였습니다.
</details>

        
## 🔗 참고 링크

- Apple Developer Documentation
    - [UITableView](https://developer.apple.com/documentation/uikit/uitableview)
    - [TableViews](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)
    - [Filling a table with data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)
    - [Configuring the cells for your table](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table)
    - [JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
        - [Using JSON with Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)
        - [Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
- 위키백과
    - [JSON](https://ko.wikipedia.org/wiki/JSON)
- 야곰닷넷
    - [LLDB 정복하기](https://yagom.net/courses/start-lldb/)

---

[🔝 맨 위로 이동하기](#만국박람회)
