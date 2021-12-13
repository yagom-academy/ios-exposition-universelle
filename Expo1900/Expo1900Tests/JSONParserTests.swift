//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by Hyoju Son on 2021/12/08.
//

import XCTest

class JSONParserTests: XCTestCase {
    func test_assetCatalog에_파일이_없는_경우_오류를_반환하는지() {
        let jsonParser = JSONParser<[ExpositionItem]>()
        
        XCTAssertThrowsError(try jsonParser.decode(fileName: "nonExist")) { error in
            XCTAssertEqual(error as? ParsingError, ParsingError.fileNotFound)
        }
    }

    func test_assetCatalog에_파일이_있는_경우_오류를_반환하지_않고_디코딩이_잘_되는지() {
        let jsonParser = JSONParser<[ExpositionItem]>()
        
        XCTAssertNoThrow(try jsonParser.decode(fileName: "items"))
        XCTAssertEqual(try jsonParser.decode(fileName: "items").first?.name, "직지심체요절")
    }
}
