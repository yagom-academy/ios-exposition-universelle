//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by 천수현 on 2021/04/06.
//

import XCTest
@testable import Expo1900
class Expo1900Tests: XCTestCase {
    
    func test_exposition_univereselle_1900() {
        guard let dataAsset = NSDataAsset.init(name: "exposition_universelle_1900") else {
            XCTFail("파일없음")
            return
        }
        
        do {
            let expo = try JSONDecoder().decode(ExpositionUnivereselle1900.self, from: dataAsset.data)
            XCTAssertNotNil(expo, "expo에 nil이 할당되었습니다.")
        } catch {
            XCTFail("디코딩 실패")
        }
    }
    
    func test_items_decoding() {
        guard let dataAsset = NSDataAsset.init(name: "items") else {
            XCTFail("파일없음")
            return
        }
        
        do {
            let items = try JSONDecoder().decode([KoreanItem].self, from: dataAsset.data)
            XCTAssertNotNil(items, "items에 nil이 할당되었습니다.")
        } catch {
            XCTFail("디코딩 실패")
        }
    }
}
