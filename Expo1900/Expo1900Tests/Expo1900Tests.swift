//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by WANKI KIM on 2021/07/08.
//

import XCTest

@testable import Expo1900
class Expo1900Tests: XCTestCase {
    var jsonDecoder: JSONDecoder?
    
    override func setUp() {
        jsonDecoder = JSONDecoder()
    }

    func test_exposition_universelle_1900을_디코딩을_성공한다() {
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        let expositionInformation = try? jsonDecoder?.decode(ExpositionInformation.self, from: dataAsset.data)
        XCTAssertNotNil(expositionInformation, "exposition_universelle_1900 디코딩 성공!")
    }
    
    func test_items을_디코딩을_성공한다() {
        guard let dataAsset = NSDataAsset(name: "items") else { return }
        
        let exhibitionItem = try? jsonDecoder?.decode([ExhibitionItem].self, from: dataAsset.data)
        XCTAssertNotNil(exhibitionItem, "items 디코딩 성공!")
    }
    
    func test_에셋_파일명이_잘못되어_디코딩을_실패한다() {
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_190") else {
            XCTFail("파일이 없습니다.")
            return
        }
        
        let expositionInformation = try? jsonDecoder?.decode(ExpositionInformation.self, from: dataAsset.data)
        XCTAssertNil(expositionInformation, "exposition_universelle_1900 디코딩 실패!")
    }
    
    func test_디코딩_타입이_잘못되어_디코딩을_실패한다() {
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            XCTFail("파일이 없습니다.")
            return
        }
        
        let expositionInformation = try? jsonDecoder?.decode(ExhibitionItem.self, from: dataA sset.data)
        XCTAssertNotNil(expositionInformation, "디코딩 실패!")
    }
}

