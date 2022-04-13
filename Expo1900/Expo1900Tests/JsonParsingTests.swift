import XCTest
@testable import Expo1900

final class JsonParsingTests: XCTestCase {
    private var decoder: JSONDecoder?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.decoder = JSONDecoder()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        self.decoder = nil
    }
    
    func test_Exposition타입_모델으로_파싱이_되었는지() {
        // given
        guard let asset = NSDataAsset(name: "exposition_universelle_1900") else {
            XCTFail("File Not Found.")
            return
        }
        
        // when
        do {
            let decodedData = try decoder?.decode(Exposition.self, from: asset.data)
            
            // then
            XCTAssertEqual(decodedData?.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
        } catch {
          XCTFail("Decode Failure.")
        }
    }
    
    func test_Entry타입_모델에서_CodingKey로_변환한_변수명으로_파싱이_되는지() {
        // given
        guard let asset = NSDataAsset(name: "items") else {
            XCTFail("File Not Found.")
            return
        }
        
        // when
        do {
            let decodedData = try? decoder?.decode([Entry].self, from: asset.data)
            
            // then
            XCTAssertEqual(decodedData?[0].imageName, "jikji")
        } catch {
          XCTFail("Decode Failure.")
        }
    }
}
