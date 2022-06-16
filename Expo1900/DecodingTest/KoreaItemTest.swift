//
//  KoreaItemsTest.swift
//  KoreaItemsTest
//
//  Created by Brad, Groot on 2022/06/14.
//

import XCTest
@testable import Expo1900

class KoreaItemTest: XCTestCase {
    var items: NSDataAsset!
    var jsonDecoder: JSONDecoder!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        items = NSDataAsset(name: "items")
        jsonDecoder = JSONDecoder()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        items = nil
        jsonDecoder = nil
    }
    
    func test_items파일의_name값이_디코딩되는지() {
        //given
        let itemInformation = try? jsonDecoder.decode([KoreaItem].self, from: items.data)
        
        //when
        let result = "직지심체요절"
        
        //then
        XCTAssertEqual(result, itemInformation?[0].name)
    }
}

