# 만국박람회 README.md
>프로젝트 기간 2022.06.13 ~ 2022.06.14
>
>팀원 : [unchain123](https://github.com/unchain123), [bard](https://github.com/bar-d)/ 리뷰어 : [콘](https://github.com/protocorn93)
## 목차

- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [키워드](#키워드)
- [STEP1](#STEP1)
    - [고민한점](#고민한점-자세히보기)
    - [배운개념](#배운개념)

## 프로젝트 소개
- json데이터, 테이블 뷰를 이용해서 만국박람회 구성하기

## Preview
<img src="https://i.imgur.com/xLGt5Qk.gif" width="250" height="450"/>   &nbsp;&nbsp;&nbsp;<img src="https://i.imgur.com/EL7YBCC.gif" width="250" height="450"/>

<img src="https://i.imgur.com/stXFxGl.png" width="300" height="550"/>   &nbsp;&nbsp;&nbsp;<img src="https://i.imgur.com/t8cNCxn.png" width="300" height="550"/>

<img src="https://i.imgur.com/u8UIGFM.png" width="300" height="550"/>   &nbsp;&nbsp;&nbsp;<img src="https://i.imgur.com/KlO854d.png" width="300" height="550"/>




## UML

## 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]() [![xcode](https://img.shields.io/badge/Xcode-13.3-blue)]()

## 키워드
- `Codable`, `CodingKey`
- `JSON`, `Asset`, `Dummy JSON file`
- `tableView`, `segue`, ` `
## 고민한점 자세히보기
[STEP1에서 고민한점](https://github.com/yagom-academy/ios-exposition-universelle/pull/169)

## 배운개념
- `JSON` : 메모리에 있던 객체를 사람이 읽고 쓰기 쉽게 문자열로 표현해놓은 방법론
- `Codable` : 자신을 변환하거나 외부표현(external representation)으로 변환할 수 있는 타입
- `JSON 파일을 파싱하는 방법들`
    1. String 파일로 JSON 파일을 목 데이터로 가져오기
    2. 프로젝트 폴더 내에 JSON 파일 집어넣어서 가져오기
    3. 서버를 만들어 JSON 파일 가져오기
    
# STEP2

## 키워드
- `JSON 파싱`
- `NSDataAsset`, `type casting`
- `NumberFormatter`, `dequeueReusableCell(withIdentifier:, for:)`
- `ScrollView`, `TableView`, `indexPath`
-  `navigationController`, `prepare`, `navigationItem`, `UITableViewCell`
## 고민한점

### `Json Parsing`
- 처음 STEP1에서는 JSON 파일을 목데이터 형식으로 스트링 파일로 가져왔기 때문에 Bundle.main.path를 사용해서도 파일을 읽어서 파싱함  
step2에서는 NSDataAsset을 JSON데이터를 Assets 카탈로그에 저장을 하여 파일을 불러옴  
따라서 NSDataAsset을 통해 Assets 카탈로그에서 불러오는 방식으로 변경

### `XCode 자체 오류`

&nbsp;&nbsp;&nbsp;  <img src="https://i.imgur.com/uGjVTvP.gif" width="250" height="450"/>  

- 처음 네비게이션 바 아이템의 백 버튼의 텍스트를 한국의 출품작으로 변경을 해주었는데, 첫번째 셀에서만 동작하지 않는 일이 발생  
아무리 봐도 코드에 문제가 없는 것 같아 클린 빌드도 해보고, XCode를 종료하고 켜보았는데도 전혀 달라진 점이 없었음  
-> unchain이 pull을 받아 실행해보니 정상적인 작동을 함;;  
추후에 언체인이 코드 작성 후 push를 한 후 내 레포지토리에 pull을 하니 정상적인 작동;;

### `오토레이아웃`
- 아직 오토레이아웃에 대한 정확한 개념이 잡힌 것 같지가 않아 스토리보드로 될 것 같은 방식으로 구현 후, 이것저것 시도해보며 오토레이아웃 작성  
테이블 뷰 및 스크롤 뷰에서 뷰를 추가하지 않으면 스크롤링이 되지 않는다는 것을 늦게 깨달아 프로젝트를 진행하는데 시간이 오래 걸림

### `huggingPriority, ResistancePriority`
- 첫번째 뷰컨트롤러에서 이미지 뷰와 버튼 간의 크기를 설정하는 과정에서 버튼에 텍스트가 추가 되었을 때 버튼의 컨텐츠가 양 옆의 이미지뷰에 밀리면서 두줄로 나오는 현상이 발생해서 이를 해결하기 위해 huggingPriority, ResistancePriority를 사용해보려 했지만 변화가 없었습니다. 그래서 이미지뷰의 크기를 줄여서 해결을 했습니다. 자세한 오토레이아웃 설정은 STEP3에서 진행하기 때문에 다시 공부해서 다음 스탭에서 적용해 보겠습니다. 


## 배운개념

### `dequeueReusableCell(withIdentifier:, for:)`
- 메모리 효율성 면에서 효율적
- 셀을 계속 생성하면 메모리 사용량 측면에서 효율이 나쁜 설계  
셀에 이미지가 포함되어 있다면 이미지 로드 시간이 더 걸려 인터넷 상황이 좋지 않은 상황에서 스크롤을 하다보면 이미지가 있어야할 곳이 아닌 다른 셀에서 보여지는 경우가 있음
-> 올바른 셀에 위치하지 않는 것  

- 해결 방법 
    - prepareForReuse
    - index 비교해서 같은 인덱스가 아니면 할당하지 않는 방법

### `indexPath`
-  `indexPath`는 [section,row]로 이루어져 있는 행을 식별하는 상대적인 경로
-  JSON 데이터를 파싱한 배열 값을 가져오기 수월함 

###  `override func prepare(for segue: UIStoryboardSegue, sender: Any?)`
- 스토리보드에서 세그를 통해서 다음 뷰컨트롤러의 Identifier에 연결해 주면 prepare메서드를 이용해서 해당 뷰 컨트롤러의 데이터를 다음 뷰컨트롤러로 넘겨줄 수 있음.