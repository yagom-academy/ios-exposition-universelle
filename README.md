
---
## 만국박람회
```
만국박람회의 한국 출품작을 보여주는 앱입니다.
출품작에 대한 자세한 내용을 확인할 수 있습니다.
제목 , 사진 , 설명 순서대로 확인이 가능합니다. 
```

---
### 목차
- [팀원](#팀원)
- [타임라인](#타임라인)
- [시각화 구조](#시각화-구조)
- [실행 화면](#실행-화면)
- [트러블 슈팅](#트러블-슈팅)
- [참고 링크](#참고-링크)
- [팀 회고](#팀-회고)

---
### 팀원
|uemu|Morgan|
|:---:|:---:|
|<img src="https://github.com/devjoon/IOS_Weekend_Study_10th_GroupB/assets/101351216/32ae33a0-6759-42d1-abb0-3d7a8a9a8c23" width="200" height="200"/>|<img src="https://avatars.githubusercontent.com/u/101351216?v=4" width="200" height="200"/>|
|[GitHub](https://github.com/ue-mu)|[GitHub](https://github.com/devjoon)|

### 타임라인
|날짜|내용|
|------|---|
|23.10.30|요구사항 확인 , 계획 수립, JSON 포멧의 데이터와 매칭할 모델 타입 구현|
|23.10.31|방문자 수 자료형 UInt로 변경 및 코드 컨벤션 수정|
|23.11.01|JSON파일을 디코딩하는 코드 구현|
|23.11.02|만국박람회 첫 화면 제작 및 해당 뷰컨트롤러(EntryItemViewController) 구현 <br> 테이블 뷰, 테이블 뷰 셀 구현 |
|23.11.03|커스텀 셀의 제약수정을 통하여 적절한 셀 크기 할당 <br> prepare 메서드를 활용한 데이터 전달 프로토타입구현 <br> descriptionView 제작 <br> backButtonItem text 수정 |
|23.11.04|파일의 계층분리 <br> segue -> navigation controller(push)를 활용한 화면전환 방식으로 변경|
|23.11.05|navigation controller(push)를 활용한 화면전환 방식 -> instantiateViewController를 활용한 화면전환 방식으로 변경 <br> 첫번째 화면 네비게이션 바 숨김 구현 <br>viewDidLoad안의 코드들의 기능 분리<br>강제 언래핑 -> 안전한 언래핑으로 변경 <br> 최적화 키워드 추가|
|23.11.06|Alert을 이용하여 에러 발생시 Alert을 발생하도록 구현 <br> 뷰컨트롤러와 커스텀 셀의 Identifier Namespace 구현|
|23.11.08|재사용성을 고려한 Alert 리펙토링 <br> 휴먼에러를 줄이고자 프로토콜을 채택하여 Identifier관리 <br>Collection에 safe subscript 확장 후 적용<br> 제네릭을 사용여 jsonDecoder의 재사용을 위한 코드 작성|
|23.11.09|DescriptionDetailViewController 의 init을 구현하여 데이터를 받아오도록 구현 <br> 제네릭 키워드를 메서드에 사용하고 decoder를 파라미터로 받게하여 확장성에 용이하게 수정|
|23.11.10|오토레이아웃 제약 수정|


### 시각화 구조

#### 클래스 다이어그램 
![클래스 다이어그램]

   
### 실행 화면
|메인화면 , 출품작리스트화면, 출품작디테일화면|
|---|
|세로|
![Nov-10-2023 12-20-26](https://github.com/devjoon/ios-exposition-universelle/assets/101351216/6a01c02b-0b72-43d4-92bf-b58f3c0f921e)
|가로|
![Nov-10-2023 13-39-21](https://github.com/devjoon/ios-exposition-universelle/assets/101351216/7008639f-5b6f-4dad-8384-3737f918623a)
   
### 트러블 슈팅
1. 접근해야할 뷰 컨트롤러의 indentifier를 스트링으로 직접 입력이 아닌 reuseIdentifier 를 이용하여 처리해 주었는데 스토리 보드 또한 reuserIdentifier를 이용해 처리 해주려고 했었습니다 스토리 보드의 이름과 뷰 컨트롤러의 이름 차이가 "\(스토리보드)+ViewController" 였었기 때문에 identifier 프로토콜을 하나 더 생성해주고 해당 프로토콜에서 components 를 사용하여 뒤의 ViewController 스트링 부분을 제거하여 반환해주는 형태로 구현하였는데 안전성과 간결성 측면에서 고려해 보았을때 간결하게 가는게 더 좋다고 판단하여 이부분은 제거하고 스토리보드의 인스턴스를 생성할때는 스트링으로 직접 타이핑 하여 처리하는것으로 결정 하였습니다

2. 각각의 뷰 컨트롤러에서 JSONDecoder를 생성하여 재사용성이 떨어지게 되는 상황이 발생했었습니다 이를 해결하기 위해서 UniverselleDecoder 파일을 생성해주었고 에셋 데이터와 디코더를 전달받아서 JSON에셋 데이터를 디코딩하여 반환해주는 타입메서드 선언을 해 주었습니다.

3. 다음 뷰컨트롤러에 데이터를 전달할때 해당 뷰컨트롤러에 직접적인 접근을 막기위해서 뷰컨트롤러 생성후 데이터를 받아와서 각 Label에 넣어주는 메서드를 작성하였는데 앱의 라이프 사이클 측면에서 봤을때 생성 시점에서 넣어주는게 더 옳다고 판단하였고 해당 메서드는 제거하고 init을 이용하여 데이터를 받아서 뷰 컨트롤러를 생성하는 방식으로 작성 하였습니다.


### 참고 링크
  
[Swift UITableView 공식문서](https://developer.apple.com/documentation/uikit/uitableview)

[Swift Filling a Table with Data 공식문서](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_datahttps://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)

[Swift Configuring the Cells for Your Table 공식문서](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table)

[Swift JSONDecoder 공식문서](https://developer.apple.com/documentation/foundation/jsondecoder)

[Swift NSCoding 공식문서](https://developer.apple.com/documentation/foundation/nscoding)

---
### 팀 회고

#### 우리팀이 잘한 점
- 서로 다툼없이 의견조율이 잘 되었으며 시간약속을 잘 지켰습니다.
- 서로가 동기부여 되어서 늦은시간까지 같이 열심히 할 수 있었습니다.


#### 우리팀이 개선할 점
- 공부의 방향성을 잡는법을 좀더 생각해봐야 할 것 같습니다
어떤 문제가 발생해서 해결이 불가능할 경우 이걸 해결하기 위해서 너무 많은 시간을 쏟다보니 생각보다 많은 지연이 발생하였습니다. 고민하다 안되면 직접적인 해결법을 찾아보고 정리하여 복습한다거나 하는 방식의 공부법이 필요하다 느꼈습니다
