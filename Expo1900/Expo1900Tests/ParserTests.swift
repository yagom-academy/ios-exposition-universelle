import XCTest
@testable import Expo1900

class ParserTests: XCTestCase {
    func test_없는_Json파일명을_Parser에_넣었을_때_nil을_반환하는지() {
        // given
        let notExistJsonName = "도팀장님"
        
        // when
        let result = Parser<ExpoInformation>.decode(from: notExistJsonName)
        
        // then
        XCTAssertNil(result)
    }
}
