//
//  ExhibitionItemTests.swift
//  Expo1900Tests
//
//  Created by mmim, Minseong.
//

import XCTest
@testable import Expo1900

class ExhibitionItemTests: XCTestCase {
    private var sut: [ExhibitionItem]!
    
    override func setUpWithError() throws {
        guard let asset = NSDataAsset(name: "items") else {
            return
        }
        
        self.sut = try? JSONDecoder().decode([ExhibitionItem].self, from: asset.data)
    }

    override func tearDownWithError() throws {
        self.sut = nil
    }
    
    func test_items_JSON데이터에서_decode된_첫번째객체의_name값이_올바른가() {
        //given
        let name = "직지심체요절"
        //when
        let firstName = sut[0].name
        //then
        XCTAssertEqual(firstName, name)
    }
    
    func test_items_JSON데이터에서_decode된_객체의_수가_올바른가() {
        //given
        let jsonCount = 13
        //when
        let decodingCount = sut.count
        //then
        XCTAssertEqual(decodingCount, jsonCount)
    }
}
