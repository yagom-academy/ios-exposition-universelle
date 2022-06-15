# Step1 

## 모델타입 구현
"items.json" 파일, "exposition_universelle_1900.json" 파일
- **Item.swift** (items 파일의 모델타입을 구현했다.)
- **Exposition.swift** (exposition_universelle_1900 파일의 모델타입을 구현했다.)
## snake케이스와 축약형
- CodingKey를 이용하여 JSON 키 값을 스위프트의 네이밍에 맞게 변환했다.

## JSON 테스트

- 각 JSON 파일마다 manager 를 만들어 파싱이 되는지 테스트를 진행했다.
--- 

## 문제점에서 해결한 점
- **로컬에 있는 json 파일을 파싱하는 방법에 대한 고민.**
파일의 경로를 찾는 과정에서 다른 사용자가 pull을 받았을 때 경로를 찾지 못하는 문제가 발생했다.
`Bundle.main.path(forResource: 파일명, ofType: 파일타입, inDirectory: 파일경로(상위 폴더이름))` 메서드를 이용하여 상대 경로를 찾아줬다.
`try? String(contentsOfFile: ).data(using: .utf8)`메서드를 이용하여 Data타입으로 변환하였고, 디코딩을 할 수 있었다.</br>

- **`DecodingError`**
기존의 `ItemDataManager` 에서 getData() 메서드를 수행하여 json을 읽어왔다. 이를 이용해 유닛테스트를 진행하였고, 똑같이 `ExpositionDataManager` 에서도 같은 getData()메서드를 사용하여 테스트를 진행 하였는데 typeMismatch 오류가 생겼다.
  > typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))
    
  **해석:** `Array<Any>` 를 decode 하는 것을 예상 했지만,`dictionary` 가 들어왔다 ! 
    decode 메서드에 type파라미터에 배열이 들어갔기 때문이었다. 배열에서 딕셔너리 타입으로 바꿔주니 오류가 해결 되었다. 대괄호 하나 차이로 인해 오류가 났던 것이었다. 파일로 직접 열어서 확인해보니, "items.json" 에선 [{}] 배열 타입의 json 이 들어있고, "exposition_universelle_1900.json" 에선 {} 딕셔너리 타입의 json 이 들어있었다. 
    ```swift=
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
    ```

- **본프와 웡빙의 xcode 버전이 달라 테스트코드가 실행되지 않는 문제**
본프가 작성한 테스트코드를 웡빙이 pull 을 받고 웡빙 xcode에서 테스트를 실행했을 때, 오류가 났다. xcode의 버전 차이 때문인 것 같았다. iOS Deployment Target 이 15.5 로 설정 되어있어 오류가 난 것인데, 이것을 15.2 로 설정 해주니 해결이 되었다.
![](https://i.imgur.com/rn65HjB.png)



