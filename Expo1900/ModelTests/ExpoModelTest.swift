//
//  ModelTests.swift
//  ModelTests
//
//  Created by 사파리, papri on 12/04/2022.
//

import XCTest
@testable import Expo1900

class ExpoModelTest: XCTestCase {

    func test_parsingJson_작동하는가() {
        //when
        let result = Expo.parsingJson(name: "exposition_universelle_1900")
        //then
        XCTAssertNotNil(result)
    }

}

