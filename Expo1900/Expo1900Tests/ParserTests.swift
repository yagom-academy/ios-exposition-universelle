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
    
    func test_올바른_Json파일_exposition_universelle_1900_을_Parser에_넣었을_때_정상적인_값을_반환하는지() {
        // given
        let jsonName = "exposition_universelle_1900"
        
        let title = "파리 만국박람회 1900(L'Exposition de Paris 1900)"
        let visitors = 48130300
        
        // when
        let result = Parser<ExpoInformation>.decode(from: jsonName)
        
        // then
        XCTAssertEqual(title, result?.title)
        XCTAssertEqual(visitors, result?.visitors)
    }
    
    func test_올바른_Json파일_items를_Parser에_넣었을_때_정상적인_값을_반환하는지() {
        // given
        let jsonName = "items"
        
        let name = "직지심체요절"
        let imageName = "jikji"
        
        // when
        let result = Parser<[ExpoEntry]>.decode(from: jsonName)?.first!
        
        // then
        XCTAssertEqual(name, result?.name)
        XCTAssertEqual(imageName, result?.imageName)
    }
}
