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
    
    func test_유니버셜1900_JSON데이터를_가지고온_후에_InternationalExposition_객체를생성하여_title을_출력하면_한국박람회는_아니다() {
        //given
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: "exposition_universelle_1900") else {
          return
        }
        
        //when
        let paris = try? decoder.decode(InternationalExposition.self, from: dataAsset.data)
        let result = paris?.title
        let expectResult = "한국박람회"
        
        //then
        XCTAssertNotEqual(result, expectResult)
    }
    
    func test_itmes_JSON데이터를_가지고온_후에_KoreaExposition_객체를생성하여_첫작품의_name을_출력하면_직지심체요절는_아니다() {
        //given
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: "items") else {
          return
        }
        
        //when
        let koreaExpositions = try? decoder.decode([KoreaExposition].self, from: dataAsset.data)
        let result = koreaExpositions?.last?.name
        let expectResult = "직지심체요절"
        
        //then
        XCTAssertNotEqual(result, expectResult)
    }
    
    func test_유니버셜1900_JSON데이터를_가지고온_후에_InternationalExposition_객체를생성하여_title을_출력하면_파리만국박람회_1900이_나온다() {
        //given
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: "exposition_universelle_1900") else {
          return
        }
        
        //when
        let paris = try? decoder.decode(InternationalExposition.self, from: dataAsset.data)
        let result = paris?.title
        let expectResult = "파리 만국박람회 1900(L\'Exposition de Paris 1900)"
        
        //then
        XCTAssertEqual(result, expectResult)
    }
    
    func test_itmes_JSON데이터를_가지고온_후에_KoreaExposition_객체를생성하여_첫작품의_name을_출력하면_뭐가_나온다() {
        //givien
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
