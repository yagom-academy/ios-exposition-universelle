# 만국박람회 프로젝트

1. 프로젝트 기간: 2021.12.06 - 2021.12.17
2. Grounds Rules
    - 10시에 스크럼 시작
    - 프로젝트가 중심이 아닌 학습과 이유에 초점을 맞추기
    - 의문점을 그냥 넘어가지 않기
    - Time Rule
        - 아침: 10시
        - 점심시간: 12시~ 1시
        - 저녁시간: 6시~7시
        - 프로젝트 최대 시간: 9시 ~ 최대 9시 30분 까지
3. 커밋 규칙
    - 단위
        - 기능단위
    - 메세지
        - ✨  feat : 기능 추가
        - 🐛  fix : 버그 수정
        - ♻️  refactor: 리팩토링 (함수 분리/이름수정 등 실행 결과의 변경 없이 코드 구조를 재조정)
        - 🚚  style : 파일 형식/네이밍, 폴더 구조/네이밍 수정하거나 옮기는 작업 비즈니스 로직에 변경 없음
        - 💄  style : 스타일 (UI 스타일 변경) 비즈니스 로직에 변경 없음
        - 📝  docs : 문서 (README 등 문서 추가/수정/삭제)
        - ✅  test : 테스트 (테스트 코드 추가/수정/삭제: 비즈니스 로직에 변경 없음)
        - 🔧  chore : 기타 사소한 변경사항 (빌드 스크립트 수정 등)
        - 💡  comment : 필요한 주석 추가 및 변경
        - 🔥  remove : 파일, 폴더 삭제 작업

---

# 목차

