import XCTest
@testable import Expo1900

class ModelTest: XCTestCase {
    
    func test_Exposition_decode호출시_올바른값을가져오는지() {
        let result = Exposition.decode(with: "exposition_universelle_1900")
        var title: String?
            switch result {
            case .success(let data):
                title = data.title
            default: break
            }
        
        XCTAssertEqual(title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
    }
    
    func test_Exposition_decode호출시_파일명이잘못되었을때_적절한에러를던지는지() {
        let result = Exposition.decode(with: "exposition_unifgh")
        var errorText: DataLoadError?
            switch result {
            case .failure(let error):
                errorText = error
            default: break
            }
        
        XCTAssertEqual(errorText, DataLoadError.assetLoadError)
    }
    
    func test_잘못된타입의_decode호출시_적절한에러를던지는지() {
        struct TestStruct: Decodable {
            var some: String
        }
        let result = TestStruct.decode(with: "exposition_universelle_1900")
        var errorText: DataLoadError?
            switch result {
            case .failure(let error):
                errorText = error
            default: break
            }
        
        XCTAssertEqual(errorText, DataLoadError.decodeError)
    }
}
