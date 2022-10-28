# 만국박람회

## 0. 목차
1. [소개](#1-소개)
2. [팀원](#2-팀원)
3. [타임라인](#3-타임라인)
4. [시각화된 프로젝트 구조](#4-시각화된-프로젝트-구조)
5. [실행 화면](#5-실행-화면)
6. [트러블 슈팅](#6-트러블-슈팅)
7. [핵심 경험](#7-프로젝트-수행-중-핵심-경험)
8. [참고 링크](#8-참고-링크)

## 1. 소개
UITableView, UIScrollView와 JSON 데이터를 활용한 만국 박람회 소개 애플리케이션 입니다.
<br>

## 2. 팀원
<div align="center">

| zhilly | Mangdi |
| :---: | :---: |
| <img src=https://user-images.githubusercontent.com/99257965/190572502-b7a41ed7-3c1b-44af-8b03-77d7e49d4705.png width=150> |  |
| @zhilly11 | @Mangdi |


</div>


<br>

## 3. 타임라인
[STEP-1]
- 2022.10.17
    - JSON 파일을 Decoding할 Model 타입 생성
    - 프로젝트 파일들을 MVC방식으로 정리

[STEP-2] 
- 2022.10.18
    - 프로젝트에 Asset 파일 추가
    - JSON 파일을 Decoding해서 화면에 데이터를 뿌려줄수있게 구현
    - 한국의 출품작 (두번째화면)을 테이블뷰로 구현
- 2022.10.20
    - 출품작의 디테일뷰 (세번째화면) 구현
    - 두번째화면에서 세번째화면으로 넘어갈때 prepare로 값을전달하여 구현
- 2022.10.23
    - 첫화면의 네비게이션바가 안보이게, status bar 영역까지 컨텐츠가 보이도록 구현
    - 네비게이션 back버튼의 타이틀 버그 수정 및 에러처리 도입

[STEP-3]
- 2022.10.25
    - 첫화면은 세로로만, 나머지화면은 가로세로 적용되게 구현
- 2022.10.26
    - 테이블뷰의 셀을 기본형에서 CustomCell로 구현
    - 2번째화면에서 3번째화면으로 세그가 아닌 TableView Delegate로 값 전달하게 구현
    - 셀의 레이블뷰 내용이 전부 보일수있도록 오토레이아웃 수정
    - 모든화면에 Dynamic Type 적용
- 2022.10.27
    - 세번째화면의 오토레이아웃 수정

<br>

## 4. 시각화된 프로젝트 구조
### 클래스 다이어그램
![universelleUML](https://user-images.githubusercontent.com/49121469/198496550-c04c4036-3ccd-4825-b8d8-0e97bcfcf7d8.png)

### File Tree

```bash

.
├── Controller
│   ├── EntriesDetailViewController.swift
│   ├── KoreanEntriesViewController.swift
│   └── MainViewController.swift
├── Delegate
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
├── Info.plist
├── Model
│   ├── Assets.xcassets
│   │   └── expo_assets
│   ├── ExpositionUniverselle.swift
│   └── KoreanEntry.swift
└── View
    ├── Base.lproj
    │   ├── LaunchScreen.storyboard
    │   └── Main.storyboard
    ├── KoreanEntryTableViewCell.swift
    └── KoreanEntryTableViewCell.xib
```


<br>

## 5. 실행 화면
### 세로화면 실행
<img src=https://user-images.githubusercontent.com/99257965/198444794-974a2a7c-59f5-4506-9f4d-66497555d0f7.gif>

### 가로화면 실행
<img src=https://user-images.githubusercontent.com/99257965/198447614-1cafb9b1-c054-40ed-b52a-8896c08b6630.gif width=500>


### 모든 화면에 Dynamic Type을 적용
<img src=https://user-images.githubusercontent.com/99257965/198439670-17d106f1-b8ea-467c-a9e8-3a18be8dd27d.gif width=500>


## 6. 트러블 슈팅
<details>
    <summary>다른 컨트롤러로 이동힐 때의 방법 고민</summary>
`KoreanEntriesViewController` 에서 `EntriesViewController`로 이동할때 `UITableViewDelegate`를 사용할지 세그의 prepare를 사용할지 고민되었습니다.
    
테이블뷰의 셀을 클릭할때 값을 넘겨줘야하는데 셀을 클릭하는 상호작용은 delegate가 맡을텐데 `UITableViewDelegate`를 이용하는것이 맞을것이다. 하는 생각과 값을 넘겨주는 것이니까 세그를 사용하는게 맞다 하는 두가지 생각이 들었습니다. 둘중 어느방법이 나을까 고민하다가 공식문서에 테이블뷰의 `indexPathForSelectedRow` 라는 속성이 있다는것을 알곤, 세그의 prepare로 쉽게 구현이 가능했습니다.
만약 delegate로 구현했다면 코드가 훨씬 더 길어졌을것같단 생각이 들었습니다.
이로써 문서읽어보기의 중요성을 다시한번 상기시켜봅니다.
<img width="959" alt="스크린샷 2022-10-20 오후 5 22 53" src="https://user-images.githubusercontent.com/49121469/197091019-fea1d2cd-a249-4e6b-81a5-1250e0f18631.png">
    
</details>

<details>
    <summary>`UIScrollView` 초기 레이아웃 설정</summary>
    `UIScrollView`는 다른 요소들 보다 초기에 설정해줘야할 제약사항들이 많았습니다. 계속 에러가 나는 현상을 겪었고, 원인은 안에 있는 View에 height나 width에 제약사항을 잘못 걸어줘서 나는 에러였습니다. 

해결 방법 : 
    1. `ScrollView` 내부에 요소의 width를 `ScrollView`의 `Frame Layout Guide`에 Equal Width를 해줬습니다.
    2. height는 세로 `ScrollView`이기 때문에 동적으로 변할 수 있도록 constant를 0으로 설정하고 priority 값을 조정해줬습니다.
    
</details>
    
    
<details>
    <summary>`UITableViewCell`의 textLabel이 deprecated 된것</summary>
    `tableViewCell`의 textLabel.text = "" 이러한코드를 작성할때 노란글씨로 `deprecated`라는 경고문을 보았습니다. 
    그렇다면 어떤식으로 작성해야하는지 왜 그렇게 해야하는지에 찾아봤습니다.
    wwdc 2020에 나온 내용으로, ios14 버전부터 셀에 새로운 content configurations을 사용한다는것과 테이블뷰와 컬렉션뷰에 들어가는 셀을 동일한 접근 방식을 사용하는 표준이라는점 그리고 경량화하고 성능을 높이기 위해 쓰인다는것을 알게 되었습니다. 이 밖에도 여러가지 정보가 있습니다. 아래 WWDC2020 Cell Notes 링크를 통해 더 자세히 알아볼수 있습니다.

</details>


<details>
    <summary>커스텀셀의 오토레이아웃</summary>
    커스텀셀을 생성하고 이미지 하나와 제목레이블 하나 그리고 설명하는 레이블 하나로 구성해주었습니다.
    레이블 두개를 스택뷰로 묶고 그다음 이미지와 스택뷰를 또 스택뷰로 묶어주었습니다.
    근데 설명레이블에 들어있는 텍스트만큼 높이를 유동적으로 주는것이 목표였는데 이미지의 크기만큼 높이가 더이상 늘어나지 않아서 어떻게 해야할까 고민이었습니다.
    결국 오토레이아웃에 대한 이해도가 부족하여 생긴 일이었습니다.
    다시 오토레이아웃에 대해 공부해보면서 차근차근 해결했습니다.

</details>

<details>
    <summary>JSON 파일 Decoding 실패 시 오류처리</summary>
    JSON 파일을 Decoding 실패 했을 때 처음엔 그냥 빈 값을 반환해주는 구조였습니다. 이렇게 되면 사용자 입장에서 보면 어떤 오류 때문에 데이터들이 안나오는지 알 수 없기 때문에 alert을 사용자에게 띄워줘서 메시지를 확인 할 수 있도록 했습니다.
    

</details>
    
<br>

## 7. 프로젝트 수행 중 핵심 경험
- UIScrollView의 이해
- UITableView와 UITableViewCell의 이해
- Cell의 재사용
- JSON 형식의 데이터 Encoding, Decoding
- 네비게이션 컨트롤러를 활용한 화면 전환
- 다양한 기기에 AutoLayout 적용하기
- 화면회전 방법에 대한 이해
- 접근성의 개념과 필요성에 대한 이해
- Dynamic Types에 대한 이해


<br>

## 8. 참고 링크
- [UITableView](https://developer.apple.com/documentation/uikit/uitableview)
- [Table Views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)
- [Filling a Table with Data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)
- [JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
    - [Using JSON with Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)
    - [Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
- [WWDC2020 Cell Notes](https://www.wwdcnotes.com/notes/wwdc20/10027/)
- [Accessibility Inspector (WWDC 2019)](https://developer.apple.com/videos/play/wwdc2019/257/)




---
[🔝 맨 위로 이동하기](#계산기)
