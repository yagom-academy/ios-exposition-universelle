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
- [STEP 3 기능 구현](#step-3-기능-구현)
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
![만국박람회](https://user-images.githubusercontent.com/88717147/164485804-47ee3fc2-fcff-451c-a7cc-798260f4f74f.gif)

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
## STEP 2 기능 구현
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
>
>![](https://i.imgur.com/nz40hkF.png)
>
>**해결 방법**
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
**1. 객체지향 설계에 맞게 캡슐화, 은닉화**

**tableView 에서 사용될 Cell 이 만들어질때 캡슐화와 은닉화를 적용하여 Cell 내부에서 생성될 Cell 의 정보를 변경하여 생성하도록 수정함.**
>**변경전**
>EntryListViewController: UITableViewDataSource 에서 Cell 객체 내부의 프로퍼티 값을 변경하여 사용하였다.
```swift
extension EntryListViewController: UITableViewDataSource {
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EntryCell = tableView.dequeueReusableCell(withIdentifier: Exposition.customCell, for: indexPath) as? EntryCell ?? EntryCell()
        let item = expositionItems?[indexPath.row]
        cell.imageView?.image = UIImage(named: item?.imageName ?? Exposition.emptyImage)
        cell.itemTitle.text = item?.name
        cell.itemShortDiscription.text = item?.shortDescription
        return cell
    }
}
```

>**변경후**
>Cell 내부에 configure() 메서드를 만들어 호출할경우 파라미터의 값을 활용하여 Cell 내부의 프로퍼티의 값을 변경하도록 변경함.
>자신의 상태값을 자신이 변경하도록 수정.
```swift
final class EntryCell: UITableViewCell {
    @IBOutlet private weak var itemImage: UIImageView!
    @IBOutlet private weak var itemTitle: UILabel!
    @IBOutlet private weak var itemShortDiscription: UILabel!
    
    func configure(item: ExpositionItems?) {
        itemImage.image = UIImage(named: item?.imageName ?? EntryCellLetter.emptyImage)
        itemTitle.text = item?.name
        itemShortDiscription.text = item?.shortDescription
    }
}

extension EntryListViewController: UITableViewDataSource{
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EntryCell = tableView.dequeueReusableCell(withIdentifier: EntryListLetter.entryCell, for: indexPath) as? EntryCell ?? EntryCell()
        let item = expositionItems?[indexPath.row]
        cell.configure(item: item)
        return cell
    }
}
```
**캡슐화와 은닉화를 적용하여 다른 컨트롤러 객체에게 데이터를 주입하는 방법을 수정함.**
>**변경전**
>기존의 방법은 다른 컨트롤러 객체 내부의 프로퍼티에 직접 접근하여 값을 주입해주었음.
```swift
extension EntryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let entryItemViewController = self.storyboard?.instantiateViewController(withIdentifier: Exposition.entryItemViewController) as? EntryItemViewController {
            let item = expositionItems?[indexPath.row]
            entryItemViewController.navigationItem.title = item?.name
            entryItemViewController.item = item
            self.navigationController?.pushViewController(entryItemViewController, animated: false)
        }
    }
}
```
>**변경후**
>객체에 타입 메서드를 만들어 외부에서 파라미터를 활용해 메서드를 호출할경우
>파라미터의 값이 프로퍼티의 값에 저장된 자기자신의 타입을 반환하도록 만들어 활용하였다.
```swift
final class EntryItemViewController: UIViewController {
    private var item: ExpositionItems?
    
    static func instance(item: ExpositionItems?) -> EntryItemViewController? {
        let entryItemViewController = UIStoryboard.init(name: EntryItemLetter.main, bundle: nil).instantiateViewController(withIdentifier: EntryItemLetter.entryItemViewController) as? EntryItemViewController
        entryItemViewController?.item = item
        return entryItemViewController
    }
}

extension EntryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = expositionItems?[indexPath.row]
        guard let entryItemViewController = EntryItemViewController.instance(item: item) else {
            return
        }
        self.navigationController?.pushViewController(entryItemViewController, animated: false)
    }
}
```

**2. MVC 구조에 맞게 컨트롤러와 모델 활용방법 수정**

<img width="400" src="https://i.imgur.com/Z1t4Cr7.png"/>

>위 MVC패턴과 같이 Model을 update 하게 되면 controller에 Notify를 주어야하는데 이전에 작성했던 코드는 controller와 model을 파일 위치만 분리했어서 MVC패턴을 지키게끔 수정하였다.

>**변경전**
```swift
final class EntryListViewController: UIViewController {
  private let expositionItems = [ExpositionItems].parse(JsonFile.items)

  override func viewDidLoad() {
         super.viewDidLoad()
         setup()
     }

   private func setup() {
         navigationItem.backButtonTitle = EntryListLetter.koreaEntryList
         tableView.dataSource = self
         tableView.delegate = self
     }
 }
}
```


>**변경후**
```swift
final class EntryListViewController: UIViewController {
 private var expositionItems: [ExpositionItems]? {
        didSet {
            updateItems()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = EntryListLetter.koreaEntryList
        expositionItems = .parse(JsonFile.items)
    }

  private func updateItems() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}    
```
## STEP 3 기능 구현
1. UILabel Extension
>- `changeFont()`: label text 를 부분적으로 폰트를 변경하는 메서드.

2. AppDelegate
>- `var shouldSupporAllOrientation`: 화면모드 전부를 지원하는지 세로모드만 지원하는지 설정할수있는 프로퍼티
>- `application()`: `shouldSupporAllOrientation` 의 값이 `true` 라면 화면모드 전부다 지원, `false` 라면 세로모드만 지원하도록 변경하는 메서드

3. `ExpositionPosterViewController` 

**화면 세로로만 볼 수 있도록 설정**
>```swift
>final class ExpositionPosterViewController: UIViewController {
>    
>    private let appDelegate = UIApplication.shared.delegate as? >AppDelegate
>    
>    override func viewWillAppear(_ animated: Bool) {
>        appDelegate.shouldSupportAllOrientation = false
>    }
>    
>    override func viewWillDisappear(_ animated: Bool) {
>        appDelegate.shouldSupportAllOrientation = true
>    }
>}
>```
>`AppDelegate`의 `shouldSupporAllOrientation`에 접근하여 화면이 보여지기 전인 `viewWillAppear()`에서 `shouldSupporAllOrientation`을 `false`로 변경하면 가로모드로 전환되지 않는다. 하지만 앱의 다른 화면에서는 가로, 세로 모드를 모두 적용해야하기 때문에 `viewWillDisappear()`에서 `shouldSupporAllOrientation`을 `true`로 변경했다.


**label text 의 폰트를 원하는 부분만 변경하도록 설정**
>`extension UIlabel` 에 정의한 `changeFont()` 메서드를 사용
>```swift
>extension UILabel {
>    func changeFont(to fontStyle: UIFont.TextStyle, letter: >String?) {
>        let font = UIFont.preferredFont(forTextStyle: fontStyle)
>        
>        guard let text = self.text else {
>            return
>        }
>        
>        guard let letter = letter else {
>            return
>        }
>        
>        let attributedString = NSMutableAttributedString(string: text)
>        
>        attributedString.addAttribute(.font, value: font, range: (text as NSString).range(of: letter))
>        self.attributedText = attributedString
>    }
>}
>
>final class ExpositionPosterViewController: UIViewController {
>private func updatePoster() {
>        posterTitle.text = poster?.title?.replacingOccurrences(of: >"(", with: "\n(")
>        posterTitle.changeFont(to: .title1, letter: >posterTitle.text)
>        
>        visitorsValue.text = "\(PosterLetter.visitors) : \(poster?.visitors?.numberFormatter() ?? "")"
>        visitorsValue.changeFont(to: .title3, letter: >PosterLetter.visitors)
>        
>        locationValue.text = "\(PosterLetter.location) : \(poster?.location ?? "")"
>        locationValue.changeFont(to: .title3, letter: PosterLetter.location)
>        
>        durationValue.text = "\(PosterLetter.duration) : \(poster?.duration ?? "")"
>        durationValue.changeFont(to: .title3, letter: PosterLetter.duration)
>        
>        descriptions.text = poster?.description
>        }
>}
>```
>`changeFont()`메서드에 어떤 fontStyle 로 변경할것인지 인자값을 넣고, 어떤 문자를 >적용시킬것인지 인자값을 넣어 사용했다.

4. ViewController StoryBoard, AutoLayout 적용

>`ExpositionPosterViewController`
>- scrollView 사용
>
>`EntryListViewController`
>- tableView 사용
>
>`EntryItemViewComtroller`
>- scrollView 사용

## 고민했던 것들
**1. `ExpositionPosterViewController` 의 `scrollView` 를 `top`, `bottom` 을 `superView` 와 동일하게 설정해두었으나 전면에서 공백 부분이 생기는 문제.**

>**해결한 방법**
>
><img width="300" src="https://i.imgur.com/hLDV3mT.png"/>
>
>따로 설정하지 않아도 Constrain to margins 가 기본적으로 체크 되어있는 모습을 볼수있다. 
>
>체크해주어야 원하는 크기만큼 지정해줄수있다.
>
>기존에는 체크해둔채로 scrollView, contensView 를 superView 에 전면을 0 으로 설정해두었으나 체크해제 함으로써 문제를 해결했다.

**2. `EntryItemViewController` 각 셀의 오른쪽에 화살표를 추가하는 방법**

>**해결한 방법**
>
><img width="300" src="https://i.imgur.com/rmaI4m2.png"/>
>`Cell` 의 `Accessory` 속성에서 `disclosureIndicator` 적용하였다.

**3. `EntryListViewController`에서 `Content hugging Priority`와 `Content Compression Resistance Priority`가 동일하게 설정되어있어 화면 크기가 변동되었을 때 어떤 것이 우선적으로 늘어나고 줄어들지 지정하지 않아서 생긴 문제**

>**해결한 방법**
> 화면이 변동되었을 때 `titleLabel`, `shortDescriptionLabel`중 `shortDescriptionLabel`이 더 우선적으로 늘어나고 줄어들도록 `Content hugging Priority` 와 `Content Compression Resistance Priority`를 더 낮게 설정하였다.

4. `EntryItemViewComtroller` 에서 `imageView` 의 크기가 세로모드일때 와 가로모드일때 어떻게 적용시켜줘야할지 고민했다.
>- `imageView`의 높이를 180보다 크다로 설정한후 우선도를 1000 으로 최우선하도록 설정하였다.
>- `imageView`의 높이를 `scrollView` 높이의 15% 가 되게끔 설정한후 우선도를 750 으로 설정하였다.
>
>그렇다면 세로화면 에서 `imageView` 의 높이는 전체높이의 30% 크기가 되고, 가로화면에서 `imageView` 의 높이는 180이 되게 된다.

## 배운 개념
 1. 오토 레이아웃을 적용하여 다양한 기기에 대응
 2. Word Wrapping / Line Wrapping / Line Break 방식의 이해
 3. 접근성(Accessibility)의 개념과 필요성 이해
 4. Dynamic Types를 통해 텍스트 접근성 향상

## PR 후 개선사항
