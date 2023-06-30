# 🇫🇷🇰🇷 만국박람회

## 🍀 소개
`Dasan`과 `EtialMoon`이 만든 만국박람회 앱입니다. 이 앱은 1990 만국박람회에 출품된 한국의 출품작들을 볼 수 있습니다.

<br>

## 📖 목차
1. [팀원](#-팀원)
2. [타임라인](#-타임라인)
3. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
4. [트러블 슈팅](#-트러블-슈팅)
5. [참고 링크](#-참고-링크)

<br>

## 👨‍💻 팀원
| Dasan | EtialMoon |
| :------: | :------: |
|<Img src="https://i.imgur.com/EU67fox.jpg" width="200"> |<img src="https://i.imgur.com/hSdYobS.jpg" width="200"> |
|[Github Profile](https://github.com/DasanKim) |[Github Profile](https://github.com/hojun-jo)

<br>

## ⏰ 타임라인
|날짜|내용|
|:--:|--|
|2023.06.26.(월)| - `JSON` 포멧의 데이터와 매칭되는 `Entry` 타입 구현 <br> - `JSON` 포멧의 데이터와 매칭되는 `Introduction` 타입 구현 |
|2023.06.27.(화)| - `MainViewController`에 필요한 View 생성 및 네이게이션 컨트롤러를 이용한 `화면전환` 추가 <br> - `MainViewController`의 `Label`들에 `JSON` 데이터 연결 <br> - custom한 `EntryTableViewCell` 추가<br> - `EntryListViewController`의 `Label`들에 `JSON` 데이터 연결|
|2023.06.28.(수)| - 레이블 내 문자열 수정 및 하위 항목 레이블 추가<br> -`EntryTableViewCell`에 `accessory` 추가 <br> - 스토리보드에 출품작 상세화면 추가 <br> - `EntryDetailViewController` 추가 및 `화면전환` 구현 | 
|2023.06.29.(목)| - 전체적인 리펙토링 진행 |
|2023.06.30.(금)| - README 작성 <br> - 피드백 요청사항 반영 및 전체적인 리펙토링 진행 |

<br>

## 👀 시각화된 프로젝트 구조

### Class Diagram
<p>
<img width="800" src="https://github.com/DasanKim/ios-exposition-universelle/assets/106504779/e17c106a-a026-496a-9494-1340c9bb96e0">
</p>

</br>

## 🧨 트러블 슈팅

### 1️⃣ navigationBar.isHidden

⚠️ **문제점** <br>
- 포스터와 각종 설명을 표시하는 `첫번째 화면`은 `navigation bar`가 없어야했지만, 나머지 `출품작 목록`과 `출품작 상세화면`은 `navigation bar`가 있어, `BackButton`을 통해 앞/뒤 화면으로 이동할 수 있어야했습니다.

✅ **해결방법** <br>
- 첫번째 화면에서 `navigationBar`의 `isHidden` 프로퍼티에 `true`값을 주어 `navigationBar`가 보이지 않도록 하였고, 두번째 화면(출품작 목록)에서는 `false`값을 주어 `navigationBar`가 보이도록 하였습니다.
    ```swift
    // MainViewController.swift
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    ```
- 두번째 화면(출품작 목록)->첫번째 화면으로 돌아올 때 다시 `navigation bar`가 보이지 않게 하기 위하여, `viewWillAppear` 메서드에서 `isHidden` 값을 설정하였습니다.
    ```swift
    // EntryListViewController.swift
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "한국의 출품작"
    }
    ```

<br>

### 2️⃣ scroll edge

⚠️ **문제점** <br>
- 처음 만들어진 `navigationBar`는 `view`와 **같은 색**이었습니다. 스크롤을 하여 컨텐츠가 `navigationBar`가 `위`로 올라갔을 때에만 `navigationBar`의 색깔이 변하였습니다.

✅ **해결방법** <br>
- **스크롤을 하지 않았을 때에도** `navigationBar`와 `view`가 색으로 `구분`이 되어있었기 때문에, [scroll edge appearances](https://developer.apple.com/documentation/uikit/uinavigationbar/3198027-scrolledgeappearance)를 이용하여 `navigationBar`와 `view`를 구분하였습니다.

  > When a navigation controller contains a navigation bar and a scroll view, part of the scroll view’s content appears underneath the navigation bar. If the edge of the scrolled content reaches that bar, UIKit applies the appearance settings in this property.
<br>

### 3️⃣ BackBarButtonItem

⚠️ **문제점** <br>
- 첫번째 화면에 `navigationBar`가 없다보니 두번째 화면(출품작 목록)의 back button title이 "Back"으로 설정되는 것을 보았습니다.
  - 보통 `navigationBar`에 있는 back button의 title은 이전 화면의 title값을 갖는데, title이 없는 경우 [backButtonDisplayMode](https://developer.apple.com/documentation/uikit/uinavigationitem/3656350-backbuttondisplaymode)에 따라 back button의 title를 정해준다고 합니다.

✅ **해결방법** <br>
- "메인"이라는 title로 설정하고 싶었는데, 이를 위하여 아래와 같이 커스텀한 bar button item를 만들어 할당해주었습니다.
    ```swift
    // MainViewController.swift
    @IBAction func touchUpGoToEntryListButton(_ sender: UIButton) {
        (...)
        navigationItem.backBarButtonItem = createMainBackBarButtonItem()
        (...)
    }

    private func createMainBackBarButtonItem() -> UIBarButtonItem {
        let backBarButtonTitle = "메인"
        let backBarButtonItem = UIBarButtonItem(title: backBarButtonTitle, style: .plain, target: self, action: nil)

        return backBarButtonItem
    }
    ```
<br>

### 4️⃣ [보일러 플레이트 코드](https://en.wikipedia.org/wiki/Boilerplate_code)를 줄이기 위한 타입 추가

⚠️ **문제점** <br>
- 기존 코드에서는 `MainViewController`와 `EntryListViewController`에서 **직접** json 파일을 decode하였습니다. 두 개의 ViewController는 decode하는 함수 부분이 `dataAsset 이름`과 `data 타입`만 다르고 하는 역할 및 코드가 같았습니다.
- Before
    ```swift 
    // MainViewController.swift
    private func decodeIntroduction() {
        let decoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            introduction = try decoder.decode(Introduction.self, from: dataAsset.data)
        } catch {
            print(error)
        }
    }
    ```

✅ **해결방법** <br>
- 변화없이 여러 군데에서 반복되는 코드인 `보일러 플레이트 코드`라고 판단하여 이를 줄이기 위해 `Model`에 `Decoder` 타입을 추가하였습니다.
- After
    ```swift
    // Decoder.swift
    struct Decoder<T: Decodable> {
        static func decodeJSON(_ dataAssetName: String) throws -> T {
            let decoder = JSONDecoder()

            guard let dataAsset: NSDataAsset = NSDataAsset(name: dataAssetName) else {
                throw DecoderError.notFoundAsset
            }

            return try decoder.decode(T.self, from: dataAsset.data)
        }
    }
    ```

<br>

### 5️⃣ 의존성 주입

⚠️ **문제점** <br>
- 기존에는 `EntryListViewController`에서 `EntryTableViewCell`, `EntryDetailViewController`에 직접 접근하여 프로퍼티에 값을 넣었습니다. 이렇게 직접 접근하게 되면 객체 간의 결합도가 높아지게 됩니다.
- Before
    ```swift
    // EntryListViewController.swift
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboardName = "Main"
        let storyboardId = "EntryDetailViewController"
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: storyboardId)
        
        guard let entryDetailViewController = viewController as? EntryDetailViewController else {
            return
        }
        
        if let entryList {
            entryDetailViewController.entryName = entryList[indexPath.row].name
            entryDetailViewController.entryImageName = entryList[indexPath.row].imageName
            entryDetailViewController.descriptionText = entryList[indexPath.row].description
        }
        
        navigationController?.pushViewController(entryDetailViewController, animated: true)
    }
    ```

✅ **해결방법** <br>
- 결합도가 높을 경우 `EntryTableViewCell`, `EntryDetailViewController`에서 에러가 발생할 경우 `EntryListViewController`까지 영향을 받을 가능성이 있기 때문에 의존성 주입을 통해 결합도를 낮추게 되었습니다.
- After
    ```swift
    // EntryListViewController.swift
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboardName = "Main"
        let storyboardId = "EntryDetailViewController"
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        
        if let entryList {
            let entryDetailViewController = storyboard.instantiateViewController(identifier: storyboardId) { coder in
                EntryDetailViewController(entry: entryList[indexPath.row], coder: coder)
            }
            
            navigationController?.pushViewController(entryDetailViewController, animated: true)
        }
    }
    ```
<br>

## 📚 참고 링크

- [🍎Apple Docs: JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)
- [🍎Apple Docs: Using JSON with Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)
- [🍎Apple Docs: scrollEdgeAppearance](https://developer.apple.com/documentation/uikit/uinavigationbar/3198027-scrolledgeappearance)
- [🍎Apple Docs: backBarButtonItem](https://developer.apple.com/documentation/uikit/uinavigationitem/1624958-backbarbuttonitem)
- [🍎Apple Docs: init(coder:)](https://developer.apple.com/documentation/foundation/nscoding/1416145-init)
- [🌐Blog: init(coder:)](https://babbab2.tistory.com/171)
- [🌐boostcourse: JSON 다루기](https://www.boostcourse.org/mo326/lecture/20146)

<br>
