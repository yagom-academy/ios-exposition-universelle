//
//  ItemTests.swift
//  ItemTests
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.

import XCTest
@testable import Expo1900

final class ItemTests: XCTestCase {
    let jsonName: String = "items"
    var sut: [Entity]!
    
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
            let decodeValues = try decoder.decode([Entity].self, from: jsonData)
            sut = decodeValues
        } catch {
            sut = nil
        }
        
        // then
        XCTAssertNotNil(sut)
    }

}
