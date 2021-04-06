//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by 천수현 on 2021/04/06.
//

import XCTest
@testable import Expo1900
class Expo1900Tests: XCTestCase {
    
    var decoder = JSONDecoder()
    var items = [Item]()
    var contents = [Content]()
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func test_items_decoding() {
        guard let dataAsset = NSDataAsset.init(name: "items") else {
            XCTFail("파일없음")
            return
        }
        do {
            items = try decoder.decode([Item].self, from: dataAsset.data)
        } catch {
            XCTFail("실패")
        }
    }
}
