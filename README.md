# 🎪 만국박람회

## 📖 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)

</br>

## 🍀 소개
훈맹구(`hoon`, `idinaloq`) 팀이 만든 만국박람회 가이드 앱입니다.
1900.04.14 ~ 1900.11.12 까지 개최된 파리 만국박람회 중 한국 출품작작을 소개합니다.
각각의 테이블 뷰 셀을 클릭하면 자세한 출품작 내용을 확인할 수 있습니다.

* 주요 개념: `UITableView`, `UITableViewCell`, `JSON`, `JSONDecoder`

</br>

## 👨‍💻 팀원
| idinaloq | hoon |
| :--------: | :--------: |
| <Img src = "https://user-images.githubusercontent.com/109963294/235301015-b81055d2-8618-433c-b680-58b6a38047d9.png" width = "300" height="300"/> |<Img src="https://i.imgur.com/zXoi5OC.jpg" width="300" height="300"> |
|[Github Profile](https://github.com/idinaloq) |[Github Profile](https://github.com/Hoon94) |

</br>

## ⏰ 타임라인
|날짜|내용|
|:--:|--|
|2023.06.26.| - ExpositionUniverselle, Item 타입 생성 |
|2023.06.27.| - ExpositionUniverselle, Item 타입 리팩토링 |
|2023.06.28.| - ExpositionUniverselleViewController UI 구현 <br> - JSON 파일 디코딩 <br> - touchUpExpositionItemListButton 메서드 추가 | 
|2023.06.29.| - ExpositionItemListViewController UI 구현 <br> - itemListTableView 추가 <br> - ItemUITableViewCellStyleSubtitle 클래스 생성 <br> - ExpositionItemViewController UI 구현 <br> - 리팩토링 |
|2023.06.30.| - 리팩토링 <br> - README 작성|

</br>

## 👀 시각화된 프로젝트 구조

### Class Diagram
<p align="center">
<img width="800" src="https://hackmd.io/_uploads/SkkzZenO2.jpg">
</p>

</br>

## 💻 실행 화면 - 추후 추가 예정

| 화면 1 | 화면 2 |
|:--------:|:--------:|
|<Img src="" width="300">|

</br>

## 🧨 트러블 슈팅

1️⃣ **JSON 포멧의 데이터와 매칭할 모델 타입** <br>
-
🔒 **문제점** <br>
`exposition_universelle_1900.json`과 `items.json`에서 사용하는 JSON 포멧의 데이터는 네이밍을 snake case 형태로 사용하였습니다. swift에서 사용하는 camel case 형태와 달랐고, 축약어를 사용하는 네이밍도 있었습니다.
`JSONDecoder`를 사용하여 디코딩을 하면 JSON 파일에 저장된 네이밍을 저희가 생성한 타입의 프로퍼티의 네이밍과 일치시켜야 했지만, swift에서 사용하는 [네이밍 가이드라인](https://www.swift.org/documentation/api-design-guidelines/#naming)과 다르다는 문제가 있었습니다.

🔑 **해결방법** <br>
`CodingKeys`를 사용하여 JSON 파일에 저장된 네이밍을 다음과 같이 각각의 프로퍼티의 케이스에 맞게 지정하였습니다.
```swift
struct Item: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let totalDescription: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case totalDescription = "desc"
    }
}
```

<br>

## 📚 참고 링크
- [🍎Apple Docs: JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
- [🍎Apple Docs: Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types)
