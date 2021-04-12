# 🇰🇷 만국박람회 프로젝트 저장소

<br/>

## 📝 This Repository Rules

- commit의 단위는 issue Number 입니다.
- 총 3가지의 STEP으로 진행합니다.
  - JSON 파일을 받아서 담을 타입을 구현
  - Table View 구현
  - 오토레이아웃 적용

<br/>

## 🎯 모델 구현

<br/>

- JSON 포맷의 데이터와 매칭할 모델을 구현합니다.

<br/>

## 📈 JSON 파일을 받아서 담을 타입을 구현

- 가져올 JSON 파일의 구조는 아래와 같습니다.

  ```json
  {
    "name":"직지심체요절",
  
    "image_name":"jikji",
  
    "short_desc":"백운화상 경한(景閑)이 1372년에 초록한 불교 서적",
  
    "desc":"《'백운화상초록불조직지심체요절》(白雲和尙抄錄佛祖直指心體要節)은 백운화상 경한(景閑)이 1372년에 초록한 불교 서적이다. 간단히 직지심체요절(直指心體要節) 또는 직지(直指, JUKJI)라고 부르기도 한다...
  }
  ```

   이 예시의 경우 key는 name, image_name, short_desc, desc로 총 4가지 입니다. 우선 이러한 정보를 넣을 수 있는 타입을 하나 만들었습니다. 이름은 출품작에 맞게 exhibitionProduct로 하겠습니다.

  ```swift
  struct ExhibitionProduct: Decodable {
      let name: String
      let imageName: String
      let shortDescription: String
      let description: String
  }
  ```

  ### 🧐 고민 Point!

  - 구현 타입 class vs struct vs enum:

    우선 세가지 타입 중 class로 구현할 이유는 없었습니다. JSON 파일의 내용을 담을 타입이라 상속의 상황이 발생할 계획이 없고 저장 타입의 역할이라면 값타입이 더 유리할 것이라고 판단했습니다. 중요한 것은 struct와 enum입니다.

    enum은 우선 구별되는 값을 case로 나눠줍니다. 관련 고민을 Stack Overflow의 답변에서 찾아볼 수 있었습니다.

    > One difference between the two is that **structs** can be instantiated where as **enums** cannot. So in most scenarios where you just need to use constants, it's probably best to use **enums** to avoid confusion...
    >
    > ref: [Stack Overflow](https://stackoverflow.com/questions/38585344/swift-constants-struct-or-enum#:~:text=One%20difference%20between%20the%20two,use%20enums%20to%20avoid%20confusion.&text=The%20above%20code%20would%20still%20be%20valid.&text=The%20above%20code%20will%20be%20invalid%20and%20therefor%20avoid%20confusion.)

    해석하면 인스턴스화가 필요 없고 값으로 단순히 상수만을 필요로 할 때에 대부분의 경우 enum을 사용하는 것이 struct보다 낫다는 뜻입니다. 위의 값은 상수만을 가지므로 enum을 고려해볼 수 있을 것 같습니다. 하지만 다음의 이유로 struct로 구현했습니다.

    1. 위의 타입을 기반으로 각각의 product들이 인스턴스로 구현될 예정입니다. 위에서 말한 instantiated 될 필요가 있습니다.
    2. 위의 상황과 다르게 JSON의 value가 String 뿐만 아니라 Int로도 나올 수 있습니다. enum의 경우 case의 rawValue 타입이 일치해야하기 때문에 struct로 구현했습니다.

  ExhibitProduct 타입은 Decoding을 위한 것이므로 Decodable을 채택하며, 4개의 프로퍼티를 갖습니다. 하지만 이렇게 되면 JSON에 존재하는 key와 이름이 다르게 됩니다. 그래서 CodingKeys라는 요소를 정의해줍니다.

  ```swift
  enum CodingKeys: String, CodingKey {
      case name
      case imageName = "image_name"
      case shortDescription = "short_desc"
      case description = "desc"
  }
  ```

  이 CodingKeys를 통해 좀 더 Swift에 맞는 네이밍으로 변경할 수 있습니다. CodingKeys는 Decodable을 채택하는 타입 안에 위치합니다. CodingKey의 경우 위의 고민 point에 언급한 것처럼 인스턴스화가 될 일이 없고 각 개별 case마다 String 값만 갖기 때문에 enum으로 구현된 것을 확인할 수 있습니다.

  여기에 추가로 Contents라는 자료를 추가하기 위한 구조도 생성하겠습니다. Contents의 구조는 아래와 같습니다.

  ```json
  "images" : [
      {
        "filename" : "buddhism~universal@1x.png",
        "idiom" : "universal",
        "scale" : "1x"
      },
      {
        "filename" : "buddhism~universal@2x.png",
        "idiom" : "universal",
        "scale" : "2x"
      },
      {
        "filename" : "buddhism~universal@3x.png",
        "idiom" : "universal",
        "scale" : "3x"
      }
    ],
    "info" : {
      "author" : "xcode",
      "version" : 1
    }
  ```

  위와 마찬가지 방식으로 구현했습니다.

  ```swift
  struct ExhibitionContent: Decodable {
      let images: [Image]
      let info: Information
      
      struct Image: Decodable {
          let fileName: String
          let idiom: String
          let scale: String
          
          enum CodingKeys: String, CodingKey {
              case fileName = "filename"
              case idiom, scale
          }
      }
      
      struct Information: Decodable {
          let author: String
          let version: Int
      }
  }
  ```

  이번엔 Camel case와 Snake Case의 차이가 없는 이름이 많아 CodingKeys는 filename에만 적용했습니다. 이번에는 ExhibitionProduct와 다르게 JSON의 value가 단일 값이 아닌 JSON 형식, 혹은 JSON 형식의 값을 갖는 배열로 구성되어있습니다. 이를 위해 struct 안에 다시 struct를 구현하는 방식으로 구조화하였습니다.



