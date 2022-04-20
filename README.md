# 📱 만국박람회 프로젝트

> 만국박람회 프로젝트 기간 2022.04.12 ~  </br>

팀원 : [@mmim](https://github.com/JoSH0318), [@Minseong](https://github.com/Minseong-yagom) / 리뷰어 : 👑 [@도미닉](https://github.com/appleCEO)

## 목차
- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [STEP 1](#step-1)
    + [고민 및 해결한 점](#고민-및-해결한-점)
    + [궁금한 점](#궁금한-점)
- [STEP 2](#step-2)
    + [고민 및 해결한 점](#고민-및-해결한-점)
    + [궁금한 점](#궁금한-점)
- [STEP 3](#step-3)
    + [고민 및 해결한 점](#고민-및-해결한-점)
    + [궁금한 점](#궁금한-점)
- [그라운드 룰](#그라운드-룰)
    + [스크럼](#스크럼)
    + [코딩 컨벤션](#코딩-컨벤션) 

---

## UML
![](https://i.imgur.com/44EtzjA.jpg)

---
## [STEP 1]
### 고민 및 해결한 점
#### 1️⃣ var vs let 
- 구글에 떠도는 JSON예제들에서 프로퍼티들을 변수로 쓰는 것을 보고 왜 변수로만 선언을 할까? decode할 때 변수만 가능한 것인가 의문이 생겼습니다.
> 테스트를 통해 let으로 해도 decode가 가능한 것을 확인하였습니다.  

#### 2️⃣ Model
- JSON 데이터와 매칭할 모델 타입을 구현하면서 어떤 타입을 만들어야하는 지 고민했습니다. 제공된 JSON 관련 데이터 파일은 `exposition_universelle_1900.dataset`와 `items.dataset` 두 가지입니다.(이 두가지 JSON 객체의 형태가 다르다.)
> 따라서 두 가지 모델 타입을 구현해야한다고 판단했습니다.

#### 3️⃣ Asset 파일
- Image와 JOSN데이터를 코드로 불러오기 위한 방법을 고민하면서 제공된 Asset형태의 파일들을 살펴보았습니다. 어떤 원리로 내 컴퓨터에 있는 파일을 매칭시켜서 가져 올 수 있을까를 고민했습니다.
- 프로젝트에 필요한 정보를 담은 JSON 또는 Image파일에는 항상 contents.json이 있는 것을 볼 수 있었습니다. 
- JSON 또는 Image파일을 프로젝트에 매칭시킬 수 있도록하는 정보를 담고있다고 추측했습니다. 
```swift
{
  "images" : [
    {
      "filename" : "buddhism~universal@1x.png", // 파일 이름
      "idiom" : "universal",                    // 어떤 기기 타입? : 모든 기기
      "scale" : "1x"                            // 스케일은 1x
    }
  ],
  "info" : {
    "author" : "xcode",                         // 프로그래밍 툴
    "version" : 1
  }
}
```
- 위와 같이 "buddhism~universal@1x.png" 파일은 어떤 기기에 사용될 것이고, 어떤 사이즈이고, 어떤 프로그래밍 툴을 사용할 지에 대한 정보를 담고있습니다.
> 폴더에 포함된 자산 또는 그룹의 속성을 인코딩하는 Contents.json 파일을 xcode의 Assets부분에 넣어주고 이것을 decode해서 사용하는 것으로 이해했습니다.

#### 4️⃣ Decode는 어디에서 해야할까?
- Model의 데이터 타입은 어디까지 구현해야하는 것인지에 대한 고민을 했습니다.
- JOSN 데이터를 decoding할 Model 타입만 구현을 하는 것이 좋을지, decoding 하는 코드까지 구현을 하는 것이 좋을지 고민했습니다.

> STEP2를 진행함에 따라 Model, viewController 중 더 합리적인 쪽을 선택하기로 했습니다.

#### 5️⃣ NSDataAsset의 사용
- Assets 데이터를 어떻게 사용해야하나 고민했습니다.
> NSDataAsset를 통해 asset 카탈로그의 명시된 `data asset`에 대한 참조를 사용하여 개체를 초기화하고 반환할 수 있는 것을 알게 되었습니다.

### 궁금한 점
#### 1️⃣ 중첩 타입 UML 작성법
```swift
struct ExhibitionItem: Codable {
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
}
```
이런 형태의 중첩타입은 어떤 방법으로 UML을 작성해야할 지 모르겠습니다😧 
저희가 작성한 UML처럼 프로퍼티를 작성하는 것과 동일하게 작성하는 것인지,
따로 enum 다이어그램을 만들어서 연결?하는 것인지 궁금합니다😫
조언 부탁드립니다🙏

#### 2️⃣ Asset 관련 궁금증🤔
위 `[고민 및 해결한 점]`에서 `3️⃣ Asset`은 저희가 야곰이 제공해준 Asset파일들을 살펴보면서 들었던 고민입니다. 자료를 찾아봤지만 정확히 무엇이다 라고 설명하는 자료가 없어서 합리적인 추측을 해보았습니다. 혹시 저희가 추측한 내용 중에 틀린 내용이 있는지 궁금합니다!

#### 3️⃣ Naming 컨벤션
저희가 작성한 코드의 naming이 적절한지에 대해 여쭤보고 싶습니다 😭

---
## [STEP 2]
### 고민 및 해결한 점

1️⃣ 메인화면의 navigationBar만 없애야 되는 이슈
- 메인화면은 navigationBar가 없는 것을 요구사항 이미지에서 확인하였습니다
> isNavigationBarHidden를 이용해 navigationBar를 없앨 수 있다

- isNavigationBarHidden사용하면 다른 뷰에도 영향을 주는 이슈가 발생했습니다
- isNavigationBarHidden사용하면 navigationController의 navigation bar를 없애게 되어 모든 화면의 bar가 사라지는 것을 알게 됐습니다
- 따라서 화면이 전환되는 시점에 다시 해제시켜줘야 합니다
> viewWillAppear -> isNavigationBarHidden = true
> viewWillDisappear -> isNavigationBarHidden = false
> 를 통해 해결하였습니다 

2️⃣ 첫번째 화면 TextLabel을 원하는 곳에서 줄바꿈 하는법
- 요구사항 이미지에서 "파리 만국 박람회 1900"뒤로 부연설명 부분이 줄바꿈 되어있는것을 확인하였습니다
- label의 줄바꿈 속성 lineBreakMode에 Word Wrap을 이용하여 해결하려고 시도해 보았습니다
    - "1900()"이런식으로 부연설명이 붙어 있어서 단어 구별을 실패했습니다ㅠㅠ
- "("를 기준으로 문자열을 나누고 첫번째 문자열은 title에, 두번째 문자열은 subtitle에 넣는 방식을 시도해보았다.
    - 이번 프로젝트 예시에 한정된 방법이라고 생각하여 철회했습니다 ㅠㅠ

3️⃣ asset이미지는 어떻게 삽입해줄 것인가
- 1.스토리보드에서 asset이미지 파일을 써서 바로 넣어주는 것 
- 2.코드로 이미지를 넣어주는 것
> 이미지를 한번 넣으면 고정될 이미지라고 생각했습니다, 스토리보드에서 제공하는 기능을 이용하여 바로 이미지를 넣어 주는것이 효과적이라고 생각했습니다

4️⃣ 화면 전환 시, 셀의 데이터 전달
- 세번째 뷰로 셀의 데이터를 어떻게 전달해야 하는가?? 고민하였습니다
> Instance Property를 이용하여 전달하는 방식으로 해결해 주었습니다

5️⃣ cell 만들기 - tableView(_ tableView:,cellForRowAt: )
1. tableView(_ tableView:,cellForRowAt: ) 메서드 내부에 `textLabel`을 이용하여 스토리보드 구현없이 cell을 만들고자 했습니다.
    - `Deprecated`될 것이라는 경고가 뜨는 것을 확인했고, 가능한한 사용하지 않기로 결정했습니다.
    - `defaultContentConfiguration`가 대신하여 새롭게 생긴 메서드인 것을 확인!
    
2. `textLabel`이 `Deprecated`되고 새롭게 통합된 `defaultContentConfiguration`를 사용하여 cell을 만들기!
```swift=
var content = view?.defaultContentConfiguration()  
    content?.text = "some data" 
    cell?.contentConfiguration = content 
    return cell
```
- 이러한 방법으로 구성해봤으나 Image의 크기를 설정할 수가 없었습니다. 
    - 크기를 설정하는 메서드를 찾아봤으나 찾지 못했습니다.(size, frame 등은 전부 get only였음)

3. custom cell을 이용하여 cell을 만들기!
- 이미지와 label들의 크기/위치를 자유롭게 설정할 수 있어야 한다고 생각했고, custom cell을 이용하는 것이 가장 용이하다 판단했습니다.
```swift=
 guard let cell = tableView
                .dequeueReusableCell(withIdentifier: "cell",
                                     for: indexPath) as? ExhibitionItemsTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.itemImageView.image = UIImage(named: exhibitionItems[indexPath.row].imageName)
        cell.titleLabel.text = exhibitionItems[indexPath.row].name
        cell.subtitleLabel.text = exhibitionItems[indexPath.row].shortDescription
```
> - 스토리보드에 이미지와 label들을 구현하고 UITableViewCell에 IBOutlet을 연결했습니다.
> - 위 코드와 같이 tableView(_ tableView:,cellForRowAt: ) 메서드 내부에서 image와 label에 값을 할당해주었습니다.


### 궁금한 점 및 질문사항 
1️⃣ Error Handling
프로젝트를 진행하다 보니 error를 처리해줘야하는 몇 가지 경우가 생겼습니다. 대부분 JSON file과 매칭이 되지 않을 때(찾을 수 없게 될 때) 생기는 에러입니다. 만약 에러가 발생했을 경우, 어떠한 동작을 해야할 지 결정하지 못했습니다.(요구사항에 없는 내용이라 😭)
저희가 생각해본 방법은 이러합니다.
- 알럿을 띄운 후, 확인을 누르면 빈 화면 제공
- 빈 화면 (무반응)
- label.text들에 에러 메시지 할당 
> 혹시 이런 방법들로 요구사항과 다르게 구현해봐도 될까요? 그리고 더 추천해주실 에러핸들링 방법이 있다면 조언을 받고 싶습니다.🙏

2️⃣ (고민한 점 2️⃣ 번 내용)첫번째 화면 TextLabel을 원하는 곳에서 줄바꿈 하는법
- 이 부분에 대해서 조언??힌트를 얻을 수 있을까요??😂❤️

3️⃣ (고민한 점 3️⃣ 번 내용)asset이미지는 어떻게 삽입해줄 것인가??
- 저희의 생각이 더 효율적인 것이 맞을까요??
---

## [STEP 3]
### 고민 및 해결한 점

1️⃣ 첫 화면 세로로 고정

<img width="500" src= "https://i.imgur.com/JyHjRqA.png"/>
- Deployment Info에서 Device Orientation을 통해 원하는 회전 방법을 선택해주었습니다.
- 위 방법은 디바이스 화면 전체에 영향을 줌
- 이 때, 원하는 화면에서만 세로모드만 지원하는 것처럼 특정 orientation값을 갖게 해주고 싶었습니다.
- UIInterfaceOrientationMask를 이용하면 원하는 view에서의 orientation을 코드로 바꿔줄 수 있다고 생각했습니다.
>아래 메서드와 화면의 위치를 알려줄 flag를 이용해 첫 번째 화면에서만 세로 값을 할당하여 문제를 해결해 주었습니다.

```swift
func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask
```

2️⃣ 하나의 label에 두 개의 다른 Font

<img width="500" src= "https://i.imgur.com/w1PXlug.png"/>

- 처음에는 한 줄에 다른 폰트를 표현하기 위해 위의 예시처럼 두개의 label를 horizontal stackView에 넣어주었습니다. 
- 하지만 이런 방법으로 했을 경우, Dynamic Type을 적용했을 때 각 label마다 다른 기준으로 글자가 커졌습니다. 그로 인해 필요없는 공백이 생기고, 사용자가 받아드리기에 불편한 텍스트가 출력되는 문제가 생겼습니다.
>하나의 label에 다른 성격의 두 Font가 존재하면 문제를 해결할 수 있다고 생각했고, NSMutableAttributedString을 통해 해결할 수 있었습니다.
>UILable Extension을 통해 필요한 Label에서 downSize()메서드를 사용하여 문제를 해결하게끔 만들어 해결해 주었습니다
```swift
func downSize(targetString: String) {
        let font = UIFont.preferredFont(forTextStyle: .body)
        let fullText = self.text ?? ""
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.font, value: font, range: range)
        self.attributedText = attributedString
}
```

3️⃣ AutoLayout - image
- image view에 AutoLayout을 적용함에 있어서 원하는 image의 크기, 비율이 출력되지 않았습니다.
- Aspect To Fit은 비율은 유지되고 imageView밖으로 사진이 나가지 않는 선에서 최대치 값을 갖습니다. 아래 그림과 같이 iamgeView에 크기를 정하게 되면 사진은 비율을 헤치지 않는 선에서 최대치 값을 갖습니다. 그렇다면 남게 되는 영역이 생기는데 에러가 생기지 않는 것에 의문이 생겼습니다. 

<img width="500" src= "https://i.imgur.com/ehoFplS.png"/>
- image view에 공백이 있는 것을 backgroundColor를 주어서 남은 영역은 공백으로 채우게 되고 image 자체가 공백과 합쳐진다는 것을 알았습니다.
>Scale to fill / Aspect to fit / Aspect to fill의 차이점을 찾는 것을 시작으로 적절한 방법을 사용하는 것을 통해 문제를 해결했습니다.

4️⃣ AutoLayout - stackView > Distribution > fill
- stackView > Distribution > fill을 적용했을 때 마지막 stack이 남은 비율을 꽉채우는 현상이 생겼고, 공백 부분에 컨텐츠가 채워지는 오류가 생겼습니다.
- fill은 가능한 공간을 채우도록 크기를 조정하는 특징을 가졌고, arranged view들의 크기가 넘어가면 compression resistance priority에 따라 뷰가 축소 / 공간이 남는다면 hugging priority에 따라 뷰가 늘어난다는 사실을 확인했습니다.

<img width="200" src= "https://i.imgur.com/3kmbbL7.jpg"/>
- 이번 프로젝트의 경우 공간이 남기 때문에 hugging priority에 따라 뷰가 늘어납니다. 때문에 hugging priority가 가장 낮은 마지막 arranged view(stack)가 늘어납니다. 
> hugging priority가 가장 낮은 마지막 arranged view(stack)에 높이를 줌으로써 늘어나는 것을 방지했고, 이를 통해 해결했습니다.

### 궁금한 점 및 질문사항 
1️⃣ ExhibitionItemsView Cell AutoLayout
- titleLabel과 subtitleLabel "missing Constraints" 문제
- titleLabel과 subtitleLabel를 스택뷰 안에 넣어주었습니다, 높이에 대한 문제가 자꾸 발생을 하는 것 같아 높이에 대한 Constraints를 주었는데도 다시 또 나타났습니다ㅠ 어떤 점 때문에 자꾸 높이를 못잡는건지 확인하지 못하였습니다

2️⃣ AutoLayout
- auto layout의 빨간색 오류를 전부 해결했지만, 간혹 다시 오류가 생기고, 다시 없어지기를 반복합니다. 아무런 변경사항이...없는데 말이죠 🤔
- 이런 현상을 미흡한 제약조건으로 인한 현상으로 바라봐야할 지, 단순 XCode 오류로 봐야할지 궁금합니다 😭
---

## 그라운드 룰

### ✏️ 스크럼
스크럼은 딱딱한 분위기보단 자유롭고 부드러운 분위기로 😋
매일 아침 10시, 디스코드에서 진행
어제의 활동 리뷰
오늘 활동 예정 사항 / 목표
자신의 부족한 부분 / 우리 팀이 아쉬운 부분 토론
컨디션 공유 😰
공유하고 싶은 이슈, 꿀팁 공유
스크럼 진행시간은 최대 30분을 넘기지 않기 ⏱
상황에 따라 조정 가능

---

### 🪧 프로젝트 규칙
프로젝트 협업 관련된 규칙 ( 지속적으로 업데이트 예정 ) / 야곰캠프에 있는 규칙을 기본으로 🤓

#### 📎 코딩 컨벤션
Swift 코드 스타일
코드 스타일은 [스타일쉐어 가이드 컨벤션](https://github.com/StyleShare/swift-style-guide#%EC%A4%84%EB%B0%94%EA%BF%88) 에 따라 진행한다.

#### 📎 Commit 규칙
커밋 제목은 최대 50자 입력
본문은 한 줄 최대 72자 입력

#### 📎 Commit 제목 규칙
- [chore] : 코드 수정, 내부 파일 수정
- [feat] : 새로운 기능 구현
- [style] : 스타일 관련 기능(코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
- [add] : Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 파일 생성 시
- [fix] : 버그, 오류 해결
- [del] : 쓸모없는 코드 삭제
- [docs] : README나 WIKI 등의 문서 개정
- [mod] : storyboard 파일,UI 수정한 경우
- [correct] : 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다.
- [move] : 프로젝트 내 파일이나 코드의 이동
- [rename] : 파일 이름 변경이 있을 때 사용합니다.
- [improve] : 향상이 있을 때 사용합니다.
- [refactor] : 전면 수정이 있을 때 사용합니다
- [merge]: 다른브렌치를 merge 할 때 사용합니다.

#### 📎 Commit Body 규칙
제목 끝에 마침표(.) 금지
한글로 작성

#### 📎 브랜치 이름 규칙
STEP1, STEP2, STEP3
