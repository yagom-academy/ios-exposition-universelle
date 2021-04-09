//
//  JSONConverterTests.swift
//  Expo1900Tests
//
//  Created by 김찬우 on 2021/04/09.
//

import XCTest
@testable import Expo1900

class JSONConverterTest: XCTestCase {
    func test_extractData에_잘못된JSON파일이름을입력시_inputWrongAssetName을반환하는가() {
        XCTAssertThrowsError(try JSONConverter<Item>.extractData(assetName: "----")) { (error) in
            XCTAssertEqual(error as? JSONConverterError, JSONConverterError.inputWrongAssetName )
        }
    }
    
    func test_extractData에_올바른JSON파일이름을입력시_NSDataAsset타입을반환하는가() {
        XCTAssertNotNil(type(of: try JSONConverter<Item>.extractData(assetName: "items")))
    }
    
    func test_decodeAsset에_decode할수있는인자가_들어오지않는경우_isNotMaching을반환하는가() {
        XCTAssertThrowsError(try JSONConverter<Item>.decodeAsset(of: JSONConverter<Item>.extractData(assetName: "exposition_universelle_1900"))) { (error) in
            XCTAssertEqual(error as? JSONConverterError, JSONConverterError.isNotMaching)
        }
    }
    
    func test_duecodeAsset에_NSDataAsset타입의인자가_들어오는경우() {
        XCTAssertThrowsError(try JSONConverter<Item>.decodeAsset(of: JSONConverter<Item>.extractData(assetName: "items"))) { (error) in
            XCTAssertEqual(error as? JSONConverterError, JSONConverterError.isNotMaching)
        }
    
    }
}
