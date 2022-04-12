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
    
    func test_Exposition타입으로JSON파싱이되었는지() {
        // given
        guard let asset = NSDataAsset.init(name: "exposition_universelle_1900") else { return }
        
        // when
        let decodedData = try? decoder?.decode(Exposition.self, from: asset.data)
        
        // then
        XCTAssertEqual(decodedData?.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
    }
    
}
