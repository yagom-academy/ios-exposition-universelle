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
        let expositionInfo = try? jsonManager.decodedExpositionInfo()
        // then
        XCTAssertNotNil(expositionInfo)
    }
    
    func test_getDecodedItems의리턴값이_nil이아니다() throws {
        // given
        let jsonManager = JsonManager()
        // when
        let item = try? jsonManager.decodedItems()
        // then
        XCTAssertNotNil(item)
    }
    
    func test_noFileError() throws {
        // given
        let jsonManager = MockJsonManager()
        var result: ExpoError?
        // when
        do {
            _ = try jsonManager.decodedItems()
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
            _ = try jsonManager.decodedExpositionInfo()
        } catch {
            result = error as? ExpoError
        }
        // then
        XCTAssertEqual(result, ExpoError.decodingError)
    }
}


