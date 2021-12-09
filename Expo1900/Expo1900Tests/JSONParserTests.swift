//
//  JSONParserTests.swift
//  JSONParserTests
//
//  Created by 예거 on 2021/12/07.
//

import XCTest
@testable import Expo1900

class JSONParserTests: XCTestCase {
    
    func test_존재하지않는_JSON이름으로_파싱하면_nil_반환되는지() {
        let jsonName = "not_Existing_JSON_name"

        let result = JSONParser<[KoreanEntry]>.decode(from: jsonName)
        
        XCTAssertNil(result)
    }
    
    func test_JSON데이터에_null값이존재해서_decoding_실패하면_nil_반환되는지() {
        let mockJSON = """
        {
            "name":"직지심체요절",
            "image_name":"jikji",
            "short_desc":"백운화상 경한(景閑)이 1372년에 초록한 불교 서적",
            "desc":null
        }
        """.data(using: .utf8)!
        
        let result = try? JSONDecoder().decode(KoreanEntry.self, from: mockJSON)
        
        XCTAssertNil(result)
    }
    
    func test_정의하지않은_키값이존재해서_decoding_실패하면_nil_반환되는지() {
        let mockJSON = """
        {
            "not_defined":"직지심체요절",
            "image_name":"jikji",
            "short_desc":"백운화상 경한(景閑)이 1372년에 초록한 불교 서적",
            "desc":null
        }
        """.data(using: .utf8)!
        
        let result = try? JSONDecoder().decode(KoreanEntry.self, from: mockJSON)
        
        XCTAssertNil(result)
    }
    
    func test_파리만국박람회정보_JSON데이터가_정상적으로_파싱되는지() {
        let expectedTitle = "파리 만국박람회 1900(L'Exposition de Paris 1900)"
        let expectedVisitors = 48130300
        
        let result = JSONParser<ParisExpoInformation>.decode(from: JSONFileName.parisExpoInformation)
        
        XCTAssertEqual(expectedTitle, result?.title)
        XCTAssertEqual(expectedVisitors, result?.visitors)
    }
    
    func test_한국출품작_첫번째_JSON데이터가_정상적으로_파싱되는지() {
        let expectedName = "직지심체요절"
        let expectedshortDesc = "백운화상 경한(景閑)이 1372년에 초록한 불교 서적"
        
        let result = JSONParser<[KoreanEntry]>.decode(from: JSONFileName.koreanEntry)
        
        XCTAssertEqual(expectedName, result![0].name)
        XCTAssertEqual(expectedshortDesc, result![0].shortDesc)
    }
    
    func test_한국출품작_마지막_JSON데이터가_정상적으로_파싱되는지() {
        let expectedName = "거문고"
        let expectedshortDesc = "고구려에서 유래된 한국의 전통 현악기"
        
        let result = JSONParser<[KoreanEntry]>.decode(from: JSONFileName.koreanEntry)
        let lastIndex = result!.count - 1
        
        XCTAssertEqual(expectedName, result![lastIndex].name)
        XCTAssertEqual(expectedshortDesc, result![lastIndex].shortDesc)
    }
}
