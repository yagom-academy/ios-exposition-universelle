//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by Ryan-Son on 2021/04/05.
//

import XCTest
@testable import Expo1900

class Expo1900Tests: XCTestCase {
  var sutExpoIntroduction: ExpoIntroduction?
  var sutArtwork: Artwork?
  var sutArtworks: [Artwork]?
  
  override func setUpWithError() throws {
    try super.setUpWithError()
  }
  
  override func tearDownWithError() throws {
    try super .tearDownWithError()
    
    sutExpoIntroduction = nil
    sutArtwork = nil
    sutArtworks = nil
  }
  
  func test_customJSONDecoder_decode() {
    let jsonDecoder = CustomJSONDecoder()
    
    XCTAssertNoThrow(try jsonDecoder.decode(to: ExpoIntroduction.self, from: "exposition_universelle_1900"))
    XCTAssertNoThrow(try jsonDecoder.decode(to: [Artwork].self, from: "items"))
  }
  
  func test_customJSONDecoder_decode_withInvalidJSONFile() {
    let jsonDecoder = CustomJSONDecoder()
    
    XCTAssertThrowsError(try jsonDecoder.decode(to: ExpoIntroduction.self, from: "invalidJSONFile")) { (error) in
      XCTAssertEqual(error as? ExpoAppError, ExpoAppError.invalidJSONFileName)
    }
  }
}

