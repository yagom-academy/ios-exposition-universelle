# STEP 3

---

# 고민한점 및 해결방안 🤔
이번 STEP3에서는 STEP2에서 잡지 못했던 오토레이아웃 및 접근성(Accessibility) 향상에 대해서 진행했습니다.


### 1. 
cell의 오토레이아웃을 잡는 과정에서 사진과 레이블 그리고 악세사리등의 위치가 제대로 잡히지 않는 어려움을 겪었습니다. 그러나 이후 과정에서 cell내부에 이미 할당된 contentView에 내용물을 얹고 진행을 하였더니 내용물의 위치가 제대로 잡혀 설정을 완료 하게 되었습니다.

### 2. 
Dynamic Type을 사용하여 글자를 키울때 일정 크기 이상으로 글자가 커지면 (...) 처리가 되는 현상을 겪었었으나, 글자의 행수 제한을 0으로 설정하여 모든 글자가 나오도록 설정을 해주었습니다.

# 배운개념 📚
## 1. 코드로 레이아웃 짜기
코드로 레이아웃을 짜기 위해선, 코드로 레이아웃을 짜기 원하는 뷰의 세팅을
```swift
.translatesAutoresizingMaskIntoConstraints = false
```
로 설정해서, View의 Autoresizing을 스토리보드가 아닌 코드로 짤 수 있도록 설정해줘야 한다.

그 다음, 원하는 제약을
```swift
.topAnchor.constraint(equalTo: itemDescriptionScrollView.topAnchor)
```
과 같은 코드를 호출해 `NSLayoutConstraint` 객체를 리턴 받아 활용할 수 있다.
해당 객체 내부에 있는 `.isActive` 프로퍼티를 `true`로 설정하면, 그때부터 제약이 활성화 된다.

## 2. 코드로 짠 제약 한번에 Active하기
`.constraint(equalTo:)` 메서드로 리턴받은 `NSLayoutConstraint` 인스턴스들을 한번에 Active 하고 싶다면, NSLayoutConstraint.activate() 메서드를 호출해서 내부에 Active하고자 하는 NSLayoutConstraint 인스턴스들을 배열 형태로 전달하면 한번에 Active할 수 있다.
```swift
itemStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemStackView.topAnchor.constraint(equalTo: itemDescriptionScrollView.topAnchor),
            itemStackView.bottomAnchor.constraint(equalTo: itemDescriptionScrollView.bottomAnchor),
            itemStackView.widthAnchor.constraint(equalTo: widthAnchor, constant: -25),
            itemStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
```

## 3. 원하는 뷰 컨트롤러에서 화면 회전 고정하기
### 화면 회전 고정하기
우선 화면 회전을 고정하기 위해선, `AppDelegate` 클래스 내부에서 `application(_:supportedInterfaceOrientationsFor:)` 메서드를 정의해주면 델리게이트 방식으로 화면이 회전 가능한 방향을 지정해줄 수 있다.
해당 메서드 내부에서 원하는 방향 제약을 `UIInterfaceOrientationMask` 타입으로 리턴해주면 된다.
### 원하는 뷰 컨트롤러에서 화면 회전 고정시키기
화면 회전을 고정시키기 위해서는 AppDelegate 인스턴스 내부에서 설정해줘야 하기 때문에
```swift
let appDelegate = UIApplication.shared.delegate as! AppDelegate
```
과 같이 현재 실행중인 앱의 `AppDelegate` 인스턴스를 가져올 수 있다.

## 4. 화면을 회전한 상태로 첫 번째 화면에 진입할 경우, 화면이 가로로 들어가지는 문제
프로젝트 요구사항에서는 앱의 시작화면은 세로로 고정되어야 한다는 사항이 있었다.
그러나, 위에 고민사항처럼 AppDelegate 내부에 화면 회전을 고정해줘도, 진입 시점에 이미 화면이 돌아가 있으면 화면이 portrait으로 고정되지 못하는 상황이 발생했다.
이를 해결하기 위해서
```swift
let value = UIInterfaceOrientation.portrait.rawValue
UIDevice.current.setValue(value, forKey: "orientation")
```
과 같이 코드를 작성하여 화면에 진입할 경우 화면을 세로로 돌리도록 지정해주었다.

<br/>
<br/>

# STEP3 궁금한점 ❓
1. 메인 화면 초기에서 화면을 portrait로 돌리는 과정에서, Key-Value Coding을 사용했습니다.
```swift
let value = UIInterfaceOrientation.portrait.rawValue
UIDevice.current.setValue(value, forKey: "orientation")
```
해당 코드를 작성하면서 `orientation` 프로퍼티는 get only로 설정되어있고, `key-value coding` 방식으로만 세팅이 가능하다는 것을 알 수 있었는데요,
왜 프로퍼티에 직접 접근하지 않고, `Key-Value` 방식으로 접근할까 의문이 들어 찾아본 결과 _"Swift에서 Objective-C의 기능을 사용하는 부분이 어느정도 남아있기 때문에, 해당 개념을 사용할 수 밖에 없는 부분이 남아서인 것 같다."_ 라는 글을 봤는데, 이 내용만을 가지고는 왜 직접적인 setting이 불가능한지에 대한 이해가 가지 않아서 질문 드립니다!
위의 내용이 맞는 내용인지, 왜 직접적으로 `orientation` 프로퍼티를 세팅할 수 없고, `.setValue` 메서드를 통해서만 세팅을 할수 있도록 설계가 되어있는지 궁금합니다! 🤔

<br/>
<br/>

2. 화면회전 설정과정에서 아래 사진과 같은 코드를 사용해 보고 싶었으나 뷰컨트롤러에서 해당 코드를 사용하여 재정의를 한 결과 아무런 변화가 이루어지지 않았습니다. 그래서 저희가 이코드를 제대로 사용하기 위해서는 어떠한 부분을 더 공부해야 하는지, 아니면 저희가 코드를 잘못 이해하여 엉뚱한 코드를 가져온 것인지 궁금합니다!

![](https://i.imgur.com/2m7WKoE.png)
