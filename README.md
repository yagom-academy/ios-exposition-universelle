# 만국 박람회
> 프로젝트 기간 2022.04.11 ~ 2022.04.22  
팀원 : [malrang](https://github.com/kinggoguma), [cathy](https://github.com/cathy171/ios-exposition-universelle) / 리뷰어 : [LinSaeng](https://github.com/jungseungyeo)

- [Ground Rules](#ground-rules)
- [실행화면](#실행화면)
- [UML](#uml)
- [STEP 1 기능 구현](#step-1-기능-구현)
    + [고민했던 것들](#고민했던-것들)
    + [배운 개념](#배운-개념)
    + [PR 후 개선사항](#pr-후-개선사항)

## Ground Rules
### 활동시간
>월, 화, 목, 금 : 11시 ~ 22시   
수요일 : 개인공부  
>
>점심시간 : 13시 ~ 14시  
저녁시간 : 18시 ~ 20시  
>
>전날 공부한 것을 공유
모르는 내용을 서로 묻기

### TIL 깃커밋 메세지
>✅[chore]: 코드 수정, 내부 파일 수정.  
✨[feat]: 새로운 기능 구현.  
📐[style]: 스타일 관련 기능.(코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우). 
➕[add]: Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 파일 생성 시.  
🔨[fix]: 버그, 오류 해결.  
⚰️[del]: 쓸모없는 코드 삭제.  
📝[docs]: README나 WIKI 등의 문서 개정.  
💄[mod]: storyboard 파일,UI 수정한 경우.  
✏️[correct]: 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다.  
🚚[move]: 프로젝트 내 파일이나 코드의 이동.  
⏪️[rename]: 파일 이름 변경이 있을 때 사용합니다.  
⚡️[improve]: 향상이 있을 때 사용합니다.  
♻️[refactor]: 전면 수정이 있을 때 사용합니다. 
🔀[merge]: 다른브렌치를 merge 할 때 사용합니다.  

## 실행화면

## UML
![](https://i.imgur.com/WY8K5pY.png)

## STEP 1 기능 구현
**JSON 데이터와 매칭할 타입 구현**
1. `ExpositionItems: Codable`
>- `parse()`: `[ExpositionItems]?` 타입으로 디코딩하여 반환하는 메서드
2. `enum CodingKeys: String, CodingKey`
>- snake case인 JSON key 값을 스위프트 네이밍에 맞게 변환해주는 열거형
3. `ExpositionPoster: Codable`
>- `parse()`: `ExpositionPoster?` 타입으로 디코딩하여 반환하는 메서드

## 고민했던 것들
1. JSON Data 를 디코딩 하는 parse()메서드를 어디서 해주어야 할지 고민함.  
**각각의 구조체에서 parse() 메서드를 구현하여 사용하는방법**
```swift
struct ExpositionItems: Codable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
    
    static func parse() -> [ExpositionItems]? {
        guard let asset = NSDataAsset(name: "items") else {
            return nil
        }
        let expositionItems = try? JSONDecoder().decode([ExpositionItems].self, from: asset.data)
        return expositionItems
    }
}

struct ExpositionPoster: Codable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    static func parse() -> ExpositionPoster? {
        guard let asset = NSDataAsset(name: "exposition_universelle_1900") else {
            return nil
        }
        let posterData = try? JSONDecoder().decode(ExpositionPoster.self, from: asset.data)
        
        return posterData
    }
}
```
**새로운 구조체를 만들어 두개의 JSON Data 를 관리해주는 방법**
```swift
struct JsonManager<Element: Codable> {
    static func itemParse() -> [Element]? {
        guard let asset = NSDataAsset(name: "items") else {
            return nil
        }
        
        let expositionItems = try? JSONDecoder().decode([Element].self, from: asset.data)
        return expositionItems
    }
    
    static func PosterParse() -> Element? {
        guard let asset = NSDataAsset(name: "exposition_universelle_1900") else {
            return nil
        }
        
        let posterData = try? JSONDecoder().decode(Element.self, from: asset.data)
        return posterData
    }
}
```

## 배운 개념
1. Encodable
2. Decodable
3. Codable
4. NSDataAsset

## PR 후 개선사항
**1. 각각의 모델 타입에서 사용되는 pars() 메서드 중복제거**
>두 모델 에서 각각 구현되었던 parse() 메서드
```swift
static func parse() -> ExpositionPoster? {
    guard let asset = NSDataAsset(name: "exposition_universelle_1900") else {
        return nil
    }
    let posterData = try? JSONDecoder().decode(ExpositionPoster.self, from: asset.data)
        
        return posterData
    }

static func parse() -> [ExpositionItems]? {
    guard let asset = NSDataAsset(name: "items") else {
        return nil
    }
    let expositionItems = try? JSONDecoder().decode([ExpositionItems].self, from: asset.data)
    return expositionItems
    }
```
>두 모델이 공통으로 채택 하고있는 프로토콜 Codable 을 활용하기위해 Codable 이 채택하는 프로토콜 Decodable 을 extension 하여 parse() 메서드를 프로토콜 기본구현으로 정의해주었다.
```swift
extension Decodable {
    static func parse(_ name: String) -> Self? {
        guard let asset = NSDataAsset(name: name) else {
            return nil
        }
        let jsonData = try? JSONDecoder().decode(Self.self, from: asset.data)

        return jsonData
    }
}
```

**2. test code given, when, then 의 순서에 맞게 메서드 네이밍변경 및 내부 수정**

>테스트 코드를 실행하는 when 부분을 추가하고, test 메서드 이름만으로 어떤 test를 수행하는지 파악할 수 있도록 given, when, then이 모두 포함되게끔 네이밍을 수정해주었다.

**3. ExpositionItems 프로퍼티 옵셔널 추가**
>어떠한 이유로 Json 데이터가 파싱이 실패할경우 프로그램 안정성을위해 파싱될 모델의 프로퍼티 값을 옵셔널로 변경해줌.
**변경전**
```swift
struct ExpositionPoster: Codable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}

struct ExpositionItems: Codable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
}
```

**변경후**
```swift
struct ExpositionPoster: Codable {
    let title: String?
    let visitors: Int?
    let location: String?
    let duration: String?
    let description: String?
}

struct ExpositionItems: Codable {
    let name: String?
    let imageName: String?
    let shortDescription: String?
    let description: String?
}
```
