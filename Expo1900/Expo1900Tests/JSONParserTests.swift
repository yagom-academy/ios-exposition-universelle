//
//  JSONParserTests.swift
//  JSONParserTests
//
//  Created by 예거 on 2021/12/07.
//

import XCTest
@testable import Expo1900

class JSONParserTests: XCTestCase {
    
    func test_파리만국박람회정보_JSON데이터가_정상적으로_파싱되는지() {
        let jsonName = "exposition_universelle_1900"
        let expectedTitle = "파리 만국박람회 1900(L'Exposition de Paris 1900)"
        let expectedVisitors = 48130300
        
        let result = JSONParser<ParisExpoInformation>.decode(from: jsonName)
        
        XCTAssertEqual(expectedTitle, result?.title)
        XCTAssertEqual(expectedVisitors, result?.visitors)
    }
    
    func test_한국출품작_첫번째_JSON데이터가_정상적으로_파싱되는지() {
        let jsonName = "items"
        let expectedName = "직지심체요절"
        let expectedshortDesc = "백운화상 경한(景閑)이 1372년에 초록한 불교 서적"
        
        let result = JSONParser<[KoreanEntry]>.decode(from: jsonName)
        
        XCTAssertEqual(expectedName, result![0].name)
        XCTAssertEqual(expectedshortDesc, result![0].shortDesc)
    }
    
    func test_한국출품작_마지막_JSON데이터가_정상적으로_파싱되는지() {
        let jsonName = "items"
        let expectedName = "거문고"
        let expectedshortDesc = "고구려에서 유래된 한국의 전통 현악기"
        
        let result = JSONParser<[KoreanEntry]>.decode(from: jsonName)
        let lastIndex = result!.count - 1
        
        XCTAssertEqual(expectedName, result![lastIndex].name)
        XCTAssertEqual(expectedshortDesc, result![lastIndex].shortDesc)
    }
}
