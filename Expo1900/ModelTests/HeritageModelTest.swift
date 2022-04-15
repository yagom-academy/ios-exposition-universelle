//
//  HeritageModelTest.swift
//  ModelTests
//
//  Created by 사파리, papri on 2022/04/12.
//

import XCTest
@testable import Expo1900

class Expo1900ModelTests: XCTestCase {
    
    func test_Heritage_Type_parsingJson_작동하는가() {
        //given
        let firstHeritageItemName = "직지심체요절"
        
        //when
        let heritageList = [Heritage].parsingJson(name: "items")
        let itemName = heritageList?[0].title
        
        //then
        XCTAssertEqual(itemName, firstHeritageItemName)
    }
}
