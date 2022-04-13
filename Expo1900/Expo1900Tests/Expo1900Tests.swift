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
        let expositionInfo = try? jsonManager.getDecodedExpositionInfo()
        // then
        XCTAssertNotNil(expositionInfo)
    }
    
    func test_getDecodedItems의리턴값이_nil이아니다() throws {
        // given
        let jsonManager = JsonManager()
        // when
        let item = try? jsonManager.getDecodedItems()
        // then
        XCTAssertNotNil(item)
    }
    
    func test_error() throws {
        // given
        let jsonManager = MockJsonManager()
        var result: ExpoError?
        // when
        do {
            let item = try jsonManager.getDecodedItems()
        } catch {
            result = error as? ExpoError
        }
        
        print(result)
        // then
//        XCTAssert()
        
    }
}


struct MockJsonManager: JsonManagerable {
    func getDecodedItems() throws -> [Item] {
            throw ExpoError.noFileError
        }
    
    func getDecodedExpositionInfo() throws -> ExpositionInfo {
     throw ExpoError.decodingError
    }
}
