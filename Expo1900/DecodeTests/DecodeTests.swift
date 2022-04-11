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
    XCTAssertNotNil(ParseManager<Expo>.parse(name: "exposition_universelle_1900"))
  }
  
  func test_Heritage의_NSDataAsset이_decode_되는지() {
    XCTAssertNotNil(ParseManager<[Heritage]>.parse(name: "items"))
  }
}
