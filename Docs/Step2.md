## STEP2

### STEP2 고민한 점

- **JSONData Decoding 메서드의 재사용성 증가 관련 궁금증**
기존에 STEP1에서는 각 테스트 별로 디코딩하는 메서드를 생성해서 사용했지만 이번 STEP2에서는 이 메서드의 재사용성을 높여주고자 전역 메서드로 분리를 시켰습니다. 여러 타입을 같은 메서드에서 사용하고자 할 때 프로토콜로 묶어서 쓴 기억이 계산기 떄 있었기에 이번에도 ExpoData라는 프로토콜을 만들었습니다.
ExpoHomeViewController가 사용할 타입인 Exposition, ExpoMenuVuewController에서 사용될 ExpoItemElement배열 타입을 위해 각각의 viewDidLoad 메서드에서 이를 호출하게 했습니다.
다만 작성하다보니 JSONDecoder의 decode메서드에 들어가는 argumentLabel이 메타타입이었고 프로토콜을 메타타입으로 지정하려고하니 제너릭으로 사용해야 한다는 오류가 있었습니다.
정확하게 어떻게 동작하는지 이해는 하지 못하였고 제너릭을 막 붙여보니 잘 동작해서 일단 사용하였는데 이런식으로 사용하는게 맞는 방향인지 궁금해서 질문드립니다.
> 저라면 프로토콜 ExpoData 을 채택한 모델 말고도 다른 모델도 해당 메소드를 사용하기 위해 ExpoData라는 건 사용하지 않을 것 같아요. 저번 계산기 미션은 큐에서 들어갈 Element를 구분하기 위해 빈 프로토콜을 사용한 것 같은데,
지금 jsonData를 처리하는건 모든 모델에 대해 처리할 수 있는 것 같아 ExpoData라는 프로토콜은 사용하지 않을 것 같습니다.
이미 모델은 Codable(or Decodable)을 채택하고 있기 때문입니다 :)

<p style="color:red">후에 Codable만을 채택하는 타입으로 변경 완료 </p>

- **뷰 간의 데이터 이동**
뷰와 뷰 사이의 데이터 이동 / 주입을 시킬 때, 밑의 메서드를 활용하여
`instantiateViewController(with Identifier:)`
컨트롤러에 프로퍼티를 만들어서 넘겨주는 방법을 사용하였습니다. 이 외에 다른 간단한 방법이 있는지 궁금합니다!
> 다른 방법으로 vc 을 만드는 건 아래 코멘트를 드리면 될 것 같아요 :)
custom init을 사용해야 할 때 좋습니다. [custom Initailizal](ttps://useyourloaf.com/blog/better-storyboards-with-xcode-11/)

### STEP2 트러블 슈팅
- **Navigation의 BarItem 변경시 view life cycle마다 ViewController가 다르게 인식**
네비게이션 바의 타이틀을 변경하기 위해 다음과 같은 메서드를 구현해보았습니다.
```swift
func modifyNavigationTitle(to name: String, in VC: UIViewController) {
    VC.title = name
}
```
그리고 이 메서드를 viewWillAppear에서 사용하였습니다
```swift
override func viewWillAppear(_ animated: Bool) {
    modifyNavigationTitle(to: "한국의 출품작", in: self)
    modifyNavigationBackButtonTitle(to: "메인", in: self)
}
```
다만 이 메서드를 viewWillAppear와 viewDidLoad 두군데서 실행 시켜 보았는데. self가 이전 뷰컨트롤러와 현재 뷰컨트롤러로 다르게 나오는걸 확인했습니다.
이 부분도 VC.title이 아니라 self.navigationController?.navigationBar.topItem?.title 과 같이 정확하게 지정하여 변경하고자 하는데 view lifecycle과 self의 연관성 확인 후 변경할 예정입니다.

**Description의 줄바꿈이 되지 않고 한 줄로만 나오는 경우**
JSON에서 파싱한 description data의 줄바꿈을 해주려고 하였지만, 우선 구현에 목적을 두고 refactor 혹은 step3에서 오토레이아웃을 적용시켜 바꿔줄 계획입니다.
