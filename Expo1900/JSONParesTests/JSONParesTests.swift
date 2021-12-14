import XCTest

class JSONParesTests: XCTestCase {
    func test_Decode_파리만국박람회() {
        let parsing = JSONParse<Exposition>.decode(fileName: FileName.exposition)
        let result: Exposition? = try? parsing.get()
        
        XCTAssertEqual(result?.visitors, 48130300)
        XCTAssertEqual(result?.location, "프랑스 파리")
        XCTAssertTrue(result!.title.contains("파리 만국박람회"))
        XCTAssertTrue(result!.description.contains("도래를 환영하고"))
    }
    
    func test_Decode_아이템() {
        let parsing = JSONParse<[ExpositionItem]>.decode(fileName: FileName.items)
        let result: [ExpositionItem]? = try? parsing.get()

        XCTAssertEqual(result?.count, 13)
        XCTAssertTrue(result![0].name.contains("직지"))
        XCTAssertTrue(result![1].name.contains("불경"))
        XCTAssertTrue(result![2].name.contains("팔만"))
    }
}
