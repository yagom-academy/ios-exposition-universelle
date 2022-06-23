# iOS 커리어 스타터 캠프

## 프로젝트 저장소
> 프로젝트 기간: 2022-06-13 ~ 2022-06-24</br>
> 팀원: [브래드](https://github.com/bradheo65), [그루트](https://github.com/Groot-94)</br>
리뷰어: [@ryan-son](https://github.com/ryan-son)</br>
그라운드롤: [GroundRole](https://github.com/bradheo65/ios-exposition-universelle/blob/Step02/Docs/GroundRole.md)

## 📑 목차
- [개발자 소개](#개발자-소개)
- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [구현내용](#구현내용)
- [키워드](#키워드)
- [핵심경험](#핵심경험)
- [기능설명](#기능설명)
- [1️⃣ STEP 1](https://github.com/bradheo65/ios-exposition-universelle/blob/Step02/Docs/Step01.md)
- [2️⃣ STEP 2](https://github.com/bradheo65/ios-exposition-universelle/blob/Step02/Docs/Step02.md)


## 개발자 소개
|브래드|그루트|
|:---:|:---:|
|<image src = "https://user-images.githubusercontent.com/45350356/174251611-46adf61c-93fa-42a0-815b-2c998af1c258.png" width="250" height="250">| <image src = "https://i.imgur.com/tvNHQNl.jpg" width="250" height="250">
|[브래드](https://github.com/bradheo65)|[그루트](https://github.com/Groot-94)|

## 프로젝트 소개
1900년 파리 만국박람회에서 소개된 한국의 문화유산을 앱으로 확인해보자.

## UML  
**[ClassDiagram]**

![](https://i.imgur.com/yDPT5nU.jpg)

**[UI sketch]**

| **파리 만국박람회**|
|:---:|
|![image](https://user-images.githubusercontent.com/45350356/174562645-c130954f-fa4a-48d8-ae3a-8eb2fb7e473e.png)|
    
|**한국 출품작**|
|:---:|
|![image](https://user-images.githubusercontent.com/45350356/174557669-5c89a692-87a0-44fa-a7fa-097dcbc9207f.png)|

|**한국 출품작 세부사항**|
|:---:|
|![image](https://user-images.githubusercontent.com/45350356/174557787-59998724-284b-4819-84f3-59afc2efbab1.png)|


## 구현내용
|앱 실행 예시|
|:---:|
|<image src = "https://user-images.githubusercontent.com/45350356/174560674-70a74530-f471-4e81-b90f-b5d5b5c7cd6f.gif" width="300" height="550">
|


## 키워드
- TDD
- Json
- Delegate
- ScrollView
- TableView
    - Data Source
    - Delegate

## 참고문서
- [UITableView](https://developer.apple.com/documentation/uikit/uitableview)
- [Table Views](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)
- [Filling a Table with Data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)
- [Configuring the Cells for Your Table](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table)
- [JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
    - [Using JSON with Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)
    - [Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
- [LLDB 정복하기](https://yagom.net/courses/start-lldb/)

## 핵심경험
- [x] Codable을 채택하여 JSON 데이터와 매칭할 모델 타입 구현
- [x] 스네이크 케이스 또는 축약형인 JSON 키 값을 스위프트의 네이밍에 맞게 변환
- [x] 테이블뷰의 Delegate와 Data Source의 역할의 이해
- [x] 테이블뷰의 셀의 재사용 이해
- [x] 테이블뷰의 전반적인 동작 방식의 이해
- [x] 주어진 JSON 데이터를 파싱하여 테이블뷰에 표시
- [x] 내비게이션 컨트롤러를 활용한 화면 전환
- [x] 뷰 컨트롤러 사이의 데이터 전달
    
## 기능설명
### **ExpoInformation**
    exposition_universelle_1900.json 파일 JsonDecode를 위한 데이터 포멧 타입 구현. 
### **KoreaItem**
    items.json 파일 JsonDecode를 위한 데이터 포멧 타입 구현. 
### **ExpoData**
    exposition_universelle_1900.json 파일을 Decode 하기 위한 타입 구현.
### **ExpoMainViewController** 
    메인 ViewController 구현.
### **KoreaItemTableViewController**
    한국의 출품작 ViewController 구현.
### **KoreaItemTableViewCell**
    한국의 출품작 TableView Cell 타입 구현
### **ItemDetailViewController**
    한국의 출품작 상세 설명 ScrollView 타입 구현
### **SendDataDelegate**
    Delegation방식의 Data 전달을 위한 Protocol 구현
### **Int**
    Int 타입 Data parsing을 위한 Extention 구현

