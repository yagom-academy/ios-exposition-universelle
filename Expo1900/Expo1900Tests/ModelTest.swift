import XCTest
@testable import Expo1900

class ModelTest: XCTestCase {
    
    func test_exposition_decoding() {
        guard let result = Exposition.decode(assetName: "exposition_universelle_1900") as? Exposition else { return }
        XCTAssertEqual(result.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
    }
    
    func test_item_decoding() {
        guard let result = Item.decode(assetName: "items") as? [Item] else { return }
        XCTAssertEqual(result[0].name, "직지심체요절")
    }
    
    func test_item_decod21ing() {
        guard let result = Item.decode(assetName: "items") as? [Item] else { return }
        XCTAssertEqual(result[0].imageName, "jikji")
    }
}
