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
        XCTAssertNil(JSONParser<Exposition>.extractData(from: ""))
    }
    
    func test_에셋카탈로그에_있는_JSON데이터_파일_이름이_들어오면_NSDataAsset을_반환한다() {
        XCTAssertNotNil(JSONParser<Exposition>.extractData(from: "items"))
    }
    
    func test_NSDataAsset이_단일타입의_프로퍼티와_다르면_nil을_반환한다() {
        guard let dataAsset = JSONParser<Exposition>.extractData(from: "items") else { return }
        
        XCTAssertNil(JSONParser<Exposition>.convert(from: dataAsset))
    }
    
    func test_NSDataAsset이_단일타입의_프로퍼티와_일치하면_해당_인스턴스를_반환한다() {
        guard let dataAsset = JSONParser<Exposition>.extractData(from: "exposition_universelle_1900") else { return }
        
        XCTAssertNotNil(JSONParser<Exposition>.convert(from: dataAsset))
    }
    
    func test_NSDataAsset이_배열타입의_프로퍼티와_다르면_nil을_반환한다() {
        guard let dataAsset = JSONParser<[Entry]>.extractData(from: "exposition_universelle_1900") else { return }
        
        XCTAssertNil(JSONParser<[Entry]>.convert(from: dataAsset))
    }
    
    func test_NSDataAsset이_배열타입의_프로퍼티와_일치하면_해당_인스턴스를_반환한다() {
        guard let dataAsset = JSONParser<[Entry]>.extractData(from: "items") else { return }
        
        XCTAssertNotNil(JSONParser<[Entry]>.convert(from: dataAsset))
    }
    
    func test_JSON데이터_파일이름과_주어진_타입이_다르면_parse를_실패한다() {
        XCTAssertNil(JSONParser<[Entry]>.parse("exposition_universelle_1900"))
    }
    
    func test_JSON데이터_파일이름과_주어진_타입이_같으면_parse를_성공한다() {
        XCTAssertNotNil(JSONParser<[Entry]>.parse("items"))
    }
}
