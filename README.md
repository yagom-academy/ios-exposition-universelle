# Exposition-universelle

## 🗒︎목차
1. [소개](#-소개)
2. [개발환경 및 라이브러리](#-개발환경-및-라이브러리)
3. [팀원](#-팀원)
4. [타임라인](#-타임라인)
5. [실행화면](#-실행-화면)
6. [트러블 슈팅 및 고민](#-트러블-슈팅-및-고민)
7. [참고링크](#-참고-링크)


## 👋 소개
[Kyo](https://github.com/KyoPak)와 [토털이](https://github.com/tottalE)가 구현한 Exposition-universelle Step-2 입니다.
만국 박람회 앱으로 expo를 소개하는 앱입니다. 
`Decoding`, `ScrollView`, `TableView`를 중점적으로 학습하며 프로젝트를 진행해나갔습니다.

## 💻 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()


## 🧑 팀원 
<img src = "https://user-images.githubusercontent.com/59204352/193524215-4f9636e8-1cdb-49f1-9a17-1e4fe8d76655.PNG" width=200 height=170>|<img src = "https://avatars.githubusercontent.com/u/66786418?v=4" width=200 height=170>|
|:--:|:--:|
|[Kyo](https://github.com/KyoPak)| [tottalE](https://github.com/tottalE) |
 

## 🕖 타임라인

### Step - 1 : 2022.10.17 ~ 10.18
- JSON의 Decodable 모델 생성

### Step - 2 : 2022.10.18 ~ 10.21
- 메인 화면의 `Scrollview` 생성
- 메인 화면의 JSON 데이터 `Decoding` 및 배치
- 한국 박람회 화면의 `TableView` 생성
- 한국 박람회 화면의 `TableViewCell` 설정 
- 한국 박람회 아이템 상세 화면의 `ScrollView` 설정
- 한국 박람회 아이템 상세 화면의 `ScrollView` 내 `Decode`된 데이터 배치

## 💻 실행 화면 
|Main 화면| Expo 화면 |
|------|----|
|![](https://i.imgur.com/pCDrwOe.gif)|![Screen Recording 2022-10-21 at 3 44 41 PM](https://user-images.githubusercontent.com/66786418/197134476-0ee7c273-d265-4cc6-862c-cc584f4429ca.gif)|

## 🎯 트러블 슈팅 및 고민

## Step-1, 2

### 1. ScrollView의 Constraint에 대한 고민 

- 스크롤 뷰의 Constraint를 주는 방법은 다양합니다. 
- 스크롤 뷰의 super view에 주는 경우에는 `frameLayoutGuide`에 주는 것과 같은 결과로 동작하고, subview에 constraint를 주는 경우에는 `contentLayoutGuide`에 constraint를 주는 것과 같게 동작하게 되는 것을 알게 되었습니다. 
- 이 두 가지가 섞여있거나, LayoutGuide없이 Constraint를 짜는 경우에 혼란이 있을 수 있다는 것을 알게 되었습니다.

### 2. 기본 Cell을 선택한 이유
- 기본셀의 예전 사용법이 depreciated되고, 새롭게 `defaultContentConfiguration`을 통해 기본셀을 사용해줄 수 있는 방법을 사용해 보고 싶었습니다.
- cell내의 content를 `defaultContentConfiguration`를 통해 받아온 후, 여러 프로퍼티를 설정해 준 후에, cell의 `contentConfiguration`에 content의 `configuration`에 할당하여 cell을 커스텀으로 만들어주지 않고도 셀의 이미지와 텍스트 등등을 조정해 줄 수 있었습니다.

---

    
## 📚 참고 링크
<br>[NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)<br>[오토레이아웃 정복하기 - 야곰닷넷](https://yagom.net/courses/autolayout/)
[Easier Scrolling With Layout Guides](https://useyourloaf.com/blog/easier-scrolling-with-layout-guides/)<br>[Filling a Table with Data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)<br>[Configuring the Cells for Your Table](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table)<br>[JSON](https://ko.wikipedia.org/wiki/JSON)<br>[JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
