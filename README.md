---

# 목차

#### 1. [🌏 프로젝트 소개](#-🌏-프로젝트-소개)
#### 2. [👥 팀원](#-👥-팀원)
#### 3. [🏞 구현 내용](#-🏞-구현-내용)
#### 4. [🔥 트러블 슈팅](#-🔥-트러블-슈팅)

---

# 🌏 프로젝트 소개
* 만국박람회의 정보와 정보를 조회하는 앱입니다.

---

# 👥 팀원

| <center> Jeremy | <center> 준호 |
| -------- | ---------|
| <a href="https://ibb.co/K6tWhrT"><img src="https://i.imgur.com/RbVTB47.jpg" border="0" width="200"></a>  | <img src="https://user-images.githubusercontent.com/88357373/197145292-c806a131-bd9d-47ca-8b2a-8842f748f63f.png" width="200"/>
  | <center>[*@yjjem*](https://github.com/yjjem)</center> |[<center>[*@junho15*](https://github.com/junho15) </center> |
---

# 🏞 구현 내용

| <center>Main</center> | <center>Accessibility</center>|
| -------- | -------- |
| <center><img src="expo_main_221028.gif" height="500px"/></center>|  <center><img src="expo_accessibility_221028.gif" height="500px"/></center>    |

*사용자가 원하는 크기로 텍스트를 읽을 수 있도록 Label과 Button에 Dynamic Type을 적용*

---
# 🔥 트러블 슈팅

#### 1. Cell Constraint
`문제` stackView가 imageView보다 작아질 때, imageView가 ContentView에 붙어버리는 문제 발생했습니다.
`해결 방안` imageView의 top, bottom에 greaterThen으로 최소값을 10을 주어서 해결했습니다.
    
| <center> 셀의 AutoLayout 제약 시각화 </center> |
| -------- |
| <center><img src="https://i.imgur.com/oMLrCVf.png" width="700px"/></center>     |

    
#### 2. 기본 Cell의 레이아웃 조정 한계

`문제` Cell의 style을 Subtitle로 해서 구현할 수 있을 것 같았지만, cell contentView의 기본 subview들에게 직접적으로 Constraint를 설정하는 것에 있어 한계가 있었습니다.
`해결 방안` Table View Cell의 style을 Custom으로 바꿔서 code로 Contet View를 구성하고 constraint를 추가했습니다.

|<center> 기본 Style </center>| <center> 커스텀 Style </center>|
| -------- | -------- |
| <center><img src="https://i.imgur.com/JlMnXqV.jpg" height="500"/></center>     | <center><img src="https://i.imgur.com/LwSUILC.png" height="500"/></center>|

#### 3. 코드의 중복성
`문제` 첫번째 화면과 두번째 화면에 같은 역할을 하지만 중복되는 메소드가 있습니다.
`해결 방안`
중복되는 코드를 제거하기 위해 JSONDecoder의 extension에 decode 메서드를 추가했습니다. 제네릭 타입을 사용해서 두 화면 모두에서 사용할 수 있도록 했습니다.
    
```swift
extension JSONDecoder {
    func decode<T: Decodable>(from fileName: String, to: T) -> T? 
        guard let dataAsset: NSDataAsset = NSDataAsset(name: filName) else { return nil }
        do {
            return try self.decode(T.self, from: datAsset.data)
        } catch {
            return nil
        }
    }
}
```
    
#### 4. UI 구성 방법
`문제` 이번엔 간단히 뷰를 구성할 수 있고 결과를 바로 확인할 수 있는 스토리보드를 우선적으로 사용했습니다. 하지만 스토리보드로 만들다보니 뷰가 많아지고 constraint를 계속 추가하다보니 한눈에 보기 어렵고 변경내역을 추적하기 힘들었습니다.
`해결 방안` CustomCell(ExpoEntryCell)의 contentView의 sub view는 코드를 사용해서 구성했습니다.

* 스토리보드 UI 장단점
    - 장점 : 뷰를 쉽게 추가할 수 있고, 추가한 뷰가 바로 시각화되기 때문에 작업 내용을 확인하기 편함.
    - 단점 : 뷰가 많아지고 화면이 복잡해지면 가독성이 떨어짐.
* 코드 UI 장단점
    - 장점 : 코드로 작성하면 변경사항을 추적하기 쉬움.
    - 단점 : 실제 뷰가 어떻게 그려질 지 바로 확인하기 어렵다.
    

