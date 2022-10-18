//
//  ItemTests.swift
//  ExpoExhibitTests
//
//  Created by 이정민 on 2022/10/18.
//

import XCTest
@testable import Expo1900

final class ItemTests: XCTestCase {
    let jsonName: String = "items"
    var sut: [Item]!
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }

    func test_when_parsing_expo_then_not_nil() {
        // given
        let jsonData = NSDataAsset(name: jsonName)?.data ?? Data()
        let decoder = JSONDecoder()
        
        // when
        do {
            let decodeValues = try decoder.decode([Item].self, from: jsonData)
            sut = decodeValues
        } catch {
            sut = nil
        }
        
        // then
        XCTAssertNotNil(sut)
    }

}
