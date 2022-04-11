import XCTest
@testable import Expo1900

class ModelTest: XCTestCase {
    var sut: Decoding!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Decoding()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_decoding() {
        let result = sut.decoding()
        XCTAssertEqual(result?.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
    }
}