- [키워드](#키워드)
- [STEP 1 : 모델 타입 구현](#STEP-1--모델-타입-구현)
    + [고민했던 것](#1-1-고민했던-것)
    + [의문점](#1-2-의문점)
    + [배운 개념](#1-3-배운-개념)
    + [PR 후 개선사항](#1-4-PR-후-개선사항)

---

# 키워드

- `JSON` `Codable` `Decodable` `Encodable`
- `MVC`
- `TableView`
- `Auto Layout`

# STEP 1 : 모델 타입 구현

JSON 포맷의 데이터와 매칭할 모델 타입을 구현합니다.

## 1-1 고민했던 것

- JSON 파일을 살펴보고 예시 화면을 보면서 어떤 부분을 타입으로 설계해야 할지 고민해보았다.
- JSON 관련 타입을 설계할 때 프로퍼티를 상수가 아니라 변수로 만드는지 고민해보았다.
- 타입을 설계하면서 고민해보니 데이터를 디코딩만 하기 때문에 Codable이 아니라 Decodable만 채택하도록 해주었다.

## 1-2 의문점

- 현업에서는 JSON 관련 타입을 설계할 때 [사이트](https://app.quicktype.io/)를 활용하여 설계하기도 할까?
- 왜 JSON 관련 타입을 만들 때 프로퍼티를 상수가 아니라라 변수로 만들지?

## 1-3 배운 개념

- Codable을 이용하여 JSON을 인코딩, 디코딩 하는 방법

[![top](https://img.shields.io/badge/top-%23000000.svg?&amp;style=for-the-badge&amp;logo=Acclaim&amp;logoColor=white&amp;)](#만국박람회-프로젝트)

---

# STEP 2 : 화면 구현

메인 화면, 출품작 목록, 출품작 상세화면을 구현합니다.

## 2-1 고민했던 것

- 파싱에 실패하였을 때 어떻게 에러처리를 할지 고민하였다.
    - 개발자에게만 보여줘야 할지, 사용자에게 보여줘야 할지 고민해보았고 앱을 사용하는 사용자가 에러를 보는 것이 적절하다는 판단에 얼럿을 띄우도록 구성하였다.
- Navigation Bar를 MainViewController에서만 숨길 수 있는 방법을 고민해보았다.
    - View Life Cycle을 활용하여 뷰가 보여질때 숨기고, 사라질때 다시 나타내도록 구현해보았다.
- MainViewController에서 크기가 다른 Label의 Text부분을 어떻게 처리할지 고민해보았다.
    - 스토리 보드에서 Label을 직접 추가하여 구현할 수도 있었지만, 스토리보드 의존성을 최대한 낮춰보기 위해 코드를 활용하여 Label에 텍스트를 추가하고 이후 특정 글자만 사이즈가 커질 수 있도록 구현했다.
- 파라미터로 전달하는 String을 변수로 따로 담아 enum타입으로 묶어두어 리팩토링을 진행했다.
- 셀의 재사용성을 높이기 위해 xib를 활용하여 커스텀 셀을 구현해보았다.
- 셀을 터치하는 시점에 해당 셀의 정보가 다음 화면으로 전달될 수 있도록 구현하였다.
- 선택된 셀이 선택된 흔적이 남아있어 이를 없애기 위해 고민해보았다.
    - delegate를 활용하여 셀이 눌렸을 때 시점에 deselect하도록 구성해보았다.
- ResultType이 가독성이 좋고, 에러에 유연히 대처할 수 있도록 decode 메소드를 ResultType으로 구현해보았다.
    - fail시 저희가 만든 에러의 description을 사용자에게 알려주고 success시 view를 구성하는 메소드를 타게끔 구성하였다.

## 2-2 의문점

- 함수형 프로그래밍을 해보려 노력하였는데, 적절하게 한 것이 맞을까?
- 데이터 전달을 할 때, 즉 상태관리를 할 때 단순히 `프로퍼티를 활용`하여 전달하는 방법 말고  더 좋은 방법은 없는걸까?
- TableView의 `DataSorce`를 활용하여 셀을 설정할 때 예전버전으로 설정을 해주어야 하는지 최신버전(iOS 14) 방식으로 설정을 해주어야하는지 어떤게 적절한지가 의문이다.
- MainViewController 내부에 `setUpView()` 메소드가 너무 많은 일을 하는 것은 아닌지?

## 2-3 Trouble Shooting

### 1. 네비게이션 바를 특정 ViewController에서만 숨김 처리하기

- `상황` MainViewController를 제외한 나머지 뷰는 네비게이션 바가 존재한다. 즉 MainViewController는 네비게이션 바를 숨김처리 해야 한다.
- `시도` 스토리보드에서 감추기
    - 네비게이션 컨트롤러를 클릭 후
    - 우측 Inspector에서 Shows Navigation Bar 체크를 해제해준다.
    - ![https://camo.githubusercontent.com/8ee13833a1e08e99b2f1c058d511eb599201481275636a037336211633154760/68747470733a2f2f692e696d6775722e636f6d2f386a70416d31772e706e67](https://camo.githubusercontent.com/8ee13833a1e08e99b2f1c058d511eb599201481275636a037336211633154760/68747470733a2f2f692e696d6775722e636f6d2f386a70416d31772e706e67)
        
- 코드로 감추기
    - 네비게이션 컨트롤러로 Embed In 되어있는 ViewController 내부에 다음과 같은 코드를 추가해준다.
        - `self.navigationController?.isNavigationBarHidden = true`
- `이유` 위와 같은 방법은 Navigation Controller에 연결되어있는 **모든 ViewController**의 Navigation Bar가 숨겨진다.
- 특정 ViewController의 Navigation Bar를 숨기려면 다음과 같은 방법이 있다.
- `해결` 해당 방법은 View Life Cycle 메소드를 활용하여 뷰가 화면에 보일 때 Navigation Bar를 숨기고 다른창으로 넘어갈때 다시 보이게하는 방법이다.

```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: animated)
}

override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.setNavigationBarHidden(false, animated: animated)
}
```

---

### 2. 셀이 Select 되었을 때 사라지지 않는 회색배경

**[셀이 Select되었을 때 남는 회색배경 없애기]**

-  ![https://camo.githubusercontent.com/6b0a15f162920b994ec4e1fb9859fb7f06e7348fdef04018f6e48f8009a1a4a0/68747470733a2f2f692e696d6775722e636f6d2f386154724743622e676966](https://camo.githubusercontent.com/6b0a15f162920b994ec4e1fb9859fb7f06e7348fdef04018f6e48f8009a1a4a0/68747470733a2f2f692e696d6775722e636f6d2f386154724743622e676966)
    
- `상황` 셀을 클릭해서 화면전환후 다시 돌아와도 셀의 배경색이 안없어지는 현상이 일어났다.
- `이유` 테이블뷰의 셀이 선택되면 회색으로 변하게 되는데, 문제는 이렇게 변한 색이 그대로 유지된다.
- `해결` 테이블 뷰의 셀을 선택하면 회색으로 변했다가 다시 원래 색으로 바로 돌아오게 하려면 아래 메소드를 사용해주면 된다.
    
    ```swift
    extension ItemListViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    ```
- 적용후
- ![https://camo.githubusercontent.com/a7c7277a10d19e11e5babce23aaffacc17f8a6b4f6311ea859ad75da5c2689a2/68747470733a2f2f692e696d6775722e636f6d2f424e6b6f4c31682e676966](https://camo.githubusercontent.com/a7c7277a10d19e11e5babce23aaffacc17f8a6b4f6311ea859ad75da5c2689a2/68747470733a2f2f692e696d6775722e636f6d2f424e6b6f4c31682e676966)
    

---

### 3. 선택한 셀의 indexPath를 DataSource가 아닌 다른 곳에서 알려면?

tableView의 속성중 `indexPathForSelectedRow` 가 있는데, 선택된 row(Cell)의 indexPath를 가져와 활용해줄 수 있다.

```swift
var indexPathForSelectedRow: IndexPath? { get }
```

---

### 4. 화면 전환 시 데이터를 전달하는 여러가지 방법

- performSegue시 sender를 nil이 아니라 전달할 데이터를 입력후
- prepare시 `sender`를 다운캐스팅을 활용하여 전달할 수 있다.

```swift
extension ItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ItemDetailView", sender: items[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let item = sender as? ExpositionItem,
          let nextViewController = segue.destination as? ItemDetailViewController else {
          return
      }
    nextViewController.item = item
}
```

- prepare 메소드 내부에서 선택된 셀의 `indexPath`를 구해서 전달하는 방법도 존재한다.

```swift
extension ItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ItemDetailView", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let indexPath = itemListTableVIew.indexPathForSelectedRow,
          let nextViewController = segue.destination as? ItemDetailViewController else {
        return
    }
    nextViewController.item = items[indexPath.row]
}
```

## 2-4 배운 개념

- 테이블뷰의 전반적인 동작 방식
- 주어진 JSON 데이터를 파싱하여 테이블뷰에 표시하는 방법
- 화면 전환시 선택된 열의 데이터 전달 방법
- 테이블뷰의 셀의 재사용 이해
- 셀의 행 선택에 관련된 속성의 이해
- `NSMutableAttributedString` `addAttribute` 를 활용하여 폰트 스타일을 편집하는 방법
- UIImage에 `image`를 코드로 설정하는 여러가지 방법
- Navigation Bar item에 대한 이해
- xib를 활용해서 UI를 구성하는 방법

## 2-5 PR 후 개선사항

[![top](https://img.shields.io/badge/top-%23000000.svg?&amp;style=for-the-badge&amp;logo=Acclaim&amp;logoColor=white&amp;)](#만국박람회-프로젝트)
