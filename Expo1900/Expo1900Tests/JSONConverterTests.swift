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
    
    func test_decodeAsset에_NSDataAsset타입의인자가_들어오지않는경우_nil을반환하는가() {
        XCTAssertNil(decodeAsset<Item>(of: extractData(assetName: "----")))
    }
    
    func test_duecodeAsset에_NSDataAsset타입의인자가_들어오는경우() {
        XCTAssertNotNil(decodeAsset<Item>(of: extractData(assetName: "items")))
    }
    
}
