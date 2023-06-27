//
//  Expo1900UIntTests.swift
//  Expo1900ModelTests
//
//  Created by Max, Whales on 2023/06/27.
//

import XCTest
@testable import Expo1900

final class Expo1900UIntTests: XCTestCase {
    func test_4자리_이상의_UInt_타입에서_formatToDecimal_메서드를_사용하면_천단위_구분기호가_들어간다() {
        // given
        let testNumber: UInt = 12345
        let expectation = "12,345"
        
        // when
        let formattedNumber = testNumber.formatToDecimal()
        
        // then
        XCTAssertEqual(formattedNumber, expectation)
    }
    
    func test_UInt_타입_0에_formatToDecimal_메서드를_사용하면_문자열_0이_반환된다() {
        // given
        let testNumber: UInt = 0
        let expectation = "0"
        
        // when
        let formattedNumber = testNumber.formatToDecimal()
        
        // then
        XCTAssertEqual(formattedNumber, expectation)
    }
    
    func test_3자리_이하의_UInt_타입에서_formatToDecimal_메서드를_사용하면_문자열로_바뀐다() {
        // given
        let testNumber: UInt = 789
        let expectation = "789"
        
        // when
        let formattedNumber = testNumber.formatToDecimal()
        
        // then
        XCTAssertEqual(formattedNumber, expectation)
    }
}
