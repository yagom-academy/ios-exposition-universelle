//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by Ryan-Son on 2021/04/05.
//

import XCTest
@testable import Expo1900

final class Expo1900Tests: XCTestCase {
  private var sutExpoIntroduction: ExpoIntroduction?
  private var sutArtworks: [Artwork]?
  
  override func setUpWithError() throws {
    try super.setUpWithError()
  }
  
  override func tearDownWithError() throws {
    try super .tearDownWithError()
    
    sutExpoIntroduction = nil
    sutArtworks = nil
  }
  
  func test_customJSONDecoder_decode() {
    XCTAssertNotNil(CustomJSONDecoder.decode(to: ExpoIntroduction.self, from: "exposition_universelle_1900"))
    XCTAssertNotNil(CustomJSONDecoder.decode(to: [Artwork].self, from: "items"))
  }
  
  func test_customJSONDecoder_decode_withInvalidJSONFile() {
    XCTAssertEqual(CustomJSONDecoder.decode(to: ExpoIntroduction.self, from: "invalidJSONFileName"),
                   .failure(ExpoAppError.invalidJSONFileName))
  }
}

