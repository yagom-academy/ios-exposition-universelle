//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by 우롱차, marisol on 2022/04/12.
//

import XCTest
@testable import Expo1900

class Expo1900Tests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_getDecodedExpositionInfo의리턴값이_nil이아니다() throws {
        // given
        let jsonManager = JsonManager()
        // when
        var expositionInfo: ExpositionInfo
        // then
        do {
            try expositionInfo = jsonManager.decodedResult()
            XCTAssertNotNil(expositionInfo)
        } catch {
            XCTFail()
        }
    }
    
    func test_getDecodedItems의리턴값이_nil이아니다() throws {
        // given
        let jsonManager = JsonManager()
        // when
        var item: [Item]
        // then
        do {
            try item = jsonManager.decodedResult()
            XCTAssertNotNil(item)
        } catch {
            XCTFail()
        }
    }
    
    func test_noFileError() throws {
        // given
        let jsonManager = MockJsonManager()
        var result: ExpoError?
        // when
        do {
            let items: [Item] = try jsonManager.decodedResult()
        } catch {
            result = error as? ExpoError
        }
        // then
        XCTAssertEqual(result, ExpoError.noFileError)
    }
    
    func test_decodingError() throws {
        // given
        let jsonManager = MockJsonManager()
        var result: ExpoError?
        // when
        do {
            let expositionInfo: ExpositionInfo = try jsonManager.decodedResult()
        } catch {
            result = error as? ExpoError
        }
        // then
        XCTAssertEqual(result, ExpoError.decodingError)
    }
}


