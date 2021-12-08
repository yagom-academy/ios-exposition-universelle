import XCTest
@testable import Expo1900

class ParsingTests: XCTestCase {
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testParsingExpoInfo() {
        guard let expo1900 = NSDataAsset(name: "exposition_universelle_1900", bundle: .main)?.data else {
            XCTFail()
            return
        }
        let decoder = JSONDecoder()
        XCTAssertNoThrow(try decoder.decode(ExpoInfo.self, from: expo1900))
    }
    
    func testParsingItems() {
        guard let items = NSDataAsset(name: "items", bundle: .main)?.data else {
            XCTFail()
            return
        }
        let decoder = JSONDecoder()
        XCTAssertNoThrow(try decoder.decode([ItemInfo].self, from: items))
    }
}
