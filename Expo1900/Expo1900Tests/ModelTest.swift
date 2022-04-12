import XCTest
@testable import Expo1900

class ModelTest: XCTestCase {
    
    func test_Exposition_decode호출시_올바른값을가져오는지() {
        guard let result = Exposition.decode(with: "exposition_universelle_1900") as? Exposition else {
            XCTFail("decode 실패함")
            return }

        XCTAssertEqual(result.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
    }
    
    func test_Item_decode호출시_올바른값을가져오는지() {
        guard let result = Item.decode(with: "items") as? [Item] else {
            XCTFail("decode 실패함")
            return }
            
        XCTAssertEqual(result[0].name, "직지심체요절")
    }
}
