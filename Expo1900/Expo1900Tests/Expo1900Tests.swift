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
    var info: ExhibitionInfomation!
    var jsonDecoder: JSONDecoder!
    var itemJsonData: NSDataAsset!
    var exhibitionJsonData: NSDataAsset!
    
    override func setUpWithError() throws {
        items = []
        jsonDecoder = JSONDecoder()
        
        itemJsonData = NSDataAsset(name: "items", bundle: Bundle(for: Expo1900Tests.self))
        items = try? jsonDecoder.decode([ExhibitedItem].self, from: itemJsonData.data)
        
        exhibitionJsonData = NSDataAsset(name: "exposition_universelle_1900", bundle: Bundle(for: Expo1900Tests.self))
        info = try? jsonDecoder.decode(ExhibitionInfomation.self, from: exhibitionJsonData.data)
        
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        items = nil
        info = nil
        jsonDecoder = nil
        itemJsonData = nil
        try super.tearDownWithError()
    }

    func testExhibitedItemCount() {
        XCTAssertEqual(items.count, 13)
    }
    
    func testExhibitiontitle() {
        XCTAssertEqual(info.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
    }
}
