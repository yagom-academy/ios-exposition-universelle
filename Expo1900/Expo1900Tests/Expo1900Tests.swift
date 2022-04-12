//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by mmim, Minseong.
//

import XCTest
@testable import Expo1900

class Expo1900Tests: XCTestCase {
    private var sut: ExpositionUniverselle?
    
    override func setUpWithError() throws {
        guard let asset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        self.sut = try? JSONDecoder().decode(ExpositionUniverselle.self, from: asset.data)
    }

    override func tearDownWithError() throws {
        self.sut = nil
    }
    
    func test_decode_JSON데이터의_title값이_올바른가() {
        //given
        let title = "파리 만국박람회 1900(L'Exposition de Paris 1900)"
        //when
        //then
        XCTAssertEqual(sut?.title, title)
    }
    
    func test_decode_JSON데이터의_visitors값이_올바른가() {
        //given
        let visitors = 48130300
        //when
        //then
        XCTAssertEqual(sut?.visitors, visitors)
    }
    
    func test_decode_JSON데이터의_location값이_올바른가() {
        //given
        let location = "프랑스 파리"
        //when
        //then
        XCTAssertEqual(sut?.location, location)
    }
    
    func test_decode_JSON데이터의_duration값이_올바른가() {
        //given
        let duration = "1900. 04. 14 - 1900. 11. 12"
        //when
        //then
        XCTAssertEqual(sut?.duration, duration)
    }
}
