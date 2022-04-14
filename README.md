
# 🌃 만국 박람회
> 프로젝트 기간 2022.04.11 ~ 2022.4.22
팀원 : [@Doogie](https://github.com/doogie97) [@cherrishRed](https://github.com/cherrishRed) / 리뷰어 : [@TTOzzi](https://github.com/TTOzzi)


## UML
![](https://i.imgur.com/H8wuVgU.png)

## STEP1
### 기능구현
- `Item`, `Exposition` 구조체 구현
- `Decodable` 확장을 통한 `decode` 메서드 구현

### trouble shooting
#### 1. private(set)
![](https://i.imgur.com/5JbTLf9.png)
읽기 전용으로 접근제어를 설정해주고자 private(set)으로 설정하려고 했으나 오류가 났

✅ let 자체가 읽기 전용이라 외부에서 보았을 때는 private(set) 과 동일해, 접근제어를 걸어줄 필요가 없는 문제 였다. 

#### 2. decoder 위치
model VS viewcontroller
일반적인 디코딩 예제 코드에서는 decode 를 View Controller 에서 많이 처리 하는 것을 확인 했으나  decoder 에서는 UI 를 건드리는 부분이 없어 어디에 위치해야 하는지 의문이었다.

✅ 저희의 판단으로는 데이터를 권장하는 부분이 View Controller 있는 것이 좋지 않다고 판단해 `Decodable` 을 확장해 기능을 구현해 주게 되었다. 

#### 3. Decodable의 배열이 Decodable 의 메서드를 사용가능한 이유
![](https://i.imgur.com/t4cuROs.png)

[Self]? == Decodable? 로 인식이 돼서 정상적으로 반환이 되는 것 같은데 왜 배열타입과 Decodable타입이 동일 타입으로 취급되는 것인지 의문이었다.
✅
![](https://i.imgur.com/LWhZmPW.png)
 공식문서를 찾아보니 배열의 내부요소가 모두 Decodable 타입을 채택하면 그 배열도 Decodable 을 채택한다고 한다는 점을 발견했다.
 
#### 4. 디코딩에러 테스트
JSONDecode.decode 를 할경우 DecodingError 가 발생한다는 사실을 알게 되었다.
![](https://i.imgur.com/HMG0Ix0.png)
적절한 case 에 맞춰 에러가 발생하는지 테스트를 진행하려고 했으나 에러에 접근하는 방법이 의문이었다. 

✅ Error 에 접근한 방법
```swift 
func test_Exposition_decode호출시_잘못된파일명을대입할시_assetLoadError가발생하는지() throws {
    XCTAssertThrowsError(try Exposition.decode(with: "이상한이름")) { error in
        XCTAssertEqual(error as? DataLoadError, DataLoadError.assetLoadError)
        }
    }
```
저희가 생성한 에러 타입인 `DataLoadError` 에 접근 했을 때에는 `XCTAssertThrowsError` 메서드로 에러를 받고 `XCTAssertEqual` 로 비교해 테스트를 성공할 수 있었다. 

하지만 DecodingError는 Equatable을 채택하고 있지 않아 비교가 불가능 했다. 
```swift 
func test_프로퍼티의타입이잘못된객체에서_decode호출시_typeMismatch에러가발생하는지() throws {
    do {
        try DummyForWrongType.decode(with: "exposition_universelle_1900")
        XCTFail()
    } catch DecodingError.typeMismatch(let key, let value) {
        print(print("\n key: \(key) \n value: \(value) \n"))
    } catch {
        XCTFail()
        }
    }
```

그래서 do try 문을 사용해서 원하는 에러가 발생된 경우 해당 내용을 프린트 해 통과하게 만들었고 원하는 에러가 발생되지 않는 경우에는 실패하도록 테스트 코드를 변경하였다.


## 배운 개념
- JSON
- Meta Type
- Asset

## commit rule

커밋 제목은 최대 50자 입력
본문은 최대 72자 한글로 입력

💎feat : 새로운 기능 구현

✏️chore : 사소한 코드 수정, 내부 파일 수정, 파일 이동 등

🔨fix : 버그, 오류 해결

📝docs : README나 WIKI 등의 문서 개정

♻️refactor : 수정이 있을 때 사용 (이름변경, 코드 스타일 변경 등)

⚰️del : 쓸모없는 코드 삭제

🔬test : 테스트 코드 수정

📱storyboard : 스토리 보드를 수정 했을 때 

