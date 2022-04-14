import XCTest
@testable import Expo1900

class ModelTest: XCTestCase {
    
    func test_Exposition_decode호출시_올바른값을가져오는지() throws {
        let result = try Exposition.decode(with: "exposition_universelle_1900")
            XCTAssertEqual(result.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
    }
}
