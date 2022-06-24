# STEP 2

---

# 고민한점 및 해결방안 🤔
스토리 보드로 UI를 구성하는 것과 코드로 UI를 구성하는 것을 두고 고민을 하였으나, 경험적 측면을 고려하여 코드로 UI를 구성해보기로 결정하였습니다. 

# 배운개념 📚
## 1. title :
ViewController의 title을 설정할 수 있다. 네이게이션컨트롤러를 사용하는 경우 상단에 들어감
## 2. tableView(_:numberOfRowsInSection:) :
섹션마다의 행의 개수를 설정할 수 있는 메서드입니다.
## 3. tableView(_:cellForRowAt:) :
각 행마다 사용할 셀을 세팅하기 위해서 불려지는 메서드입니다.
dequeueReusableCell 메서드를 사용해, 메모리에 올라가 있는 셀 인스턴스를 재활용 함으로써 성능상의 이점을 누릴 수 있습니다.
## 4. tableView(_:didSelectRowAt:) :
셀을 선택할 경우 호출되는 함수로, 내부에 셀이 선택될 경우 구현할 내용을 작성할 수 있었습니다.
## 5. ScrollView 구현시에 내부에 View를 생성해야 하는 점 :
스크롤 뷰 자체에는 content를 담을 수 없다는 점을 배웠습니다. 그래서 스크롤 뷰 내부에 view를 하나 더 생성하여 프로젝트를 진행하였습니다.
## 6. decode(_:from:) :
특정한 데이터를 디코드 할 수 있는 메서드입니다. 이번 프로젝트의 경우, 주어진 JSON 데이터를 타입으로 변환하는데 사용했습니다.

<br/>
<br/>

# STEP2 궁금한점 ❓
1. 메인 화면에서 화면 가장 하단에 태극기 이미지를 넣는 과정에서 완전히 동일한 `ImageView`를 두 개를 만들어 넣어놨는데요, 이렇게 하는 경우 같은 코드가 중복이 되는 것 같아, 혹시 동일한 뷰를 재활용해서 사용할 수 있는 더 좋은 방법이 있는지 궁금합니다.
![Screen Shot 2022-06-16 at 3 36 05 PM](https://user-images.githubusercontent.com/87175392/174006979-082cdf4d-ee32-4f35-9241-b341478e6375.png)
![Screen Shot 2022-06-16 at 3 37 28 PM](https://user-images.githubusercontent.com/87175392/174007223-8806ee75-5f97-4bdc-981f-1d0731afe814.png)

<br/>
<br/>

2.
![](https://i.imgur.com/qXXcka6.png)
위의 함수를 구현한 후에 활용을 하려고 했을때, 저희의 생각으로는 코드2번처럼 코드를 작성하는 것이 맞다고 생각했습니다. 그러나 실제 코드를 작성하니 코드2번은 오류를 일으켰고 코드1번처럼 코드를 작성하니 오류가 생기지 않았습니다. 저희가 제네릭을 잘 못알고 사용하여 오류를 일으킨 것인지, 아니면 특정이유 때문에 오류를 일으킨 것인지 궁금합니다!

- 코드1
```swift=
private let expoInfo: Expo? = JSONDecoder.decodeJson(jsonName: "exposition_universelle_1900")
```
- 코드2
```swift=
private let expoInfo = JSONDecoder.decodeJson<Expo>(jsonName: "exposition_universelle_1900")
```

---

# STEP 2 피드백 받은 내용

**1. class를 사용하는 개발자에게는 private level 보다 internal level이 더 중요하다.**

저라면 entryInfo(internal) 의 위치를 itemDescriptionScrollView (private) 보다 위쪽에 배치했을 것 같습니다. class를 사용하려는 개발자에게 internal level이 더 중요하기 때문입니다.


**2. viewDidLoad(Life Cycle)이 일반 method보다 중요하게 읽힌다.**

저라면 viewDidLoad 밑쪽에 loadView 를 배치했을 것 같습니다.
viewDidLoad(Life Cycle) 이 일반 method보다 중요하게 읽히기 때문입니다

**3. try를 사용하는 메서드인 경우, do-try-catch 혹은 ResultType으로 에러를 처리해주는 것이 좋다.**

throwable하게 만드는 것을 권해드리겠습니다. try는 가능하면 try?로 씹지 않는 것이 좋습니다. try? 로 optional을 내보낸다면 사용하는 쪽에서 어떤 Error가 발생했는지 알기 어렵기 떄문입니다.

**4. 뷰를 생성하는 코드 내부에서는 최대한 생성에 관련된 코드만 넣는 것이 좋다. (동작 관련 코드는 별도로 작성)**

위와 같이 closure로 property를 초기화하는 스타일은 관련 설정값을 몰아볼 수 있다는 점에서 좋습니다.
다만, 이 안에서 addSubview 와 같은 로직까지 수행하는 것은 과하다고 생각합니다. property 쪽에는 초기화 코드만 위치하도록 하고 동작같은 것은 init method 호출 이후에 별도 메서드에서 수행하도록 해주세요 .

**5. lazy는 동작시점을 명확하게 알 수 없기 때문에, 사용을 지양하는 것이 좋다.**

대부분의 property가 init 시점에 초기화되기 때문에 lazy로 초기화할 필요가 없어보입니다.
lazy가 많이보이는데요 전반적으로 재검토 해주시고 불필요한 것은 lazy 제거해주세요 .
lazy는 초기화 시점을 불명확하게 만들기 때문에 가능한 피하는 것이 좋다고 생각합니다.

**6. init?(coder:) 메서드가 Storyboard에서만 쓰인다 하더라도, 명시적으로 비활성화 해주는 것이 좋다.**
init?(coder:) 를 의미 없이 죽이지 말아주세요 . 위 코드에서는 setupConfigure() 를 호출하는 식으로 해서 살릴 수 있어보입니다.
혹은 interfacebuilder에서 사용되지 않기를 바라신다면,
@available(*, unavailable) 어노테이션을 붙여주세요 .

**7. 네이밍시 의미가 중복되지 않도록 주의.**
setupConfigure 의 네이밍이 setup과 configure의 의미가 중복되어 보입니다. 리네임 바랍니다.
참고로 저라면 setupSubviews() 라는 식으로 했을 것 같습니다.

**8. init 메서드는 가능한 짧게 관리하는 것이 좋다.**
- property 선언부에 있는 모든 로직들 init시점 이후로 미뤄주세요 .
선언부에는 최소한의 초기화 코드만 존재해야합니다.
- addSubview, 아래의 autolayout setup하는 부분에 대해 메서드 분리해주세요 .
init은 가능한 짧게 관리해야합니다.
