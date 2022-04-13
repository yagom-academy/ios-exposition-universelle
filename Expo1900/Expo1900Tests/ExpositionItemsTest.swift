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
    
    override func setUp() {
        sut = [ExpositionItems]()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_data가_직지심체요절일때_sut의첫번째name이_data와같게된다() {
        //given
        let data = "직지심체요절"
        
        //when
        sut = [ExpositionItems].parse(JsonFile.items)
        
        //then
        XCTAssertEqual(sut?.first?.name, data)
    }
    
    func test_data가_jikji일때_sut의첫번째imageName이_data와같게된다() {
        //given
        let data = "jikji"
        
        //when
        sut = [ExpositionItems].parse(JsonFile.items)
        
        //then
        XCTAssertEqual(sut?.first?.imageName, data)
    }
    
    func test_data가_백운화상일때_sut의첫번째shortDescription의접두사가_data와같게된다() {
        //given
        let data = "백운화상"
        
        //when
        sut = [ExpositionItems].parse(JsonFile.items)
        
        //then
        XCTAssertTrue(sut!.first!.shortDescription!.hasPrefix(data))
    }
    
    func test_data와_sut의첫번째description의접두사가_같게된다() {
        //given
        let data = "《'백운화상"
        
        //when
        sut = [ExpositionItems].parse(JsonFile.items)

        //then
        XCTAssertTrue(sut!.first!.description!.hasPrefix(data))
    }
}
