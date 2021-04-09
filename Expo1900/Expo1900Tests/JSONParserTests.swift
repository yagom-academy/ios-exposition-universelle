//
//  JSONParserTests.swift
//  Expo1900Tests
//
//  Created by duckbok on 2021/04/09.
//

import XCTest
@testable import Expo1900

class JSONParserTests: XCTestCase {
    func test_에셋카탈로그에_없는_JSON데이터_파일_이름이_들어오면_nil을_반환한다() {
        XCTAssertNil(JSONParser.extractData(by: ""))
    }
    
    func test_에셋카탈로그에_있는_JSON데이터_파일_이름이_들어오면_NSDataAsset을_반환한다() {
        XCTAssertNotNil(JSONParser.extractData(by: "exposition_universelle_1900"))
    }
}
