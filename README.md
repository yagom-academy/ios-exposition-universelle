## 📚 제목
만국 박람회

## 📖 소개
1900년 파리에서 진행되었던 엑스포의 한국 출품작을 테이블 뷰로 보여주는 앱 입니다.

<br/>

**프로젝트를 구현하며 사용해본 것**
- TDD
- ScrollView
- AutoLayout

## 🧑🏻‍💻 팀원

|미니|제이푸시|
|:-:|:-:|
| <img src="https://i.imgur.com/jEks1gy.png" width="180px"/> | <img width="180px" src="https://i.imgur.com/JqEDLOf.jpg"> |


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

## 🖥 실행 화면(기능 설명)

### 포스터 화면 오토레이아웃 설정
<img src="https://i.imgur.com/D24TRJS.gif" width = "300px">

## 🔥 트러블 슈팅

### 스크롤뷰에 View를 추가했지만 스크롤이 되지 않았던 문제
**해결 전**
![](https://i.imgur.com/EoFD52o.png)

**해결 후**
![](https://i.imgur.com/gcbGVJN.png)


UIScrollView는 ContentLayout이라는 뷰와 내부의 요소들의 뷰의 높이나 폭이 동일하여야만 스크롤을 할 수 있도록 되어있습니다. 하지만, 내부 요소들의 width가 scrollView의 ContentLayout의 width와 동일하지 않아서 발생한 문제였습니다. 이를 해결하기 위해서containerView를 만들어서 요소들을 넣은 다음 containerView와 scrollView의 width를 맞췄습니다.

### 이미지 오토레이아웃 설정 시 크기 조절이 되지 않는 문제

| 해결 전| 해결 후 |
|:-:|:-:|
| ![](https://i.imgur.com/fVrF9vW.png)|![](https://i.imgur.com/bGDPl38.png)

CustomView로 구성한 버튼의 heightAnchor가 0이 되는 문제가 발생하였습니다. 이는 UIView 클래스가 Instric Content Size를 가지고 있지 않기 때문이었습니다. 즉, 컨텐츠의 본질적인 사이즈를 가지지 않기 때문에 직접적으로 설정 하지 않는 이상, 계산을 수행할 수 없게 되는 것입니다. 
또한, 저희의 문제는 heigh값이 정해지지 않은 상황에서 위의 뷰의 Constraint를 적용하여도, UIView의 height 값이 0이기 때문에 의도와 다르게 뷰의 Constraint가 설정되게 되었습니다.

그래서 UIVIew의 height크기를 이미지크기의 height와 동일하게 설정하여 Instrict Content Size를 가질 수 있도록 해 주었습니다.


## 🔗 참고 링크

[JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
