//
//  ExpoExhibitTests.swift
//  ExpoExhibitTests
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.

import XCTest
@testable import Expo1900

final class ExpositionTests: XCTestCase {
    let jsonName: String = "exposition_universelle_1900"
    var sut: Exposition!
    
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
            let decodeValues = try decoder.decode(Exposition.self, from: jsonData)
            sut = decodeValues
        } catch {
            sut = nil
        }
        
        // then - nil이 아닌지
        XCTAssertNotNil(sut)
    }
}
