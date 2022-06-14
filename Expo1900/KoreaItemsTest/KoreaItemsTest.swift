//
//  KoreaItemsTest.swift
//  KoreaItemsTest
//
//  Created by Brad, Groot on 2022/06/14.
//

import XCTest
@testable import Expo1900

class KoreaItemsTest: XCTestCase {
    var items: NSDataAsset!
    var jsonDecoder: JSONDecoder!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        items = NSDataAsset.init(name: "items")
        jsonDecoder = JSONDecoder()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        items = nil
        jsonDecoder = nil
    }
    
    func test_items파일의_name값이_디코딩되는지() {
        //given
        let itemInformation = try? jsonDecoder.decode([KoreaItems].self, from: items.data)
        
        //when
        let result = "직지심체요절"
        
        //then
        XCTAssertEqual(result, itemInformation![0].getName())
    }
    
    func test_items파일의_imageName값이_디코딩되는지() {
        //given
        let itemInformation = try? jsonDecoder.decode([KoreaItems].self, from: items.data)
        
        //when
        let result = "jikji"
        
        //then
        XCTAssertEqual(result, itemInformation![0].getImageName())
    }
    
    func test_items파일의_imageName값이_Image변환이되는지() {
        //given
        let itemInformation = try? jsonDecoder.decode([KoreaItems].self, from: items.data)
        
        //when
        let result = UIImage(named: "jikji")
        
        //then
        XCTAssertEqual(result, itemInformation![0].getImage())
    }
    
    func test_items파일의_shortDesc값이_디코딩되는지() {
        //given
        let itemInformation = try? jsonDecoder.decode([KoreaItems].self, from: items.data)
        
        //when
        let result = "백운화상 경한(景閑)이 1372년에 초록한 불교 서적"
        
        //then
        XCTAssertEqual(result, itemInformation![0].getShortDesc())
    }
    
    func test_items파일의_desc값이_디코딩되는지() {
        //given
        let itemInformation = try? jsonDecoder.decode([KoreaItems].self, from: items.data)
        
        //when
        let result = "《'백운화상초록불조"
        
        //then
        XCTAssertEqual(result, itemInformation![0].getDesc().prefix(10).description)
    }
}

