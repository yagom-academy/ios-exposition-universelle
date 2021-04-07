//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by seungwoo kim on 2021/04/06.
//

import XCTest
@testable import Expo1900

class Expo1900Tests: XCTestCase {
    
    var items: [ExhibitedItem]!
//    var info: ExhibitionInfomation!
    var jsonDecoder = JSONDecoder()
    var itemJsonData: NSDataAsset!
    var exhibitionJsonData: NSDataAsset!
    
    override func setUpWithError() throws {
        items = []
//        jsonDecoder = JSONDecoder()
        
        itemJsonData = NSDataAsset(name: "items", bundle: Bundle(for: Expo1900Tests.self))
        items = try? jsonDecoder.decode([ExhibitedItem].self, from: itemJsonData.data)
        
//        exhibitionJsonData = NSDataAsset(name: "exposition_universelle_1900", bundle: Bundle(for: Expo1900Tests.self))
//        info = try? jsonDecoder.decode(ExhibitionInfomation.self, from: exhibitionJsonData.data)
        print("setup")
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        items = nil
//        info = nil
//        jsonDecoder = nil
        itemJsonData = nil
        print("tearDown")
        try super.tearDownWithError()
    }

    func testExhibitedItemCount() {
        XCTAssertEqual(items.count, 13)
    }
    
    func testExhibitionInformation() {
        let exhibitionJsonData = NSDataAsset(name: "exposition_universelle_1900", bundle: Bundle(for: Expo1900Tests.self))
        
        do {
            let info = try jsonDecoder.decode(ExhibitionInfomation.self, from: exhibitionJsonData!.data)
            XCTAssertEqual(info.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
            XCTAssertEqual(info.visitors, 48130300)
            XCTAssertEqual(info.location, "프랑스 파리")
            XCTAssertEqual(info.duration, "1900. 04. 14 - 1900. 11. 12")
            XCTAssertNotNil(info.description)
            XCTAssertTrue(info.description.contains("1900년"))
        } catch {
            print("decode error")
        }
    }
}
