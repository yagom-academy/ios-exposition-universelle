//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by malrang, cathy on 2022/04/12.
//

import XCTest
@testable import Expo1900

class ExpositionPosterTests: XCTestCase {
    var sut: ExpositionPoster?
    
    override func setUp() {
        sut = ExpositionPoster.parse(JsonFile.poster)
    }
    
    override func tearDown() {
        sut = nil
    }

    func test_data가_파리일때_sut의title의접두사가_data가같게된다() {
        //given
        let data = "파리"
        
        //when
        sut = ExpositionPoster.parse(JsonFile.poster)
        
        //then
        XCTAssertTrue(sut!.title!.hasPrefix(data))
    }
    
    func test_data가_48130300일때_sut의visitors가_data와같게된다() {
        //given
        let data = 48130300
        
        //when
        sut = ExpositionPoster.parse(JsonFile.poster)
        
        //then
        XCTAssertEqual(sut?.visitors, data)
    }
    
    func test_data가_프랑스파리일때_sut의poster가_data와같게된다() {
        //given
        let data = "프랑스 파리"
        
        //when
        sut = ExpositionPoster.parse(JsonFile.poster)

        //then
        XCTAssertEqual(sut?.location, data)
    }
    
    func test_data가_1900일때_sut의duration의접두사가_data와같게된다() {
        //given
        let data = "1900"
        
        //when
        sut = ExpositionPoster.parse(JsonFile.poster)

        //then
        XCTAssertTrue(sut!.duration!.hasPrefix(data))
    }
    
    func test_data가_1900년일때_sut의description의접두사가_data와같게된다() {
        //given
        let data = "1900년"
        
        //when
        sut = ExpositionPoster.parse(JsonFile.poster)
        
        //then
        XCTAssertTrue(sut!.description!.hasPrefix(data))
    }
}
