
## ⚙️ 프로젝트 정보
- 🤖 프로젝트명: 만국박람회
- 🗓️ 프로젝트 기간: [2주] 2021.12.6 - 2021.12.17
- 👵🧓 팀원: [yohan](https://github.com/YohanBlessYou) & [zoe](https://github.com/na-young-kwon)

<br>

### ✏️ 학습키워드
#### 1. Foundation
- JSON / JSONDecoder

#### 2. UI 관련
- Autolayout
- Scroll View
- TableView
- Navigation Controller
- 화면 세로고정 하기

#### 3. Accessibility
- Dynamic Type
- Voice Over
- Accessibility Inspector

#### 4. 소프트웨어
- Coding Convention/Style

<br>

### 🤖 App 소개
<img src="https://user-images.githubusercontent.com/39155090/146541650-6ae22eeb-a4eb-44bd-8f47-6c4d09134b30.gif" width="30%" height="30%">

<br>

## 🤔 고민했던 점 + 해결방법

### 1. Scroll View 오토레이아웃
✔️ 문제
첫 화면을 스크롤할 때 네비게이션바 뒤로 사진이 비치도록 구현하고 싶었으나 어째서인지 사진이 비치지 않는 문제가 있었습니다.

✔️ 해결
네비게이션 바의 투명도 문제가 아닌, 애초에 스크롤뷰의 크기를 화면에 꽉차게 구성하지 않았던 점이 문제였습니다.
구체적으로는 제약을 걸 때 constraint to margins 이 항목을 체크해서 스크롤뷰의 top attribute를 superview에 맞추더라도 margin이 생겨버렸기 때문이었습니다.
constraint to margins 항목을 체크해제 해서 문제를 해결했습니다.

<br>

### 2. 버튼과 레이블이 겹쳐 보이는 문제
**✔️ 문제상황**
!<img src="https://i.imgur.com/YAFqkFE.png" width="20%" height="30%">

**✔️ 문제**
첫번째 화면에서 글씨크기를 키우면 버튼과 레이블이 겹쳐서 보이는 문제가 있었습니다. 원인은 `태극기 + 버튼 + 태극기` 스택뷰의 Alignment가 fill 이었습니다

**✔️ 해결**
스택뷰의 Alignment를 `center`로 바꾸고, 임의의 숫자로 고정해 놓았던 스택뷰의 높이 제약을 제거해서 해결했습니다

<br>

### 3. 가로보기 모드에서 두번째 화면 진입 시 자동회전이 안되는 문제

**✔️ 문제**
(세로보기로 orientation이 고정된) 첫번째 화면에서 device를 눕힌 채로, (가로/세로 모두를 지원하는) 두번째 화면으로 전환하면 자동으로 가로보기가 되지 않는 문제가 있었습니다

**✔️ 해결**
`EntryTableViewController` 에서 아래 메서드를 호출해서 해결했습니다.

```swift
UINavigationController.attemptRotationToDeviceOrientation()
```
기능: 뷰 컨트롤러 별로 인터페이스 방향이 다를 때 이 메서드를 호출하면 시스템이 즉시 새 방향으로 회전을 시도한다


<br>


## 📝 피드백 반영

### 1. 코드 컨벤션 관련
- 코드의 작성 순서를 `IBOutlet - 프로퍼티 - 라이프사이클 메서드` 순으로 배치했습니다.
- 테이블 뷰 관련 메서드들은 extension으로 빼서 구분해주었습니다.
- 필요하다면 주석으로 메서드들을 구분하여 가독성을 높이려고 노력했습니다.

<br>

### 2. viewWillAppear 에서 super 메서드가 왜 필요한지 생각해보았습니다.
super는 부모클래스를 의미합니다. 따라서 오버라이딩 할 때 부모의 작업을 실행하지말지 선택하는 것이기에 코드가 없어도 컴파일 에러를 유발하진 않습니다.

다만, 현재는 `super.viewWillAppear`가 빈 메서드 이더라도 애플이 나중에 뷰에 필요한 코드를 추가할 수도 있으므로 일단 적어주는게 좋습니다. 또 공식문서를 보면 반드시 호출하라고 적혀있기도 합니다.

<br>

### 3. file 이름을 고민했습니다.
처음에는 `Extension_Int` 이런식으로 파일명을 정했습니다.
피드백을 받고 `extension` 파일을 만들 때 `타입명 + Extension` 형식으로 통일하기로 했습니다.

<br>

### 4. 생략할 수 있는 `self`는 생략하기
```swift
private func setNavigationTitle() {
        self.navigationItem.title = entry?.name
}
```
- self를 반드시 써주어야 하는 부분과 구분이 되도록 하기 위해서
- 모든 곳에 self를 붙혀주는건 비효율적이기 때문에

굳이 써야할 이유가 없다면 `self`를 생략하는 방향으로 코드에 통일성을 주었습니다.

<br>

### 5. 배열 안전하게 조회하기
배열의 요소를 subscript로 추출할 때, range를 벗어난 곳을 참조하면 런타임 에러가 발생합니다

이를 방지하고자 여러 방법 중 별도의 subscript를 추가하는 방법을 택하였습니다 
index를 포함하는지 확인한 후 요소를 옵셔널 타입으로 리턴하도록 구현했습니다

```swift
extension Array {
    subscript(index index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
```
