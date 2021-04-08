//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by ysp on 2021/04/08.
//

import XCTest
@testable import Expo1900

class Expo1900Tests: XCTestCase {
    
    let jsonDecoder: JSONDecoder = JSONDecoder()

    func testExpositionError() {
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: "exposition_universelle_1900") else { XCTFail("파일을 불러올 수 없습니다."); return }
        guard let exposition = try? jsonDecoder.decode(Exposition.self, from: dataAsset.data) else { XCTFail(); return }
        XCTAssertEqual(exposition.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)", "title이 일치하지 않습니다.")
        XCTAssertEqual(exposition.visitors, 48130300, "visitors가 일치하지 않습니다.")
        XCTAssertEqual(exposition.location, "프랑스 파리", "location이 일치하지 않습니다.")
        XCTAssertEqual(exposition.duration, "1900. 04. 14 - 1900. 11. 12", "duration이 일치하지 않습니다.")
        XCTAssertNotNil(exposition.description, "description이 nil 입니다.")
    }
    
    func testItemsError() {
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: "items") else { XCTFail("파일을 불러올 수 없습니다."); return }
        guard let items = try? jsonDecoder.decode([Items].self, from: dataAsset.data) else { XCTFail(); return }
        
        for item in items {
            XCTAssertNotNil(item.name, "name이 nil 입니다.")
            XCTAssertNotNil(item.imageName, "imageName이 nil 입니다.")
            XCTAssertNotNil(item.shortDescription, "shortDescription이 nil 입니다.")
            XCTAssertNotNil(item.description, "description이 nil 입니다.")
        }
        
        XCTAssertEqual(items.first?.name, "직지심체요절", "name이 일치하지 않습니다.")
        XCTAssertEqual(items.first?.imageName, "jikji", "imageName이 일치하지 않습니다.")
        XCTAssertEqual(items.first?.shortDescription, "백운화상 경한(景閑)이 1372년에 초록한 불교 서적", "shortDescription이 일치하지 않습니다.")
    }
}
