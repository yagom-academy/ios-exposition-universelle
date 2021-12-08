//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by Hyoju Son on 2021/12/08.
//

import XCTest

class JSONParserTests: XCTestCase {
    func test_assetCatalog에_파일이_없는_경우_오류를_반환하는지() {
        XCTAssertThrowsError(try JSONParser<ExpositionItem>.decode(fileName: "nonExist")) { error in
            XCTAssertEqual(error as? ParsingError, ParsingError.fileNotFound)
        }
    }

    func test_assetCatalog에_파일이_있는_경우_오류를_반환하지_않는지() {
        XCTAssertNoThrow(try JSONParser<[ExpositionItem]>.decode(fileName: "items"))
    }
}
