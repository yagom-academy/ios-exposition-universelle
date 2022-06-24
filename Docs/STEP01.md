# STEP 1

# 고민한점 및 해결방안 🤔
외부 파일을 그대로 끌어다 넣어서 프로젝트 파일에 추가하였더니 깃에서 PUSH가 되지 않는 현상을 확인하였습니다. 그래서 xcode내에서 파일을 새로 생성하여 json 파일 내부의 내용을 그대로 복사하여 붙여넣었더니 해당 현상이 해결 되는 것을 확인했습니다.

# 배운개념 📚
## 1. Codable :
   Codable은 Encodable 및 Decodable 프로토콜을 포함하는 typealias이다.
   Codable을 타입이나 제네릭 제약 조건으로 사용하면, 두 프로토콜을 모두 준수하는 모든 타입과 일치한다.

## 2. JSON:
   JavaScript Object Notation
   내가 지금 사용하고 있는 객체를 (메모리 상에 0과 1의 형태로 올라가 있    는 객체를) 내 컴퓨터에 저장해두거나, 혹은 다른 시스템에 전달하고 싶을 때 사용한다.
**`{}`** : 객체(딕셔너리)
**`[]`** : 배열
**`“ ”`** : 문자열
`100` : 수
`true/false` : Boolean
`null` : 빈 값
```swift
    {
        "이름" : "홍길동",
        "나이" : 150,
        "성별" : "남"
    }
```
# 궁금한점 ❓

```swift=
typealias Codable = Decodable & Encodable
```
Codable로 타입 별칭을 설정해 줄때 Decodable 과 Encodable 사이에 엔퍼센트(`&`)사용하는 문법을 처음 보아서 질문 드립니다! 엔퍼센트는 보통 Typealias에서만 사용하는것인지 아니면 콤마(`,`) 대신에 항상 사용가능한것인지 아니면 어떠한 특정 조건에서만 사용가능한 것인지 궁금합니다! 

2. JSON

저희가 짠 코드의 유효성을 확인하고자 parsing 테스트를 진행하였습니다. 

![](https://i.imgur.com/tMxXcpl.png)

그런데 상단 사진에 보이는 \n\n 줄바꿈 방식이 단순 print 함수에서는 문제없이 프린트 되었으나 parsing 과정에서는 오류를 일으켰습니다. 그래서 "\n\n" -> "\\\n\\\n" 으로 변경해주었더니 parsing이 문제 없이 잘 되었습니다. 하지만 아무리 고민해도 이 원인을 찾지 못하였는데, 혹시 찰리는 이에 대해 아시는 것이 있으신지 궁금하여 질문 드립니다!

---

# STEP 1 피드백 받은 내용

## 궁금한 점에 대해❗️
- & 의 사용

protocol 을 combination할 때 사용하는 operator입니다. comma 나 &&은 분기문에서 사용하는 것으로 맥락이 조금 다른 것 같네요.
comma와 &&의 차이에 대해서는 구글링 해보시길 권해드리겠습니다.

https://soojin.ro/blog/swift-comma-vs-and-operator 등.

- json 개행 문자에 대해

'왜 그런가' 에 대해서는 설명드리기 조금 난감한 부분이 있네요 .
대신 구글링 해본 결과 공유드립니다. 구글링 키워드 'swift json file back slash new line' 입니다.

https://stackoverflow.com/questions/42068/how-do-i-handle-newlines-in-json
