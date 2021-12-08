### Yagom iOS 커리어 스타터 캠프

## 프로젝트 6 - 만국박람회

# 개요

1. 프로젝트 기간: '21.12.06 ~ '21.12.17
2. 캠퍼 : 나무, 제이티, 숲재
3. 리뷰어 : 흰

# 학습 키워드
1. Step1
- `JSON` 
- `Codable`
- `NSDataAsset` 
2. Step2

## Step1 고민한 점
1. Codable? Decodable? 

`Codable` 프로토콜은 `typealias Codable = Decodable & Encodable` 이렇게 두 가지 프로토콜을 결합한 형태입니다. 저희 프로젝트에서는 미리 준비된 데이터를 파싱하여 사용하기만 하지, 가공하거나 생성하여 통신하는 등의 Encoding 작업은 하지 않을것으로 예상했습니다. 

그래서 `Codable` 을 채택하면 코드를 읽는데 있어 불필요한 오해의 소지가 있을 것 같아, 대신 `Decodable`을 채택해 주었습니다.


2. 연산 프로퍼티 사용을 통한 넘버 포맷팅
```swift
extension ExpoInfo {
    var formattedVisitors: String {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        guard let formatted = numberFormatter.string(for: self.visitors) else {
            return ""
        }
        
        return formatted + " 명"
    }
```

스텝2 요구사항을 참고하여 첫번째 화면의 `방문객`에 표시되어야 할 정보를 형식 변환하는 연산프로퍼티를 추가했습니다. VC에서는 View를 표시하는 것 외의 역할을 하지 않도록 데이터를 원하는 형태로 미리 가공을 해두는 방식을 택했습니다. 
