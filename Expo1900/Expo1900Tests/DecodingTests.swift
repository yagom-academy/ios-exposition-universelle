import XCTest

@testable import Expo1900

class DecodingTests: XCTestCase {

    let jsonDecoder = JSONDecoder()

    func test_Exposition의_visitors가_48130300인지() {
        guard let data = NSDataAsset(name: "exposition_universelle_1900") else {
            XCTAssert(false)
            return
        }
        
        do {
            let exposition = try jsonDecoder.decode(Exposition.self, from: data.data)
            
            XCTAssertEqual(exposition.visitors, 48130300)
        } catch {
            XCTAssert(false)
        }
    }
    
    func test_첫번째Entry의_description이_일치하는지() {
        guard let data = NSDataAsset(name: "items") else {
            XCTAssert(false)
            return
        }
        
        do {
            let entries = try jsonDecoder.decode([Entry].self, from: data.data)
            
            XCTAssertEqual(entries[0].short_desc, "백운화상 경한(景閑)이 1372년에 초록한 불교 서적")
        } catch {
            XCTAssert(false)
        }
    }
}
