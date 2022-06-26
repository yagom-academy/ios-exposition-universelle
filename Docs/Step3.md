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

