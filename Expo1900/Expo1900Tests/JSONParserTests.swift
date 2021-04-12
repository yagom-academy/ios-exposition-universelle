//
//  JSONParserTests.swift
//  Expo1900Tests
//
//  Created by duckbok on 2021/04/09.
//

import XCTest
@testable import Expo1900

class JSONParserTests: XCTestCase {
    
    func test_에셋카탈로그에_없는_JSON데이터_파일_이름이_들어오면_invalidAssetName_에러를_가진다() {
        let sut = JSONParser<Exposition>.parse("")
            
        XCTAssertEqual(sut, .failure(.invalidAssetName("")))
    }
    
    func test_에셋카탈로그에_있지만_타입의_프로퍼티와_다르면_dataCorrupted_에러를_가진다() {
        let sut = JSONParser<Exposition>.parse("items")
        
        XCTAssertEqual(sut, .failure(.dataCorrupted("items")))
    }
    
    func test_에셋카탈로그에_있고_단일타입의_프로퍼티와_일치하면_해당_인스턴스를_가진다() {
        let sut = JSONParser<Exposition>.parse("exposition_universelle_1900")
        
        XCTAssertNotNil(try sut.get())
    }
    
    func test_에셋카탈로그에_있지만_배열타입의_프로퍼티와_다르면_dataCorrupted_에러를_가진다() {
        let sut = JSONParser<[Entry]>.parse("exposition_universelle_1900")
        
        XCTAssertEqual(sut, .failure(.dataCorrupted("exposition_universelle_1900")))
    }
    
    func test_에셋카탈로그에_있고_배열타입의_프로퍼티와_일치하면_해당_인스턴스를_가진다() {
        let sut = JSONParser<[Entry]>.parse("items")
        
        XCTAssertNotNil(try sut.get())
    }
}
