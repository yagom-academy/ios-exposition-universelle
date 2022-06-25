# 만국박람회 README

## 목차:
- [개요](https://hackmd.io/se5jwqftTvi_J5qiK3o0LQ#%EA%B0%9C%EC%9A%94)
- [타임라인](https://hackmd.io/se5jwqftTvi_J5qiK3o0LQ#%ED%83%80%EC%9E%84%EB%9D%BC%EC%9D%B8)
- [구동 영상](https://hackmd.io/se5jwqftTvi_J5qiK3o0LQ#%EC%B2%AB-%ED%99%94%EB%A9%B4-%EC%84%B8%EB%A1%9C-%EC%84%A4%EC%A0%95)
- [실행 화면에 대한 설명](https://hackmd.io/se5jwqftTvi_J5qiK3o0LQ#%EC%8B%A4%ED%96%89-%ED%99%94%EB%A9%B4%EC%97%90-%EB%8C%80%ED%95%9C-%EC%84%A4%EB%AA%85)
- [트러블 슈팅](https://hackmd.io/se5jwqftTvi_J5qiK3o0LQ#%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85)
- [참고 링크](https://hackmd.io/se5jwqftTvi_J5qiK3o0LQ#%EC%B0%B8%EA%B3%A0-%EB%A7%81%ED%81%AC)
---

## 개요
* 프로젝트명: 만국박람회

* 소개: 1900년 파리 만국박람회와 그 배경, 그리고 참가국으로써의 한국(당시 대한제국)의 주변을 둘러싼 역사적 상황, 그리고 한국의 출품작에 대해 다루고 설명하는 앱

* 팀원
    | 나이든별 | KayAhn |
    |:--------:|:------:|
    |  ![](https://i.imgur.com/fLzA5CS.jpg) | ![](https://i.imgur.com/iMppyyH.jpg)|

---
## 타임라인
* 첫째주 타임라인 (2022.06.13 ~ 2022.06.17)
    * 월 : 프로젝트 사전 준비. 필요한 사항에 대한 공부.
    * 화 : 포스터 모델 및 출품작 모델 구현
    * 수 : 피드백 받은 부분에 따라 출품작 모델 보완 및 보강 - 이미지를 불러오는 프로퍼티 추가
    * 목 : 포스터 뷰 구현, 한국의 출품작 테이블 뷰 구현
    * 금 : 한국의 출품작 테이블 뷰 셀 구현, 한국의 출품작 상세 뷰 구현

* 둘째주 타임라인 (2022.06.20 ~ 2022.06.24)
    * 월 : TableViewCell 코드 수정
    * 화 : 
        * 포스터 프로퍼티를 모델에서 가공하도록 수정
        * identifier 관리 방법 수정
        * cell setting method를 뷰 컨트롤러에서 직접하지 않고 클래스의 메서드를 이용해 구성하도록 수정
    * 수 : 전체적인 Step2 수정 및 re-Request
    * 목 : 
        * 첫 화면만 세로로 고정.
        * 컨텐츠가 잘 나오도록 테이블뷰 셀 오토-레이아웃 추가 및 수정.
        * 포스터 모델 수정.
        * 관람객 NumberFormatter 추가
        * 문자열 포매팅 연산 프로퍼티 네이밍 통일
        * 작품 상세 네비게이션바를 기능 요구서와 동일하게 수정.
        * Word Wrapping 추가.
        * Dynamic Type 적용.
    * 금 : Step3 PR
---

## 프로젝트 구조
* 시각화된 프로젝트 구조(다이어그램 등)
    * TBA

---

## 구동 영상
|           포스터 화면 (세로 고정)         |
|:------------------------------------:|
| ![](https://i.imgur.com/mj3G93O.gif) |



| 포스터 | 한국의 출품작 목록 | 선택한 출품작의 상세 정보 |
|:------:|:--------:|:--------:|
| ![poster](https://user-images.githubusercontent.com/102375432/175782486-b64e1419-4f37-48ca-ae98-8f3948003606.gif) | ![list](https://user-images.githubusercontent.com/102375432/175782489-920cf380-879b-4517-bc4a-27ae8f9480a4.gif) | ![selection](https://user-images.githubusercontent.com/102375432/175782490-8b260e47-489e-47d1-a1db-25c0363ebcf6.gif) |

---

## 실행 화면에 대한 설명
* 실행 화면(기능 설명)
    * 인트로 화면: 1900년 파리 만국박람회와 참가국으로써의 한국(당시 대한제국)을 소개
    * 한국의 출품작 화면: 한국의 출품작 목록 표시
    * 한국의 출품작 상세 화면: 각각의 출품작에 대한 상세 설명
* 사용 기술:
    * TableViewDelegate, TableViewDataSource를 이용한 테이블 구성
    * instantiateViewController 메서드를 활용한 화면 전환
    * Decodable 프로토콜을 사용해 JSON 데이터 파싱하여 테이블뷰에 표시
    * Numberformatter 적용
    * Word Wrapping을 사용해 긴 문장을 단어 단위로 슬라이싱
    * Dynamic Type 적용

---

## 트러블 슈팅
* 트러블 슈팅
    * 테이블 뷰 커스텀 셀을 만들 때 내부적으로 셀 컨텐츠 뷰를 계속 리사이징해서 제약사항이 충돌했던 것에 대한 고민
        * 스토리보드 위에서 프로토타입 셀을 먼저 커스터마이징하고 테이블 뷰 셀 클래스를 짜려고 해서 생겼던 문제. 
        * 커스텀 테이블 뷰 셀에 대한 정보 즉, 들어가야 할 이미지 뷰나 레이블 등의 **프로퍼티와 UI 제약사항을 테이블 뷰 클래스에서 먼저 설정**해준 다음, 해당 클래스를 스토리보드의 프로토타입 셀을 담당하는 클래스로 지정해줌으로써 **해결**
    * 뷰 간의 데이터 이동에 대한 고민
        *  identifier를 통해 데이터를 넘겨줄 뷰 컨트롤러를 인지하고 이용해 새로운 뷰 컨트롤러의 프로퍼티에 JSONDecoder로 파싱한 값을 통째로 넘겨줌으로써 **해결**
    * Back Bar Button Item을 어떻게 설정할지에 대한 고민
        * 이전 뷰 컨트롤러로 돌아가고자 할 때, Back Button을 만들고자 했으나, 해당 버튼의 타이틀이 원하는 대로 설정되지 않았던 문제
        * Navigation Controller에서 따로 Back Button의 이름을 정해줄 수 있었던 것 발견함으로써 **해결**
        * 포스터 뷰 컨트롤러의 내비게이션 바는 숨김 처리
    * 로컬 Asset으로부터 어떻게 데이터를 불러와야 할지에 대한 고민
        * 가져와야 할 두 가지 데이터 - 이미지, JSON
        * Assets 폴더에 이미 있는 데이터를 불러오는 상황
        * 이미지를 가져올 때는 **`UIImage(named:)` 메서드 활용**
        * JSON 데이터를 가져올 때는, 먼저 **`NSDataAsset.init(name:)`을 활용해 `NSDataAsset` 인스턴스를 가져온 다음, 해당 인스턴스의 `.data` 프로퍼티에 있는 `Data` 자료형을 가져와서 `JSONDecoder.decode<T>(_ type: T.type, from data: Data) throws where T: Decodable` 메서드에 넣어서 디코딩**하여, 원하는 모델에 맞춰진 자료를 생성
    * 첫 화면을 세로로 고정하는 문제에 대한 고민
        * UIApplication의 타입 프로퍼티를 활용해 AppDelegate에 접근이 가능하게 하고  AppDelegate에서는 UIInterfaceOrientationMask 구조체를 타입으로 가지는 restrictOrientation 프로퍼티를 만들어 주어 결국엔 필요한 화면에서 view가 나타날때와 사라질때 각각 .portrait과 .all을 적용 시켜 주어 문제를 **해결**
    * 어느곳에 Numberformatter 코드를 구현해야 하는지 고민
        * 처음엔 메서드로 만들어 주려고 했으나 많이 쓰이지 않는 부분을 감안해 포스터 모델 안의 연산 프로퍼티로 제작
    * 마지막 작품 상세 페이지에서 네이게이션 바 부분이 불투명하게 나오지 않는점 고민
        * navigationBar.isTranslucent 를 true로 설정 해주고 UINavigationBarAppearance 타입의 인스턴스를 만들고 navigationBar.scrollEdgeAppearance 와 navigationBar.standardAppearance에 대입하여 **해결**

---

## 참고 링크
* 참고 링크
    * https://yagom.net/courses/autolayout/lessons/working-with-self-sizing-table-view-cells/topic/self-sizing-table-view-cell-practice/
    * https://www.wtfautolayout.com/
    * https://developer.apple.com/documentation/uikit/uistoryboard/1616214-instantiateviewcontroller
    * https://developer.apple.com/documentation/uikit/nsdataasset
    * https://developer.apple.com/documentation/uikit/uiimage/1624146-init
    * https://developer.apple.com/forums/thread/92434
    * https://stackoverflow.com/questions/38969419/ios-how-to-enable-and-disable-rotation-on-each-uiviewcontroller
    * https://developer.apple.com/documentation/uikit/uifont/scaling_fonts_automatically
    * https://stackoverflow.com/questions/70575637/avoid-navigation-bar-becoming-visible-when-theres-scrollable-content-beneath-it

---

최종 업데이트 : 6/26

