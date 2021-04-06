//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by Ryan-Son on 2021/04/05.
//

import XCTest
@testable import Expo1900

class Expo1900Tests: XCTestCase, JSONDecodable {
    typealias T = [Artwork]
    
    var sutExpoIntroduction: ExpoIntroduction!
    var sutArtwork: Artwork!
    var sutArtworks: [Artwork]!

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super .tearDownWithError()
        sutExpoIntroduction = nil
        sutArtwork = nil
        sutArtworks = nil
    }

    func testExample() throws {
        test_artwork_Initializing()
        test_expoIntroduction_Initializing()
        test_jsonDecodable_decode()
    }
    
    func test_artwork_Initializing() {
        sutArtwork = Artwork(name: "Name",
                             imageName: "Image name",
                             shortDescription: "Short description",
                             description: "Description")
        
        XCTAssertEqual(sutArtwork.name, "Name")
        XCTAssertEqual(sutArtwork.imageName, "Image name")
        XCTAssertEqual(sutArtwork.shortDescription, "Short description")
        XCTAssertEqual(sutArtwork.description, "Description")
    }
    
    func test_expoIntroduction_Initializing() {
        sutExpoIntroduction = ExpoIntroduction(title: "Title",
                                               visitors: 1234567890,
                                               location: "Location",
                                               duration: "Duration",
                                               description: "Description")
        
        XCTAssertEqual(sutExpoIntroduction.title, "Title")
        XCTAssertEqual(sutExpoIntroduction.visitors, 1234567890)
        XCTAssertEqual(sutExpoIntroduction.location, "Location")
        XCTAssertEqual(sutExpoIntroduction.duration, "Duration")
        XCTAssertEqual(sutExpoIntroduction.description, "Description")
    }
    
    func test_jsonDecodable_decode() {
        sutArtworks = decode(jsonFileName: "items")
        
        for index in 0...(sutArtworks.count - 1) {
            XCTAssertNotEqual(sutArtworks[index].name, nil)
            XCTAssertNotEqual(sutArtworks[index].imageName, nil)
            XCTAssertNotEqual(sutArtworks[index].shortDescription, nil)
            XCTAssertNotEqual(sutArtworks[index].description, nil)
        }
        
    }
}
