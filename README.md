# 제목: 만국박람회 프로젝트

### 프로젝트 소개:
프로젝트 기간 : 2022-06-13 ~ 2022-06-24
소개: TableView, ScrollView 와 JSON 데이터를 활용하여 만국 박람회 전시작을 볼 수 있는 어플리케이션의 제작
**리뷰어** : [**제이슨**](https://github.com/ehgud0670)

## 팀원
    
| 재재 | 보리사랑 |
|:---:|:---:|
|<img src = "https://i.imgur.com/NffqjhR.png" width = "65%" height = "30%">|<img src="https://i.imgur.com/TeCoRmz.jpg" width="25%">|
|[Github](https://github.com/ZZBAE)|[Github](https://github.com/yusw10)|
    


---

## 타임라인: 시간 순으로 프로젝트의 주요 진행 척도를 표시

### Week 1
- **2022-06-13(월)** - STEP1 PR
  - Table View의 DataSource, Delegate에 대해서 고찰
  - 주어진 JSON 데이터를 토대로 인스턴스화 할 데이터 타입 작성
  - STEP1 Pull Request
 
- **2022-06-14(화)**
  - STEP2에 필요한 내용 개인 공부(TableView, JSON Data Handling)

- **2022-06-15(수)** - STEP1 Merged
  - 리뷰어 제이슨과 함께 STEP 1 리뷰(인스턴스의 테스트코드 작성법, Decodable, content.json의 의미)
  - STEP2 진행 방향 논의

- **2022-06-16(목)**
  - 첫번째 화면의 기초 레이아웃 설정(ScrollView)
  - 첫번째 화면 기능 구현(ScrollView 활용 및 박람회 정보가 담긴 JSON Data 디코딩)
  
- **2022-06-17(금)** - STEP2 PR
  - 두번째 화면인 박람회 전시물품 목록 화면 TableView기본 레이아웃 구현(예정)
  - 두번째 화면인 박람회 전시물품 목록 화면 TableViewCell 프로토타입 기본 레이아웃 구현
  - 두번째 화면인 박람회 전시물품 목록 화면 기능 구현
  - 세번째 화면인 박람회 세부정보 화면 기능 구현
  - Readme.md 작성

### Week 2
- **2022-06-20(월)** - STEP2 Merged
  - STEP2 Comment 관련하여 수정
- **2022-06-21(화)**
  - 첫번째 화면의 AutoLayout 수정
- **2022-06-22(수)** - STEP3 PR
  - 두번째, 세번째 화면의 AutoLayout 및 portrait 설정 완료
  - pull request
- **2022-06-23(목)**
  - 휴식
- **2022-06-24(금)**
  - STEP3 Comment 관련 수정
  - Readme.md 작성

---
## 프로젝트 내용

### 주요 기능
- JSON Data의 Decoding
- Scroll View를 활용하여 설명이 길어져도 내용을 스크롤링하여 전부 출력 가능
- Table View를 활용하여 전시품 목록들을 리스트화 하여 출력 가능
- AutoLayout을 활용하여 디바이스가 달라져도 레이아웃이 구성되게 조정
- Dynamic size를 적용

### 실행 화면(기능 설명)
1. **만국 박람회 소개 화면**
![](https://i.imgur.com/2YQswtZ.gif)

2. **한국의 전시 물품 목록 화면**
![](https://i.imgur.com/LqY1AjF.gif)

3. **전시 품목 상세 화면**
![](https://i.imgur.com/2QQMybi.gif)


---

## STEP 1

### STEP1 고민한 점 

**제이슨 리뷰**

- 소스 파일들을 어떤 폴더로 정리하시는지 궁금합니다. MVC를 예로 들면 모델끼리, 뷰끼리, 컨트롤러끼리 묶는지,아니면 한 뷰 컨트롤러가 담당하는 화면별로 MVC를 하나로 묶는지, 어떤 방식으로 파일을 계층화해서 정리하시는지 궁금합니다.
 
>  말씀주신것처럼 모델, 뷰, 컨트롤러끼리 묶는 경우도 있고 화면별로 모델, 뷰, 컨트롤러 폴더를 따로 묶는 경우도 있습니다.
화면이 너무 많아지다 보면 후자가 좀 더 파일 파악하기는 수월하더라고요. 그럼 고민해보시고 그룹 잘 나눠보시기 바랍니다 :)

- 포크해서 클론받은 작업물 중에 items.json을 구현해주었는데, Contents.json도 해주어야하는지 의문이였습니다. 해주지 않아도 된다면 이 Contents.json은 어떤 역할을 하는 건지 궁금합니다.

>Contents.json 도 결국 화면에서 쓰인다면 같이 모델링 작업 해주시면 좋습니다. 저의 경우에는 서버 api 로 내려오는 response들을 하나의 브랜치로 모두 처리했었는데 이러면 한꺼번에 모델링 처리하는 거라 나중에 다시 모델링 작업을 해줄 필요가 없어 좋았습니다. 따라서 같이 작업해주시면 좋을 듯 하네용 😄


### STEP1 트러블 슈팅

**JSON Data Decoding Test Code 작성에 관하여**

**제이슨 리뷰 중**
> 테스트 코드로 JSON 데이터가 모델로 잘 변환되는지 이번 PR에서 꼭 반영해주세요.</br>그래야 제가 리뷰어로서 어떤 데이터를 파싱하시는지 좀 더 파악이 될 것 같고 이해가 될 것 같아요.</br>그리고 여러분도 여러분이 작성하신 모델이 잘 파싱되는지도 확신할 수 있어서 안심이 되실 겁니다.

- 제이슨의 리뷰를 반영하여 테스트 코드를 작성하면, 어떤 JSON 데이터를 모델로 변환이 되는건지 확인할 수 있다는 장점을 생각하게 되었고 기존 step1에서 test code를 추가해주었다. 코드를 작성 후 간단하게 테스트를 해보면서 assets에 있는 JSON데이터가 잘 변환되는 것을 확인할 수 있었습니다. 또한 다음 스텝을 진행하면서 오류가 생긴다면, 이 부분에서는 따로 고칠 점이 없으니 다른 부분을 먼저 확인함으로써 프로젝트 진행시 더 원활한 진행이 가능할 것을 배웠습니다.


---
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

---
## STEP3
- [x] 첫 화면은 세로로만 볼 수 있도록 합니다
- [x] 출품작 목록과 상세 두 화면 모두 가로로 회전했을 때도 정상적으로 표시될 수 있도록 구현합니다
- [x] 모든 화면은 모든 아이폰 기기(아이패드 제외) 크기에 맞도록 구현합니다
- [x] 모든 화면에 Dynamic Type을 적용합니다
- [x] 가로로 회전했을 때도 정상적으로 표시될 수 있도록 구현합니다
- [x] 모든 텍스트가 잘리거나 줄임표(…) 처리가 되지 않도록 합니다

### STEP3 TroubleShooting
1. **Image View의 크기가 고정되지 않고 늘어나는 이슈**
최초에 Image View의 크기를 직접 정하지 않고 top, leading, bottom은 스택뷰에, trailing은 label을 담는 verticalStack View에 맞췄습니다. 

![](https://i.imgur.com/tq56Xv3.png)

다만 이렇게 설정하고 나니 imageView의 원본이 되는 asset의 크기가 매우 클 경우 Label에 굉장히 여백이 많이 들어가서 셀이 비정상적으로 출력되는 현상이 있었습니다. 

이를 해결하고자 접근을 다르게 하여 기존에는 label을 담는 Vertical Stackview의 크기를 superview의 크기에 비례하게 고정했으나 반대로 **ImageView의 크기를 고정시켜 주었고**, vertical stackview를 이에 맞춰주었습니다. ImageView의 크기를 고정으로(aspect ratio 1:1로) 지정할 경우 위의 사진처럼 해금의 사진이 정사각형으로 늘어나서 사용하면 안된다고 생각했었는데 이번 기회를 통해 **원본 비율을 유지하며 출력**된다는걸 알 수 있었습니다. 

이렇게 하니 정상적으로 출력이 되어 해결할 수 있었습니다. 

2. **ExpoHomeViewController의 화면을 고정시키기**
Step3 요구사항 첫번째에 첫 화면은 세로로만 볼 수 있도록 하는 조건이 있어서, 첫번째 뷰컨인 ExpoHomeViewController만 화면 회전 고정을 시켜주고 나머지 ExpoMenuViewController랑 DetailViewController는 회전을 해도 정상적으로 표시될 수 있게 해주었습니다.

우선 ExpoHomeViewController의 화면 전환 제어를 위해 AppDelegate에는 밑의 메서드를,
```swift
class AppDelegate: UIResponder, UIApplicationDelegate {
    var orientationLock = UIInterfaceOrientationMask.all

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
            return self.orientationLock
    }
}

struct AppUtility {
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }
    
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
        
        self.lockOrientation(orientation)
        
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }
```
그리고 ExpoHomeViewController에서는 portrait상태로만 존재하고, push 된 하위 뷰 컨트롤러에서는 모두 출력되게 하기 위해 ExpoHomeViewcontroller의 viewWillAppear 함수 안에 밑의 코드를 추가해주었고
```swift
AppUtility.lockOrientation(.portrait)
```
viewWillDisappear 메서드 안에는 다음과 같이 설정하게 해주었습니다. 
```swift 
AppUtility.lockOrientation(.all)
```


### STEP3 조언을 구하고 싶은 부분
1. **DetailViewController의 description이 한줄로 나오는 이슈**

| 설명  | 화면 구현                                 |
| :----: |:-----------------------------------------:|
| DetailViewController의 컨텐츠는 Vertical 스택뷰 내부의 imageView와 description 라벨 두가지로 구성되어 있습니다. 이때 각 컨텐츠들이 본연의 크기대로 정렬되게 하고자 스택뷰의 distribution을 `Fill Proportionally`로 지정해 주었는데 이렇게 하니 다음과 같이 특정 컨텐츠에 대해서만 한줄로 나오게 되었습니다. </br> Distribution을 `Fill`로 변경하니 문제가 해결되었으나, `Fill Proportionally`를 적용하여 한줄만 출력이 된다면, 모든 Description 라벨이 한줄로 출력되어야 한다고 생각을 했습니다. Fill과 Fill proportionally에 이렇게 되는 차이점이 있는건지 궁금합니다. | <img src=https://i.imgur.com/MveNmDn.gif width=2500> |

> => stackView의 element 각각이 정확한 heightAnchor 값이 적용되어야 fillProportionally가 잘 적용됩니다.
저는 sizeThatFits와 heightAnchor 로 해결하긴 했어요, 참고차 말씀드려요 ㅎㅎ

2. **storyboard로 프로젝트 상세 구현은 성공하였지만, 코드로 작성하지 못한 아쉬움**
저희가 이번 만국박람회 프로젝트를 진행하면서, 세개의 뷰컨을 띄우는게 처음이라 코드보다는 스토리보드로 전반적인 흐름이나 구현 방식을 이해를 먼저 하는게 좋을 것 같다는 의견이 맞아 스토리보드로 진행을 하게 되었습니다.<br>
결과물은 만족스럽지만 아무래도 코드로 작성하지 못한 아쉬움이 있어, 나중에라도 이번 만국박람회 프로젝트를 코드로 작성해봤으면 좋겠다는 생각이 있습니다. 코드 작성 시 유의해야할 사항이나 제이슨의 꿀팁 등등의 의견을 듣고 싶습니다!

> 여러분들이 직접 코드로 구현해서 시행착오를 겪어가며 여러분만의 노하우를 갖는게 꿀팁입니다. 결국에는 자신이 해결하는게 가장 큰 자산이더라고요 ㅎㅎ

---
## 참고 


### 참고한 페이지
[Apple Developer Document - Codable](https://developer.apple.com/documentation/swift/codable/)
[Cory의 블로그 - ScrollView AutoLayout](https://corykim0829.github.io/ios/UIScrollView-with-storyboard/#)
[Apple Developer Document - TableView](https://developer.apple.com/documentation/uikit/uitableview/)
[boost course의 yagom 강의](https://www.boostcourse.org/mo326/lecture/18732?isDesc=false)
