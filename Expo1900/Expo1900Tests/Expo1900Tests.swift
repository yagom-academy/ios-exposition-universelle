//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by seungwoo kim on 2021/04/06.
//

import XCTest
@testable import Expo1900

final class Expo1900Tests: XCTestCase {
    
    var jsonDecoder = JSONDecoder()
    
    func testExhibitedItemCount() {
        guard let itemJsonData = NSDataAsset(name: "items", bundle: Bundle(for: Expo1900Tests.self)) else { XCTFail(); return }
        
        guard let items = try? jsonDecoder.decode([ExhibitedItem].self, from: itemJsonData.data) else { XCTFail(); return }
        
        XCTAssertEqual(items.count, 13)
    }
    
    func testExhibitionInformation() {
        guard let exhibitionJsonData = NSDataAsset(name: "exposition_universelle_1900", bundle: Bundle(for: Expo1900Tests.self)) else { XCTFail(); return }
        
        guard let info = try? jsonDecoder.decode(ExhibitionInfomation.self, from: exhibitionJsonData.data) else { XCTFail(); return }
        
        XCTAssertEqual(info.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
        XCTAssertEqual(info.visitors, 48130300)
        XCTAssertEqual(info.location, "프랑스 파리")
        XCTAssertEqual(info.duration, "1900. 04. 14 - 1900. 11. 12")
        XCTAssertNotNil(info.description)
        XCTAssertTrue(info.description.contains("1900년"))
    }
}
