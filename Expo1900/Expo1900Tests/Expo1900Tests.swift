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
        do {
            // when
            let expositionInfo: ExpositionInfo = try jsonManager.decodedResult()
            // then
            XCTAssertNotNil(expositionInfo)
        } catch {

            XCTFail()
        }
    }
    
    func test_getDecodedItems의리턴값이_nil이아니다() throws {
        // given
        let jsonManager = JsonManager()
        
        do {
            // when
            let item: [Item] = try jsonManager.decodedResult()
            // then
            XCTAssertNotNil(item)
        } catch {
            XCTFail()
        }
    }
    
    func test_noFileError() throws {
        // given
        let jsonManager = MockJsonManager()
    
        do {
            // when
            let _: [Item] = try jsonManager.decodedResult()
        } catch {
            let result = error as? ExpoError
            // then
            XCTAssertEqual(result, ExpoError.noFileError)
        }
    }
    
    func test_decodingError() throws {
        // given
        let jsonManager = MockJsonManager()
        do {
            // when
            let _: ExpositionInfo = try jsonManager.decodedResult()
        } catch {
           let result = error as? ExpoError
           // then
           XCTAssertEqual(result, ExpoError.decodingError)
        
        }
    }
}
