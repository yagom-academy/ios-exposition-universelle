//
//  Expo1900DecodingTests.swift
//  Expo1900DecodingTests
//
//  Created by YongHoon JJo on 2021/07/08.
//

import XCTest
@testable import Expo1900

class Expo1900DecodingTests: XCTestCase {
    func test_items_파일이_준비되어_JSONParser점parse메서드에_전달하여_첫번째_데이터의_name이_직지심체요절이다() throws {
        // given
        let testName = "items"
        
        // when
        guard let result = try? JSONParser.parse(name: testName, type: [ExpositionItem].self).get() else {
            return
        }
        let expectedResult = "직지심체요절"
        
        // then
        XCTAssertEqual(result[0].name, expectedResult)
    }
}
