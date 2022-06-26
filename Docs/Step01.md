## 1️⃣ STEP 1
### STEP 1 Questions
#### `json Decoding 방식`
- 현재 저희가 작업한 Decoding 방식이 현업에서 사용하는 방식과 유사한지에 대해 의문이 있습니다.
#### `coding key 왜 써야 하는지`
- "변수나 상수명을 스네이크 케이스로 선언해주면 동일하지 않을까"라고 생각했지만, 그렇게 되면 코드 컨벤션이 안맞기 때문에 codingKey를 사용해서 json key값에 대해 대응해주는 것 같습니다. 라이언의 생각은 어떤지 궁금합니다!!
#### `Json 파일을 어디에 저장해야 할지`
- 프로젝트 파일에 저장하는지, Assets에 import 하는지에 대한 의문이 있었습니다.
- 결론: Assets에 images, data 등 프로젝트에서 사용하는 파일을 넣는다는 Asset Management 문서의 내용을 보고 json 파일도 data 라고 생각해서 Assets에 import하는 방법을 채택했습니다. 라이언은 프로젝트에서 사용하는 파일을 어떤 방식으로 관리하시는지 궁금합니다. 
---
### STEP 1 Answers
#### `json Decoding 방식`
- JSON 형식의 데이터를 받는다면 여러분이 정의하신 것과 같은 방식으로 Decodable을 준수하는 모델을 정의하고, JSONDecoder를 이용해 디코딩하는 방식을 사용하고 있어요.
#### `coding key 왜 써야 하는지`
- 전달받은 JSON의 키값과 정의한 모델의 프로퍼티의 이름을 다르게 만들고 싶은 경우가 있을 수 있어요. 그럴 때 CodingKey 프로토콜을 준수하는 CodingKeys 열거형을 정의합니다. 단순히 Snake case 형식의 키값을 Camel case로 변경하는 경우에는 JSONDecoder의 keyDecodingStrategy를 변경하여 대응할 수도 있으니 참고하세요.
#### `Json 파일을 어디에 저장해야 할지`
- 일반적으로 JSON 형식의 파일을 저장하는 경우는 드물긴 하지만 앱에서 활용한다면 Asset에 위치시킬 것 같아요. 하지만 단순히 테스트를 위해 활용하는 JSON 형식의 데이터가 필요하다면 별도로 마련한 테스트 타겟에서 상수로 정의하여 사용할거에요. 현재 Asset 위치에 넣는다면 불필요하게 앱 용량이 커질테니까요.
---
### STEP 1 Debugging
#### `Json decode 테스트 nil 반환`
- ExpoInformation 구조체를 구현하고 JsonDecode를 하는 과정에서 nil이 반환되는 문제가 있었습니다. 그래서 아래의 순서대로 디버깅을 해보았습니다.

    1. Assets에서 Json 파일을 가져오는게 문제인지 LLDB를 활용해 확인했지만, 파일을 가져오고 있었습니다.
    2. 직접 Json 데이터를 작성해서 테스트 하는 방법을 사용해서 확인했으나, 동일하게 nil을 반환했습니다.
    3. ExpoInformation 구조체의 프로퍼티를 확인하는 과정에서 특정 Key에 오타가 있었음을 알 수 있었습니다.
>결론 : 하나의 Key 값에 문제가 있어도 Decode 전체에 문제가 생긴다는 걸 알 수 있었습니다.
---
### STEP 1 Concepts
- Json
- Assets
- Coding Key
---
### STEP 1 Reviews And Updates
    
[STEP 1 Pull Request](https://github.com/yagom-academy/ios-exposition-universelle/pull/173)
