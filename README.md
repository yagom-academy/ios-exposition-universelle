## 📚 제목
만국 박람회

## 📖 소개
1900년 파리에서 진행되었던 엑스포의 한국 출품작을 테이블 뷰로 보여주는 앱 입니다.

<br/>

**프로젝트를 구현하며 사용해본 것**
- TDD
- ScrollView
- AutoLayout
- TableView
- JSONDecoding
- Dynamic Type

## 🧑🏻‍💻 팀원

|미니|제이푸시|
|:-:|:-:|
| <img src="https://i.imgur.com/jEks1gy.png" width="180px"/> | <img width="180px" src="https://i.imgur.com/JqEDLOf.jpg"> |

## 시각화된 프로젝트 구조(다이어그램 등)
![UML](https://i.imgur.com/FlWv9TB.png)

## ⏰ 타임라인: 프로젝트의 주요 진행 척도

**STEP1**
- 10월 18일
    - 프로젝트 요구사항 분석
    - Assets 파일 추가
    - JSON 파싱 테스트 코드 작성
    - Exposition, Item 타입 생성

**STEP2**
- 10월 20일
    - 포스터 화면 요소 생성
    - 스크롤 뷰를 제외한 포스터 뷰 오토레이아웃 설정
- 10월 21일
    - UIScrollView 추가 및 포스터 UI 요소 리팩터링
    - Json 디코딩 메서드 추가 및 뷰에 데이터 설정
- 10월 24일
    - 출품작 화면으로 push 메서드 설정
    - 출품작 화면 생성 및 push
    - customTableCell 생성
    - JSON Decoding
- 10월 25일
    - 출품작 화면의 오토레이아웃 설정
    - 출품작 디테일설명
- 10월 26일
    - 모델 타입 변수명 수정
    - 뷰 업데이트 관련 메서드 수정

**STEP3**
- 10월 27일
    - 화면 Orientation 구현
    - Font 다이나믹 타입 구현
- 10월 28일
    - 컨벤션 정리
    - 상속 불가 클래스 수정


## 🖥 실행 화면(기능 설명)

### 전체 실행화면
<img src="https://i.imgur.com/LNcK4cp.gif" width = "300px">

## 첫 화면 제외, portrait, landscape 설정

![](https://i.imgur.com/tdxM0oZ.gif)


## 🔥 트러블 슈팅

### 스크롤뷰에 View를 추가했지만 스크롤이 되지 않았던 문제
**해결 전**
![trouble1_unsolved](https://i.imgur.com/EoFD52o.png)

**해결 후**
![trouble1_solved](https://i.imgur.com/gcbGVJN.png)


UIScrollView는 ContentLayout이라는 뷰와 내부의 요소들의 뷰의 높이나 폭이 동일하여야만 스크롤을 할 수 있도록 되어있습니다. 하지만, 내부 요소들의 width가 scrollView의 ContentLayout의 width와 동일하지 않아서 발생한 문제였습니다. 이를 해결하기 위해서containerView를 만들어서 요소들을 넣은 다음 containerView와 scrollView의 width를 맞췄습니다.

### 이미지 오토레이아웃 설정 시 크기 조절이 되지 않는 문제

| 해결 전| 해결 후 |
|:-:|:-:|
| ![](https://i.imgur.com/fVrF9vW.png)|![](https://i.imgur.com/bGDPl38.png)

CustomView로 구성한 버튼의 heightAnchor가 0이 되는 문제가 발생하였습니다. 이는 UIView 클래스가 Instric Content Size를 가지고 있지 않기 때문이었습니다. 즉, 컨텐츠의 본질적인 사이즈를 가지지 않기 때문에 직접적으로 설정 하지 않는 이상, 계산을 수행할 수 없게 되는 것입니다. 
또한, 저희의 문제는 heigh값이 정해지지 않은 상황에서 위의 뷰의 Constraint를 적용하여도, UIView의 height 값이 0이기 때문에 의도와 다르게 뷰의 Constraint가 설정되게 되었습니다.

그래서 UIVIew의 height크기를 이미지크기의 height와 동일하게 설정하여 Instrict Content Size를 가질 수 있도록 해 주었습니다.

### 셀의 높이를 Dynamic하게 조절하지 못하는 문제

| 해결 전| 해결 후 |
|:-:|:-:|
| ![trouble2_unsolved](https://i.imgur.com/N73YsIM.png) | ![trouble2_solved](https://i.imgur.com/dGk4Vxo.png) |

테이블 뷰의 커스텀 셀을 구현하는 과정에서 TableView의 다이나믹 Height를 주는 것을 구현하려고 하였습니다.

처음에는 2개의 뷰를 통해서 높이를 직접적으로 계산할 수 있도록 하면, 자동적으로 늘어날 것이라고 생각하였습니다. 하지만, 2개의 뷰를 통해서 높이를 계산하는 것은 이미지의 height를 계산하는 과정에서 contentView의 높이가 모호해지는 결과를 낳게 되었고, 이를 해결하기 위해서 automaticDemention과 estimatedHeightForRowAt 를 이용하려고 하였지만 해결되지 않았습니다.

이에 대한 문제는 이미지에 대한 높이를 계산하는 제약과 title과 subTitle의 높이를 계산하는 과정에서 충돌하는 문제였습니다. 추가적으로 title, subtitle이 중앙 정렬이 되지 않고 top으로 붙게 되거나 bottom으로 붙게 되었습니다.

이를 해결하기 위해서 정확하게 Instrict Size를 자동적으로 계산하는 StackView를 활용하여 높이를 자동적으로 계산하고, Top과 Bottom의 제약사항을 통해서 뷰의 셀의 높이를 계산할 수 있도록 하였고, greater와 less 제약사항과 centerYanchor를 통해서 중앙 정렬을 할 수 있도록 하였습니다.

## 🤔 회고
- 개인 레포지토리에서 추가 예정

## 🔗 참고 링크
[JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
[TableView](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)
[Accessibility Inspector (WWDC 2019)](https://developer.apple.com/videos/play/wwdc2019/257/)
