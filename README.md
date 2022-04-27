## 야곰 아카데미

### 만국박람회 프로젝트 저장소

핵심경험

## Codable을 채택하여 JSON 데이터와 매칭할 모델 타입 구현
Codable(Encodable + Decodable)채택했으나 Encodable이 필요하지 않다고 판단(Json을 디코딩만 함으로)하여 Encodable만 채택하도록 변경

## JSON 파일의 구조에 맞춰 모델 타입 구현
스네이크 케이스 또는 축약형인 JSON 키 값을 스위프트의 네이밍에 맞게 변환
-> Decodable 채택한 구조체(클래스) 안에서 private enum  CodingKeys: String, CodingKey 구현, JSON 파일내 객체의 이름과 실제 객체의 이름이 다를경우 사용한다. (스네이크 케이스: image_name, 처럼 _ 으로 띄어쓰기 구분)

## 테이블뷰의 Delegate와 Data Source의 역할의 이해
-> Delegate : 테이블뷰를 눌렀을때 처리하는 친구(안눌러도 볼 수 있으므로 안구현하는 경우도 있다.)
-> DataSource : 테이블뷰의 내용물을 담당하는 친구, 세션을 몇개를 쓸지, 세션당 몇개를 보여줄지를 담당하며 Cell을 커스텀 하여 원하는것만 보여줄 수 도 있다.
하지만 이제 테이블 뷰에서 -> 컬렉션 뷰로 넘어가는 추세인듯하다.
(https://iamcho2.github.io/2021/07/25/UICollectionView-or-UITableView-for-list)

## 테이블뷰의 셀의 재사용 이해
-> TableView.dequeueReusableCell 이 친구를 이용하여 셀을 꺼낸다. 셀은 재사용 될 수도 있기 때문에 이전에 셀에 조작을 가했다면 초기화를 해줘야 될 수도 있다.

## 테이블뷰의 전반적인 동작 방식의 이해
-> 재사용 가능한 셀이 있으면 재사용하고 없으면 생성한다. 그리고 DataSource, delegate 의 역할을 파악한다.

## 주어진 JSON 데이터를 파싱하여 테이블뷰에 표시
-> Json 디코딩한 것들을 DataSource에 담는다. 이때 indexPath의 위치정보를 가져온다.

## 내비게이션 컨트롤러를 활용한 화면 전환
-> navigationController?.pushViewController(다음 뷰, animated: true) 로 전환한다. 이때 다음 뷰를 전에서 생성해줘야 한다. storyboard?.instantiateViewController(withIdentifier: 뷰이름) 으로 뷰를 생성하였다. 이때 init으로 생성할 수도 있는대 그 부분은 좀 복잡하다. 위의 방법이 편하긴하다.

## 뷰 컨트롤러 사이의 데이터 전달
-> 다음 뷰를 생성할때 프로퍼티로 전달한다.  프로퍼티를 private으로 주고 싶다면 생성자를 사용한다.

## 오토 레이아웃을 적용하여 다양한 기기에 대응
-> 오토레이아웃 적용은 많이 해보는 수밖에 없다.

## Word Wrapping / Line Wrapping / Line Break 방식의 이해
-> 버튼, label 에서  line break option의 속성, character wrap: 개별 문자 단위로 줄바꿈, word Wrap: 단어 기준으로 줄바꿈, 

## 접근성(Accessibility)의 개념과 필요성 이해
손쉬운 사용 Voic over에서 text, value, hint 를 줄 수 있다. text: 이것이 뭔지, value: 값, hint: 어떻게 사용하는지 보통 나와있다고 한다.

## Dynamic Types를 통해 텍스트 접근성 향상
손쉬운사용 -> 글꼴 자동 크기 조절 해준다.

---

## 프로젝트 리뷰

import foundation, uikit 이 필요없는 경우도 있다. 그럼으로 필요없는경우라면 사용하지 말것.

네이밍에서 get으로 시작하는걸 쓰지 말것(단순 생성 메소드는 동사형 없이도 사용하곤 한다.) 마치 DispatchQueue.global() 처럼

근거 링크: (https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CodingGuidelines/Articles/NamingMethods.html)

중요한, 관리해야 되는 String 은 enum으로 관리하도록 하자.

return 문을 한줄에 쓰는건 지양하자(개인차긴함)

처음에 의미없이 기본적으로 생성되는 함수가 필요 없으면 지우도록 하자.

self를 쓰는 기준 : 이름이 같을때로 하자!

함수의 기능 분리를 잘하자!

tableview의 numberOfSections의 기본값은 1 이다. 그럼으로 필요없으면 구현안해도 된다.

배열을 사용할때 index를 벗어나면 앱이 터짐으로 다음과 같이 사용하는 방법도 좋다.
```
extension Array {
    public subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
```

뷰컨트롤러의 본인 스스로 이름을 반환하는 법 String(describing: self) 를 사용한다. extension으로 하면 사용하기 편할듯

class에 상속 안할꺼면 final을 사용한다.

tableView의 datasource, delegate는 스토리보드에서 설정할 수 있다.

화면 고정

appdelegate 플래그 주는거 말고 UIInterfaceOrientationMask를 사용하여 화면 고정을 관리할 수 있다.

