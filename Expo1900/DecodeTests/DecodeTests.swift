//
//  DecodeTests.swift
//  DecodeTests
//
//  Created by Taeangel, dudu on 2022/04/11.
//

import XCTest
@testable import Expo1900

class DecodeTests: XCTestCase {
  
  func test_Expo의_NSDataAsset이_decode_되는지() {
    XCTAssertNotNil(Expo.parse())
  }
  
  func test_Heritage의_NSDataAsset이_decode_되는지() {
    XCTAssertNotNil(Heritage.parse())
  }
}
