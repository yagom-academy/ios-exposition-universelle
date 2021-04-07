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
  
  func test_artwork_initializing() throws {
    sutArtwork = Artwork(name: "Name",
                         imageName: "Image name",
                         shortDescription: "Short description",
                         description: "Description")
    
    guard let unwrappedSUTArtwork = sutArtwork else {
      throw ExpoAppError.foundNil
    }
    
    XCTAssertEqual(unwrappedSUTArtwork.name, "Name")
    XCTAssertEqual(unwrappedSUTArtwork.imageName, "Image name")
    XCTAssertEqual(unwrappedSUTArtwork.shortDescription, "Short description")
    XCTAssertEqual(unwrappedSUTArtwork.description, "Description")
  }
  
  func test_expoIntroduction_initializing() throws {
    sutExpoIntroduction = ExpoIntroduction(title: "Title",
                                           visitors: 1234567890,
                                           location: "Location",
                                           duration: "Duration",
                                           description: "Description")
    
    guard let unwrappedSUTExpoIntroduction = sutExpoIntroduction else {
      throw ExpoAppError.foundNil
    }
    
    XCTAssertEqual(unwrappedSUTExpoIntroduction.title, "Title")
    XCTAssertEqual(unwrappedSUTExpoIntroduction.visitors, 1234567890)
    XCTAssertEqual(unwrappedSUTExpoIntroduction.location, "Location")
    XCTAssertEqual(unwrappedSUTExpoIntroduction.duration, "Duration")
    XCTAssertEqual(unwrappedSUTExpoIntroduction.description, "Description")
  }
  
  func test_customJSONDecoder_decode() {
    let expoIntroductionJSONDecoder = CustomJSONDecoder<ExpoIntroduction>()
    let artworksJSONDecoder = CustomJSONDecoder<[Artwork]>()
    
    XCTAssertNoThrow(try expoIntroductionJSONDecoder.decode(jsonFileName: "exposition_universelle_1900"))
    XCTAssertNoThrow(try artworksJSONDecoder.decode(jsonFileName: "items"))
  }
  
  func test_customJSONDecoder_decode_withInvalidJSONFile() {
    let expoIntroductionJSONDecoder = CustomJSONDecoder<ExpoIntroduction>()
    
    XCTAssertThrowsError(try expoIntroductionJSONDecoder.decode(jsonFileName: "invalidJSONFile")) { (error) in
      XCTAssertEqual(error as? ExpoAppError, ExpoAppError.invalidJSONFile)
    }
  }
}

