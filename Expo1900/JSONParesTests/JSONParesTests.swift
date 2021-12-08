import XCTest

class JSONParesTests: XCTestCase {
    func test_Decode_파리만국박람회() {
        let exposition = JSONParse<Exposition>.decode(fileName: "exposition_universelle_1900")
        
        XCTAssertEqual(exposition?.visitors, 48130300)
        XCTAssertEqual(exposition?.location, "프랑스 파리")
        XCTAssertTrue(exposition!.title.contains("파리 만국박람회"))
        XCTAssertTrue(exposition!.description.contains("도래를 환영하고"))
    }
    
    func test_Decode_아이템() {
        let expositionItem = JSONParse<[ExpositionItem]>.decode(fileName: "items")
        
        XCTAssertEqual(expositionItem!.count, 13)
        XCTAssertTrue(expositionItem![0].name.contains("직지"))
        XCTAssertTrue(expositionItem![1].name.contains("불경"))
        XCTAssertTrue(expositionItem![2].name.contains("팔만"))
    }
}
