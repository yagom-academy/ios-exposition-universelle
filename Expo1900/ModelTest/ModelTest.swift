import XCTest
@testable import Expo1900

class ModelTest: XCTestCase {
    
    func test_exposition_decoding() {
        guard let result = Exposition.decode() else { return }
        XCTAssertEqual(result.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
    }
    
    func test_item_decoding() {
        guard let result = Item.decode() else { return }
        XCTAssertEqual(result[0].name, "직지심체요절")
    }
}
