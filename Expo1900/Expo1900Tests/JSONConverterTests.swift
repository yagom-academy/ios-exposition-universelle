//
//  JSONConverterTests.swift
//  Expo1900Tests
//
//  Created by 김찬우 on 2021/04/09.
//

import XCTest
@testable import Expo1900

class JSONConverterTest: XCTestCase {
    func test_parse에_잘못된JSON파일이름을입력시_inputWrongAssetName을반환하는가() {
        let sut = JSONConverter<[HeritageItem]>.parse(assetName: "----")
        
        XCTAssertEqual(sut, .failure(.inputWrongAssetName("----")))
    }
    
    func test_parse에_assetName을_잘못입력한경우_isNotMatching에러가_발생한다() {
        let sut = JSONConverter<[HeritageItem]>.parse(assetName: "exposition_universelle_1900")
        
        XCTAssertEqual(sut, .failure(.isNotMatchingType))
    }
    
    func test_parse에_assetName을_제대로입력한경우_nil이나오지않는다() {
        let sut = JSONConverter<[HeritageItem]>.parse(assetName: "items")
        
        XCTAssertNotNil(try sut.get())
    }
}
