//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by 천수현 on 2021/04/06.
//

import XCTest
@testable import Expo1900
class Expo1900Tests: XCTestCase {
    
    var decoder: JSONDecoder?
    var items: [Item]?
    var expo: ExpositionUnivereselle1900?
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func test_exposition_univereselle_1900() {
        guard let dataAsset = NSDataAsset.init(name: "exposition_universelle_1900") else {
            XCTFail("파일없음")
            return
        }
        
        do {
            expo = try decoder?.decode(ExpositionUnivereselle1900.self, from: dataAsset.data)
        } catch {
            XCTFail("실패")
        }
        
    }
    
    func test_items_decoding() {
        guard let dataAsset = NSDataAsset.init(name: "items") else {
            XCTFail("파일없음")
            return
        }
        
        do {
            items = try decoder?.decode([Item].self, from: dataAsset.data)
        } catch {
            XCTFail("실패")
        }
    }
}
