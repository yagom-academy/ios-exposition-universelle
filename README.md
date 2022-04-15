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
- [STEP 2 기능 구현](#step-2-기능-구현)
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
## STEP2 기능 구현
1. ExpositionPosterViewController: UIViewController
>- `viewWillAppear()`: 화면이 보여지기 직전에 네비게이션 바 를 보이지 않게 옵션을 설정함.
>- `viewWillDisappear()`: 화면이 사라지기 직전에 네비게이션 바 를 보이도록 옵션을 설정함.
>- `setupPoster()`: 만국박람회 처음에 보여질 화면을 설정해주는 메서드.
>- `numberFormatter()`: 방문객의 수를 형식에 맞게 변환할수 있도록 하는 메서드.
>- `didTapKoreaEntriesList()`: 한국의 출품작 보러가기 버튼을 누를경우 `EntryListViewController` 의 뷰로 네비게이션 방식으로 전환되도록 하는 메서드
2. EntryListViewController: UIViewController
>- `setup()` : 출품작 리스트 초기 화면을 설정하는 메서드, datasource와 delegate를 연결하고 뒤로가기 버튼 title을 설정해줌
>- `extension EntryListViewController: UITableViewDataSource`
>    - `tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int`: 섹션의 수를 리턴하는 메서드
>    - `tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell`: Cell 과 Cell 내부의 정보를 설정후 반환 해주는 메서드
>- `extension EntryListViewController: UITableViewDelegate`
>    - `tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)`: `didSelectRowAt` 메서드는 indexPath를 파라미터로 받아 클릭된 셀 정보를 인덱스로 넘겨준다.
>- `CustomCell class`: table view 내부에 생성해준 cell
3. EntryItemViewController: UIViewController
>- `setup()`: 만국박람회 3번째 화면인 출품 아이템의 정보를 화면에 보여지도록 하는 메서드.

## 고민했던 것들
**1. 네비게이션바 를 해당 화면에서만 보이지 않게 수정하는 방법**
>**viewDidLoad 와 viewWillDisappear**
네비게이션바 히든 옵션을 viewDidLoad 에서 true 로 설정한후
viewWillDisappear 에서 false 로 설정해 주었더니 처음엔 문제없이 작동되는줄 알았지만
화면전환으로 다시 네비게이션바를 히든으로 설정해준 화면으로 돌아온경우 네비게이션바가 적용되는 문제가 생김.
```swift
navigationController?.setNavigationBarHidden(true, animated: false)
```
>**해결한 방법**
>`view-Life-Cycle` 에 의해 `root view` 의 `viewDidLoad` 는 처음 화면을 구성할때한번만 실행되어 다시 `root view` 로 전환되더라도 `viewDidLoad` 가 호출되지 않아 문제가 되었다.
>네비게이션바 히든 옵션을 `viewDidLoad` 에서 하지 않고
>`viewWillAppear` 히든 옵션을 설정해주었다.

**2. Custom Cell을 EntryListViewController 와 다른 파일에서 구현할 경우 인식하지 못하는 문제**
>파일 분리를 하기위해 다른 파일에서 구현했더니 스토리보드에서 인식하지못하는 상황이 발생했다.
>`EntryListViewController: UIViewController` 내부에서 사용될 `Cell` 이기때문에 EntryListViewController 와 같은 파일 내에서 구현해주어야 하는지 의문이다 
아니면 Xcode 에러인걸까...
```swift
final class CustomCell: UITableViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemShortDiscription: UILabel!
}
```

**3. Cell 의 row 를 클릭하게되면 게속 눌려진 채로 인식하는 문제**
>`Cell` 의 `row` 를 클릭하여 다음 화면으로 전환후 다시 이전 화면으로 전환 했을경우 `Cell`의 `row` 가 게속 눌려져 있는 형태로 남아있었다.
![](https://i.imgur.com/nz40hkF.png)
**해결 방법**
>이를 해결하기위해 deselectRow 를 사용하여 row 를 클릭하게되면 회색으로 표시되었다가 원래의 색으로 변경되도록 하였다.
```swift
tableView.deselectRow(at: indexPath, animated: true)
```
## 배운 개념
1. 테이블뷰의 Delegate와 Data Source의 역할의 이해
2. 테이블뷰의 셀의 재사용 이해
3. 테이블뷰의 전반적인 동작 방식의 이해
4. 주어진 JSON 데이터를 파싱하여 테이블뷰에 표시
5. 내비게이션 컨트롤러를 활용한 화면 전환
6. 뷰 컨트롤러 사이의 데이터 전달

## PR 후 개선사항
