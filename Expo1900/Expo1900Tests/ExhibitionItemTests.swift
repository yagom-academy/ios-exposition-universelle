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
        try super.setUpWithError()
        self.sut = try? [ExhibitionItem].decode(from: "items").get()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        self.sut = nil
    }
    
    func test_decode_파일이_존재하지않을때_예상된_에러인가() {
        //given
        let expected: DecodingError = .fileNameNotFound
        let fakeFileName = "a"
        // when
        // then
        XCTAssertThrowsError(try [ExhibitionItem].decode(from: fakeFileName).get()) { error in
            XCTAssertEqual(error as? DecodingError, expected)
        }
    }
    
    func test_decode_JSON데이터에서_decode된_첫번째객체의_name값이_올바른가() {
        //given
        let name = "직지심체요절"
        //when
        let firstName = sut.first!.name
        //then
        XCTAssertEqual(firstName, name)
    }
    
    func test_decode_JSON데이터에서_decode된_객체의_수가_올바른가() {
        //given
        let jsonCount = 13
        //when
        let decodingCount = sut.count
        //then
        XCTAssertEqual(decodingCount, jsonCount)
    }
}
