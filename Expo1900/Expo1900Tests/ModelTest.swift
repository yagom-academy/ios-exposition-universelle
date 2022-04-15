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
    
    func test_프로퍼티의타입이잘못된객체에서_decode호출시_typeMismatch에러가발생하는지() throws {
        do {
            _ = try DummyForWrongType.decode(with: "exposition_universelle_1900")
            XCTFail()
        } catch DecodingError.typeMismatch(let key, let value) {
            print(print("\n key: \(key) \n value: \(value) \n"))
        } catch {
            XCTFail()
        }
    }
    
    func test_프로퍼티의이름이잘못된객체에서_decode호출시_keyNotFound에러가발생하는지() throws {
        do {
            _ = try DummyWrongPropertyName.decode(with: "exposition_universelle_1900")
        } catch DecodingError.keyNotFound(let key, let value) {
            print("\n key: \(key) \n value: \(value) \n")
        } catch {
            XCTFail()
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

struct DummyWrongPropertyName: Decodable {
    let title: String
    let vis: String //원래는 visitors
    let location: String
    let duration: String
    let description: String
}
