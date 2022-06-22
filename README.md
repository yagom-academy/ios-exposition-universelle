# 만국박람회 README

* 제목: 만국박람회

* 소개: 1900년 파리 만국박람회와 그 배경, 그리고 참가국으로써의 한국(당시 대한제국)의 주변을 둘러싼 역사적 상황, 그리고 한국의 출품작에 대해 다루고 설명하는 앱

* 팀원
    * 나이든별, KayAhn
    * 사진 및 담당 역할 향후 추가 예정

---

* 타임라인
    * 월 : 프로젝트 사전 준비. 필요한 사항에 대한 공부.
    * 화 : 포스터 모델 및 출품작 모델 구현
    * 수 : 피드백 받은 부분에 따라 출품작 모델 보완 및 보강 - 이미지를 불러오는 프로퍼티 추가
    * 목 : 포스터 뷰 구현, 한국의 출품작 테이블 뷰 구현
    * 금 : 한국의 출품작 테이블 뷰 셀 구현, 한국의 출품작 상세 뷰 구현 (진행중) 

---

* 시각화된 프로젝트 구조(다이어그램 등)
    * 현재 해결중인 이슈 해결 완료하는 대로 추가 예정

---

* 실행 화면(기능 설명)
    * 인트로 화면: 1900년 파리 만국박람회와 참가국으로써의 한국(당시 대한제국)을 소개
    * 한국의 출품작 화면: 한국의 출품작 목록 표시
    * 한국의 출품작 상세 화면: 각각의 출품작에 대한 상세 설명
* 사용 기술:
    * TableViewDelegate, TableViewDataSource를 이용한 테이블 구성
    * 내비게이션 컨트롤러를 활용한 화면 전환
    * Decodable 프로토콜을 사용해 JSON 데이터 파싱하여 테이블뷰에 표시

---

* 트러블 슈팅
    * 테이블 뷰 커스텀 셀을 만들 때 내부적으로 셀 컨텐츠 뷰를 계속 리사이징해서 제약사항이 충돌했던 것에 대한 고민
        * 스토리보드 위에서 프로토타입 셀을 먼저 커스터마이징하고 테이블 뷰 셀 클래스를 짜려고 해서 생겼던 문제. 
        * 커스텀 테이블 뷰 셀에 대한 정보 즉, 들어가야 할 이미지 뷰나 레이블 등의 **프로퍼티와 UI 제약사항을 테이블 뷰 클래스에서 먼저 설정**해준 다음, 해당 클래스를 스토리보드의 프로토타입 셀을 담당하는 클래스로 지정해줌으로써 해결 (진행중) 
    * 뷰 간의 데이터 이동에 대한 고민
        *  identifier를 통해 데이터를 넘겨줄 뷰 컨트롤러를 인지하고 이용해 새로운 뷰 컨트롤러의 프로퍼티에 JSONDecoder로 파싱한 값을 통째로 넘겨준다(진행중)
    * Back Bar Button Item을 어떻게 설정할지에 대한 고민
        * 이전 뷰 컨트롤러로 돌아가고자 할 때, Back Button을 만들고자 했으나, 해당 버튼의 타이틀이 원하는 대로 설정되지 않았던 문제
        * (진행중)
    * 로컬 Asset으로부터 어떻게 데이터를 불러와야 할지에 대한 고민
        * 두 가지 가져와야 할 데이터 - 이미지, JSON
        * Assets 폴더에 이미 있는 데이터를 불러오는 상황
        * 이미지를 가져올 때는 **`UIImage(named:)` 메서드 활용**
        * JSON 데이터를 가져올 때는, 먼저 **`NSDataAsset.init(name:)`을 활용해 `NSDataAsset` 인스턴스를 가져온 다음, 해당 인스턴스의 `.data` 프로퍼티에 있는 `Data` 자료형을 가져와서 `JSONDecoder.decode<T>(_ type: T.type, from data: Data) throws where T: Decodable` 메서드에 넣어서 디코딩**하여, 원하는 모델에 맞춰진 자료를 생성

---

* 참고 링크
    * https://yagom.net/courses/autolayout/lessons/working-with-self-sizing-table-view-cells/topic/self-sizing-table-view-cell-practice/
    * https://www.wtfautolayout.com/
    * https://developer.apple.com/documentation/uikit/uistoryboard/1616214-instantiateviewcontroller
    * https://developer.apple.com/documentation/uikit/nsdataasset
    * https://developer.apple.com/documentation/uikit/uiimage/1624146-init
    * https://developer.apple.com/forums/thread/92434

---

최종 업데이트 : 6/17
