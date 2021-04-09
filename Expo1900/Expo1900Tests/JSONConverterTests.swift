//
//  JSONConverterTests.swift
//  Expo1900Tests
//
//  Created by 김찬우 on 2021/04/09.
//

import XCTest
@testable import Expo1900

class JSONConverterTest: XCTestCase {
    func test_extractData에_잘못된JSON파일이름을입력시_nil을반환하는가() {
        XCTAssertNil(extractData(assetName: "----"))
    }
    
    func test_extractData에_올바른JSON파일이름을입력시_NSDataAsset타입을반환하는가() {
        XCTAssertNotNil(type(of: extractData(assetName: "items")))
    }
}
