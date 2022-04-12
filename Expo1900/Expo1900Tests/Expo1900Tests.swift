//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by 김동욱 on 2022/04/12.
//

import XCTest
@testable import Expo1900

class Expo1900Tests: XCTestCase {
    var sut: ExpositionPoster?
    
    override func setUpWithError() throws {
        sut = ExpositionPoster.parse()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_title_이올바르게_Decoding되었는지() {
        //given
        let title = "파리 만국박람회 1900(L'Exposition de Paris 1900)"
        
        //then
        XCTAssertEqual(sut?.title, title)
    }
    
    func test_visitors_이올바르게_Decoding되었는지() {
        //given
        let visitors = 48130300
        
        //then
        XCTAssertEqual(sut?.visitors, visitors)
    }
    
    func test_location_이올바르게_Decoding되었는지() {
        //given
        let location = "프랑스 파리"

        //then
        XCTAssertEqual(sut?.location, location)
    }
    
    func test_duration_이올바르게_Decoding되었는지() {
        //given
        let duration = "1900. 04. 14 - 1900. 11. 12"

        //then
        XCTAssertEqual(sut?.duration, duration)
    }
    
    func test_description_이올바르게_Decoding되었는지() {
        //given
        let descriptionFirst = "1900년"
        let descriptionLast = "갔습니다."
        
        //then
        XCTAssertTrue(sut!.description.hasPrefix(descriptionFirst))
        XCTAssertTrue(sut!.description.hasSuffix(descriptionLast))
    }
}
