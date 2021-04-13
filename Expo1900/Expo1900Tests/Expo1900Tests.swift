//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by Ryan-Son on 2021/04/05.
//

import XCTest
@testable import Expo1900

final class Expo1900Tests: XCTestCase {
  
  override func setUpWithError() throws {
    try super.setUpWithError()
  }
  
  override func tearDownWithError() throws {
    try super .tearDownWithError()
  }
  
  func test_customJSONDecoder_decode() {
    XCTAssertNotNil(
      ExpoJSONDecoder.decode(to: ExpoIntroduction.self,from: ExpoData.expoIntroduction.rawValue)
    )
    XCTAssertNotNil(ExpoJSONDecoder.decode(to: [Artwork].self, from: ExpoData.artworks.rawValue))
  }
  
  func test_customJSONDecoder_decode_withInvalidJSONFile() {
    XCTAssertEqual(
      ExpoJSONDecoder.decode(to: ExpoIntroduction.self,from: "invalidJSONFileName"),
      .failure(ExpoAppError.invalidJSONFileName("invalidJSONFileName"))
    )
  }
  
  func test_formatNumber() {
    XCTAssertEqual(
      ExpoIntroductionViewController().formattedNumber(1234567890),
      .success("1,234,567,890")
    )
  }
}

