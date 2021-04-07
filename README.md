# iOS 커리어 스타터 캠프

## 만국박람회 프로젝트 저장소

### 타임라인
- 21.04.05.(Mon): 
   - 저장소 fork
   - Step 1 Class Diagram 작성
   - ExpoIntroduction 및 Artwork 구조체 작성
- 21.04.06.(Tue):
  - JSONDecodable 프로토콜 작성 및 초기 구현
  - 타입 이니셜라이징 테스트 케이스 작성
  - JSONDecodable `decode(jsonFileName:)` 메서드 테스트 케이스 작성
- 21.04.07.(Wed):
  - PR 피드백 반영 #1
    - 디코딩 타입에 유연하게 대응하기 위해 JSONDecodable 프로토콜 -> CustomJSONDecoder 클래스로 변경하여 적용
    - 한 번의 인스턴스 생성으로 여러 타입에 대한 디코딩 지원이 가능하도록 제네릭 타입을 제네릭 메서드로 변경
    - 테스트 파일 내 SUT 옵셔널 타입 변경 (! -> ?)
    - decode(to:from:) 메서드에서 발생한 에러를 nil이 아닌 에러를 던지는 형식으로 변경
    - 에러를 표현하기 위한 에러 타입 추가 (ExpoAppError)
  - CustomJSONDecoder decode(to:from:) 메서드의 테스트 메서드 작성
  - 에러타입에 디버깅 시 참고할 수 있는 문구 추가 (CustomDebugStringConvertible)
  - 로직 변경에 따른 Class Diagram 수정
