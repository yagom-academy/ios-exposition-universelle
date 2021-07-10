//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by Kim Do hyung on 2021/07/06.
//

import XCTest
@testable import Expo1900

class Expo1900Tests: XCTestCase {
    let decoder = JSONDecoder()
    
    func test_JSONData_exposition_universelle_1900_titleShouldHaveValue() {
        //given
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: "exposition_universelle_1900") else {
          return
        }
        
        //when
        let internationalExpositionData = try? decoder.decode(InternationalExposition.self, from: dataAsset.data)
        let result = internationalExpositionData?.title
        let expectResult = "파리 만국박람회 1900(L\'Exposition de Paris 1900)"
        
        //then
        XCTAssertEqual(result, expectResult)
    }
    
    func test_JSONData_items_nameShouldHaveValue() {
        //given
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: "items") else {
          return
        }
        
        //when
        let koreaExpositions = try? decoder.decode([KoreaExposition].self, from: dataAsset.data)
        let result = koreaExpositions?.last?.name
        let expectResult = "거문고"
        
        //then
        XCTAssertEqual(result, expectResult)
    }
}

