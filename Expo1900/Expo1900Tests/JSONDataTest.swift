//
//  JSONDataTest.swift
//  Expo1900Tests
//
//  Created by 김찬우 on 2021/04/14.
//

import XCTest
@testable import Expo1900

class JSONDataTest: XCTestCase {

    func test_commaMaker에_숫자를입력하면_세자리마다반점이_찍히는가() {
        XCTAssertEqual(commaMaker(value: 1234567), "1,234,567")
    }
    
    func test_insertNewLine에서_문자열입력시_소괄호에서_줄바꿈이되는가() {
        XCTAssertEqual(insertNewLine(by: "(", into: "안녕(Hello)"),
                       """
            안녕
            (Hello)
            """)
    }

}
