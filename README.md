## 만국박람회

>프로젝트 기간 2022.04.11 ~ 2022.04.22
>
>팀원 : [Onetool](https://github.com/kimt4580), [Eddy](https://github.com/kimkyunghun3) / 리뷰어 : [올라프](https://github.com/1Consumption)

## 목차

- [프로젝트 소개](#프로젝트-소개)
- [키워드](#키워드)
- [고민한점](#고민한점)
- [배운개념](#배운개념)

## 프로젝트 소개
만국 박람회 만들기!


## 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3-blue)]()

## 키워드
`git flow` `auto layout` `JSON` `decoder` `tableView`

## 고민한점
* 협업을 할 시 git flow 를 활용한 PR을 작성하는 방법 (PR title)
* git flow 활용 전략과 브런치 네이밍 전략
* JSON 데이터의 활용과 Codable protocol 활용 방법
* Asset에 저장된 파일 활용 방법
* 에러 핸들링 (alert, throws)
* segue를 활용한 데이터 처리
* IBOulet annotation 실행 우선순위
* magic number 처리
* stack view padding 영역 생성

### 자세한 고민 보기
[STEP 1 PR](https://github.com/yagom-academy/ios-exposition-universelle/pull/138)

[STEP 2 PR](https://github.com/yagom-academy/ios-exposition-universelle/pull/154)

[STEP 3 PR](https://github.com/yagom-academy/ios-exposition-universelle/pull/160)

## 배운개념
### Json
Json (JavaScropt Object Notation) : 간결하고 쉽게 데이터를 나타내는 방법 중 하나로, 데이터 구조느 key, value로 이루어져 있다.
Json Codable : Swift 4에 추가된 프로토콜, JSON 데이터를 쉽게 Decording, Encoding 할 수 있게 해준다. Encodable / Decodable 프로토콜을 준수하는 프로토콜이다.
```swift=
struct Parser<T: Decodable> {
    static func parse(name: String) -> T? {
        let decoder = JSONDecoder()
        guard let asset = NSDataAsset(name: name, bundle: .main),
            let expoData = try? decoder.decode(T.self, from: asset.data)
        else {
            return nil
        }
        return expoData
    }
}
``` 
 
### segue를 활용한 데이터 전송
Segue로 데이터를 전송하려고 했을 때 처음에는 KoreaEntryData 모델을 활용해서 데이터를 전송하지 않고 새 변수를 할당해서 그곳을 이용한 데이터 전송을 하려고 했습니다. 하지만 데이터 전송이 안되고 전송하려는 뷰컨트롤러에서 nil이 반환되며 데이터 전송이 실패했습니다.

그래서 그 이유를 찾아보니,
IBOutlet 어노테이션은 그것을 선언한 곳에 진입햇을 때 할당이 됩니다. 그래서 처음에 저희가 IBOutelt를 3번째 화면에서 선언하고 이곳에다가 데이터 전송을 받는 방식으로 했는데, 그렇게 되면 두 번째 화면에서는 세 번째 화면을 가지 않았기 때문에 할당이 안되어있어서 nil로 반환이 됩니다. 그래서 이곳을 IBOutelt이 아니라 현재처럼 모델로 처리할 수 있지만, 그게 안된다면 변수로 할당해서 가져오는 방식도 있을 것 같습니다. 하지만 올라프가 말한 것처럼 모델을 통해 전송하는 것이 더 옳다고 생각합니다!

### 오토 레이아웃 설정
저희가 구상한 화면은 스크롤 뷰 속 여러 뷰들이 있거나 테이블 뷰로 되어 있습니다.
그래서 스크롤뷰 속 여러 뷰를 스택뷰로 해서 스택뷰의 레이아웃을 정하면 더 편리할 것이라고 판단했습니다.
그래서 이 스크롤뷰의 넓이와 동일하게 만들고 각각에 높이를 정해주니 잘 잡혔습니다.

테이블 뷰에서는 스택뷰 들로 구성해서 이에 대한 레이아웃을 잘 잡아주니 제대로 나왔습니다.

    
### TableView
테이블 뷰를 구현할 때 셀을 캡슐화 해주면 좋을 것 같아서 따로 뺐습니다.



