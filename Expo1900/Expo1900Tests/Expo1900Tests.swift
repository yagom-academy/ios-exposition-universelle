//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by seungwoo kim on 2021/04/06.
//

import XCTest
@testable import Expo1900

class Expo1900Tests: XCTestCase {
    
    var infos: [ExhibitedItem]!
    var jsonDecoder: JSONDecoder!
    var jsonData: NSDataAsset!
    
    override func setUpWithError() throws {
        infos = []
        jsonDecoder = JSONDecoder()
        jsonData = NSDataAsset(name: "items", bundle: Bundle(for: Expo1900Tests.self))
        infos = try? jsonDecoder.decode([ExhibitedItem].self, from: jsonData.data)
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        jsonDecoder = nil
        jsonData = nil
        try super.tearDownWithError()
    }

    func testExhibitInformationParsing() {
        XCTAssertEqual(infos.count, 13)
    }
}
