//
//  ExpositionItemsTests.swift
//  ExpositionItemsTests
//
//  Created by malrang, cathy on 2022/04/12.
//

import XCTest
@testable import Expo1900

class ExpositionItemsTests: XCTestCase {
    var sut: [ExpositionItems]?

    override func setUpWithError() throws {
        sut = ExpositionItems.parse()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_itemName_이올바르게_Decoding되었는지() {
        //given
        let itemName = "직지심체요절"
        
        //then
        XCTAssertEqual(sut?.first?.name, itemName)
    }
    
    func test_itemImageName_이올바르게_Decoding되었는지() {
        //given
        let itemImageName = "jikji"
        
        //then
        XCTAssertEqual(sut?.first?.imageName, itemImageName)
    }
    
    func test_shortDescription_이올바르게_Decoding되었는지() {
        //given
        let shortDescription = "백운화상 경한(景閑)이 1372년에 초록한 불교 서적"
        
        //then
        XCTAssertEqual(sut?.first?.shortDescription, shortDescription)
    }
    
    func test_itemDescription_이올바르게_Decoding되었는지() {
        //given
        let itemDescription = "《'백운화상초록불조직지심체요절》(白雲和尙抄錄佛祖直指心體要節)은"
        
        //then
        XCTAssertTrue(sut!.first!.description.hasPrefix(itemDescription))
    }
}
