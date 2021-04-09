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
        XCTAssertNil(JSONParser<Exposition>.extractData(by: ""))
    }
    
    func test_에셋카탈로그에_있는_JSON데이터_파일_이름이_들어오면_NSDataAsset을_반환한다() {
        XCTAssertNotNil(JSONParser<Exposition>.extractData(by: "items"))
    }
    
    func test_NSDataAsset이_단일타입의_프로퍼티와_다르면_nil을_반환한다() {
        guard let dataAsset = JSONParser<Exposition>.extractData(by: "items") else { return }
        
        XCTAssertNil(JSONParser<Exposition>.convert(by: dataAsset))
    }
    
    func test_NSDataAsset이_단일타입의_프로퍼티와_일치하면_해당_인스턴스를_반환한다() {
        guard let dataAsset = JSONParser<Exposition>.extractData(by: "exposition_universelle_1900") else { return }
        
        XCTAssertNotNil(JSONParser<Exposition>.convert(by: dataAsset))
    }
    
    func test_NSDataAsset이_배열타입의_프로퍼티와_다르면_nil을_반환한다() {
        guard let dataAsset = JSONParser<[Item]>.extractData(by: "exposition_universelle_1900") else { return }
        
        XCTAssertNil(JSONParser<[Item]>.convert(by: dataAsset))
    }
    
    func test_NSDataAsset이_배열타입의_프로퍼티와_일치하면_해당_인스턴스를_반환한다() {
        guard let dataAsset = JSONParser<[Item]>.extractData(by: "items") else { return }
        
        XCTAssertNotNil(JSONParser<[Item]>.convert(by: dataAsset))
    }
}
