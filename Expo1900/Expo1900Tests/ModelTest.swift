import XCTest
@testable import Expo1900

class ModelTest: XCTestCase {
    func test_Exposition_decode호출시_올바른값을가져오는지() throws {
        let result = try Exposition.decode(with: "exposition_universelle_1900")
        XCTAssertEqual(result.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
    }
    
    func test_Exposition_decode호출시_잘못된파일명을대입할시_assetLoadError가발생하는지() throws {
        XCTAssertThrowsError(try Exposition.decode(with: "이상한이름")) { error in
            XCTAssertEqual(error as? DataLoadError, DataLoadError.assetLoadError)
        }
    }
    
    func test_잘못된객체에서_decode호출시_dataLoadError에러가발생하는지() throws {
        XCTAssertThrowsError(try DummyForWrongType.decode(with: "exposition_universelle_1900")) { error in
            XCTAssertEqual(error as? DataLoadError, DataLoadError.dataLoadError)
        }
    }
}

// MARK: - Dummies
struct DummyForWrongType: Decodable {
    let title: Int // 원래는 String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}
