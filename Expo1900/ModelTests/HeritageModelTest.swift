//
//  HeritageModelTest.swift
//  ModelTests
//
//  Created by 이시원 on 2022/04/12.
//

import XCTest
@testable import Expo1900

class HeritageModelTest: XCTestCase {

    func test_parsingJson_작동하는가() {
        //when
        let result = [Heritage].parsingJson(name: "items")
        //then
        XCTAssertNotNil(result)
    }
}
