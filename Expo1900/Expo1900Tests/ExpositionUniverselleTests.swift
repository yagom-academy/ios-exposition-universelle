//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by mmim, Minseong.
//

import XCTest
@testable import Expo1900

class ExpositionUniverselleTests: XCTestCase {
    private var sut: ExpositionUniverselle!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.sut = try? ExpositionUniverselle.decode(from: "exposition_universelle_1900").get()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        self.sut = nil
    }
    
    func test_decode_파일이_존재하지않을때_예상된_에러인가() {
        //given
        let expected: DecodingError = .fileNameNotFound
        let fakeFileName = "exposition_universelle_190"
        // when
        // then
        XCTAssertThrowsError(try ExpositionUniverselle.decode(from: fakeFileName).get()) { error in
            XCTAssertEqual(error as? DecodingError, expected)
        }
    }
    
    func test_decode_JSON데이터의_title값이_올바른가() {
        //given
        let title = "파리 만국박람회 1900(L'Exposition de Paris 1900)"
        //when
        let result = sut.title
        //then
        XCTAssertEqual(title, result)
    }
    
    func test_decode_JSON데이터의_visitors값이_올바른가() {
        //given
        let visitors = 48130300
        //when
        let result = sut.visitors
        //then
        XCTAssertEqual(visitors, result)
    }
    
    func test_decode_JSON데이터의_location값이_올바른가() {
        //given
        let location = "프랑스 파리"
        //when
        let result = sut.location
        //then
        XCTAssertEqual(location, result)
    }
    
    func test_decode_JSON데이터의_duration값이_올바른가() {
        //given
        let duration = "1900. 04. 14 - 1900. 11. 12"
        //when
        let result = sut.duration
        //then
        XCTAssertEqual(duration, result)
    }
}
