//
//  JSONDecodeTests.swift
//  JSONDecodeTests
//
//  Created by Lingo on 2022/04/11.
//

import XCTest
@testable import Expo1900

final class JSONDecodeTests: XCTestCase {
  
  private var decoder: JSONDecoder?
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    self.decoder = JSONDecoder()
  }
  
  override func tearDownWithError() throws {
    try super.tearDownWithError()
    self.decoder = nil
  }
  
  func testDecode_WhenExpoDataProvided_ShouldNotThrowError() {
    // given when then
    if let path = Bundle.main.path(forResource: "exposition_universelle_1900", ofType: "json"),
       let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
      XCTAssertNoThrow(try decoder?.decode(Expo.self, from: data))
    }
  }
  
  func testDecode_WhenExpoItemDataProvided_ShouldNotThrowError() {
    // given when then
    if let path = Bundle.main.path(forResource: "items", ofType: "json"),
       let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
      XCTAssertNoThrow(try decoder?.decode(ExpoItem.self, from: data))
    }
  }
}
