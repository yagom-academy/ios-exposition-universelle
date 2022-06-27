//
//  ParsingTests.swift
//  ParsingTests
//
//  Created by bard, unchain on 2022/06/15.
//

import XCTest
@testable import Expo1900
class ParsingTests: XCTestCase {
    func test_JSON데이터파일의이름이잘못되었을때_nil값을반환하는지() {
        //given
        let result = NSDataAsset(name: "item")?.data
        
        //when
        
        //then
        XCTAssertNil(result)
    }
    
    func test_JSON데이터를_잘불러오는지() {
        //given
        guard let data = NSDataAsset(name: "items")?.data else { return }
        guard let decodedData = try? JSONDecoder().decode([EntryList].self, from: data) else { return }
        
        //when
        let result = "jikji"
        
        //then
        XCTAssertEqual(result, decodedData.first?.imageName)
    }
}
