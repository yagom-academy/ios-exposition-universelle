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
> UITableView, UIScrollView와 JSON 데이터를 활용한 만국 박람회 소개 애플리케이션 입니다.
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
    - 프로젝트 파일 폴더별로 정리
    - STEP-1 Pull Request

[STEP-2] 
- 2022.10.18
    - 프로젝트에 Asset 파일 추가
    - JSON 파일을 Decoding해서 Model에 저장할 수 있는 코드 추가
    - 메인 화면 구성
    - 한국의 출품작 목록 화면 구성
    - 기초 레이아웃 설정
- 2022.10.20
    - 한국의 출품작 상세 설명 화면 구성
    - 화면간 데이터 전달하는 기능 구현
    - 리팩토링
    - STEP-2 Pull Request

[STEP-3]

<br>

## 4. 시각화된 프로젝트 구조
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
    └── Base.lproj
        ├── LaunchScreen.storyboard
        └── Main.storyboard
```


<br>

## 5. 실행 화면
![celle](https://user-images.githubusercontent.com/49121469/197090538-185541b7-438c-4142-8852-43cb89210e99.gif)



## 6. 트러블 슈팅
<details>
    <summary>다른 컨트롤러로 이동힐 때의 방법 고민</summary>
KoreanEntriesViewController에서 EntriesViewController로 이동할때 UITableViewDelegate를 사용할지 세그의 prepare를 사용할지 고민되었습니다.
    
테이블뷰의 셀을 클릭할때 값을 넘겨줘야하는데 셀을 클릭하는 상호작용은 delegate가 맡을텐데 UITableViewDelegate를 이용하는것이 맞을것이다. 하는 생각과 값을 넘겨주는 것이니까 세그를 사용하는게 맞다 하는 두가지 생각이 들었습니다. 둘중 어느방법이 나을까 고민하다가 공식문서에 테이블뷰의 indexPathForSelectedRow 라는 속성이 있다는것을 알곤, 세그의 prepare로 쉽게 구현이 가능했습니다.
만약 delegate로 구현했다면 코드가 훨씬 더 길어졌을것같단 생각이 들었습니다.
이로써 문서읽어보기의 중요성을 다시한번 상기시켜봅니다.
<img width="959" alt="스크린샷 2022-10-20 오후 5 22 53" src="https://user-images.githubusercontent.com/49121469/197091019-fea1d2cd-a249-4e6b-81a5-1250e0f18631.png">
    
</details>

<details>
    <summary>UIScrollView 초기 레이아웃 설정</summary>
    UIScrollView는 다른 요소들 보다 초기에 설정해줘야할 제약사항들이 많았습니다. 계속 에러가 나는 현상을 겪었고, 원인은 안에 있는 View에 height나 width에 제약사항을 잘못 걸어줘서 나는 에러였습니다. 

해결 방법 : 
    1. ScrollView 내부에 요소의 width를 ScrollView의 Frame Layout Guide에 Equal Width를 해줬습니다.
    2. height는 세로 ScrollView이기 때문에 동적으로 변할 수 있도록 constant를 0으로 설정하고 priority 값을 조정해줬습니다.
    
</details>
    
    
<details>
    <summary>UITableViewCell의 textLabel이 deprecated 된것</summary>
    tableViewCell의 textLabel.text = "" 이러한코드를 작성할때 노란글씨로 deprecated라는 경고문을 보았습니다. 
    그렇다면 어떤식으로 작성해야하는지 왜 그렇게 해야하는지에 찾아봤습니다.
    wwdc 2020에 나온 내용으로, ios14 버전부터 셀에 새로운 content configurations을 사용한다는것과 테이블뷰와 컬렉션뷰에 들어가는 셀을 동일한 접근 방식을 사용하는 표준이라는점 그리고 경량화하고 성능을 높이기 위해 쓰인다는것을 알게 되었습니다. 이 밖에도 여러가지 정보가 있습니다. 아래 WWDC2020 Cell Notes 링크를 통해 더 자세히 알아볼수 있습니다.

</details>
    
<br>

## 7. 프로젝트 수행 중 핵심 경험
- UIScrollView의 이해
- UITableView와 UITableViewCell의 이해
- Cell의 재사용
- JSON 형식의 데이터 Encoding, Decoding


<br>

## 8. 참고 링크
- [UITableView](https://developer.apple.com/documentation/uikit/uitableview)
- [Table Views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)
- [Filling a Table with Data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)
- [JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
    - [Using JSON with Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)
    - [Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
- [WWDC2020 Cell Notes](https://www.wwdcnotes.com/notes/wwdc20/10027/)




---
[🔝 맨 위로 이동하기](#계산기)
