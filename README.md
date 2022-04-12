## 만국박람회 프로젝트 저장소
> 프로젝트 기간 2022.04.11 ~ 2022.04.22 <br/>
팀원 : [@grumpy-sw](https://github.com/grumpy-sw) [@Donnie](https://github.com/westeastyear)
리뷰어 : [stevenkim18](https://github.com/stevenkim18)

- [만국박람회](#만국박람회)
- [STEP 1](#[STEP-1]-모델-타입-구현)
    + [기능 구현](#[STEP-1]-기능-구현)
    + [핵심 개념](#[STEP-1]-핵심-개념)
    + [궁금한 점](#[STEP-1]-궁금한-점)


### [STEP 1] 모델 타입 구현
- JSON 포멧의 데이터와 매칭할 모델 타입을 구현


### [STEP 1] 기능 구현
- `Entry: Codable`
    - `name: String`
    - `imageName: String`
    - `introduction: String`
    - `description: String`
    - `enum CodingKeys: CodingKey`
        - `case name`
        - `case imageName = "image_name"`
        - `case introduction = "short_desc"`
        - `case description = "desc"`
- `Exposition: Codable`
    - `title: String`
    - `visitors: Int`
    - `location: String`
    - `duration: String`
    - `description: String`
    
### [STEP 1] 핵심 개념
* `Codable`을 채택하여 `JSON` 데이터와 매칭할 모델 타입 구현
* 스네이크 케이스 또는 축약형인 `JSON` 키 값을 스위프트의 네이밍에 맞게 변환

### [STEP 1] 궁금한 점
1. 테스트코드 작성 시 타입으로 `Decode`가 제대로 되었는지 확인하기 위해 `XCTAssertEqual`함수를 사용하여 `JSON`의 내용과 비교하였는데 일일이 값 비교를 하지 않는 방법이 있는지 궁금합니다.

2. 현재 프로젝트는 `Asset`으로 데이터를 담아서 진행하는데, 현업에서도 `Asset`을 활용하여 프로젝트를 하나요? 어떤 방식으로 진행하게 되나요?

3. `Codable`은 `Encoder`와 `Decoder`가 합쳐져있는걸로 알고 있는데, 때에 따라서 용도에 맞게 각각 채택을 해줘도 될거 같다는 생각이 들었습니다. 그럼에도 Codable을 사용하는 이유가 편리성 때문일까요? 개발자의 취향 혹은 선택의 문제일까요?
## 만국박람회 프로젝트 저장소
> 프로젝트 기간 2022.04.11 ~ 2022.04.22 <br/>
팀원 : [@grumpy-sw](https://github.com/grumpy-sw) [@Donnie](https://github.com/westeastyear)
리뷰어 : [stevenkim18](https://github.com/stevenkim18)

- [만국박람회](#만국박람회)
- [STEP 1](#[STEP-1]-모델-타입-구현)
    + [기능 구현](#[STEP-1]-기능-구현)
    + [핵심 개념](#[STEP-1]-핵심-개념)
    + [궁금한 점](#[STEP-1]-궁금한-점)


### [STEP 1] 모델 타입 구현
- JSON 포멧의 데이터와 매칭할 모델 타입을 구현


### [STEP 1] 기능 구현
- `Entry: Codable`
    - `name: String`
    - `imageName: String`
    - `introduction: String`
    - `description: String`
    - `enum CodingKeys: CodingKey`
        - `case name`
        - `case imageName = "image_name"`
        - `case introduction = "short_desc"`
        - `case description = "desc"`
- `Exposition: Codable`
    - `title: String`
    - `visitors: Int`
    - `location: String`
    - `duration: String`
    - `description: String`
    
### [STEP 1] 핵심 개념
* `Codable`을 채택하여 `JSON` 데이터와 매칭할 모델 타입 구현
* 스네이크 케이스 또는 축약형인 `JSON` 키 값을 스위프트의 네이밍에 맞게 변환

### [STEP 1] 궁금한 점
1. 테스트코드 작성 시 타입으로 `Decode`가 제대로 되었는지 확인하기 위해 `XCTAssertEqual`함수를 사용하여 `JSON`의 내용과 비교하였는데 일일이 값 비교를 하지 않는 방법이 있는지 궁금합니다.

2. 현재 프로젝트는 `Asset`으로 데이터를 담아서 진행하는데, 현업에서도 `Asset`을 활용하여 프로젝트를 하나요? 어떤 방식으로 진행하게 되나요?

3. `Codable`은 `Encoder`와 `Decoder`가 합쳐져있는걸로 알고 있는데, 때에 따라서 용도에 맞게 각각 채택을 해줘도 될거 같다는 생각이 들었습니다. 그럼에도 Codable을 사용하는 이유가 편리성 때문일까요? 개발자의 취향 혹은 선택의 문제일까요?
