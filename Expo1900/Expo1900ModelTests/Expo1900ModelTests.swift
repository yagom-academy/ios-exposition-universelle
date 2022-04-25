//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by 사파리,파프리 on 15/04/2022.
//

import XCTest
@testable import Expo1900

class Expo1900ModelTests: XCTestCase {

    func test_Heritage_Type_json데이터를파싱했을때_모델의데이터와json데이터의내용은동일해야한다() {
        //given
        let firstHeritageItemName = "직지심체요절"
        
        //when
        let heritageList = [Heritage].parsingJson(name: "items")
        let itemName = heritageList?[0].title
        
        //then
        XCTAssertEqual(itemName, firstHeritageItemName)
    }
    
    func test_Expo_Type_json데이터를파싱했을때_모델의데이터와json데이터의내용은동일해야한다() {
        //given
        let expoTitle = "파리 만국박람회 1900(L'Exposition de Paris 1900)"
        
        //when
        let title = Expo.parsingJson(name: "exposition_universelle_1900")?.title
        
        //then
        XCTAssertEqual(title, expoTitle)
    }
}
