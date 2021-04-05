//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by Ryan-Son on 2021/04/05.
//

import XCTest
@testable import Expo1900

class Expo1900Tests: XCTestCase {
    
    var sutExpoIntroduction: ExpoIntroduction!
    var sutArtwork: Artwork!

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super .tearDownWithError()
        sutExpoIntroduction = nil
        sutArtwork = nil
    }

    func testExample() throws {
        test_artwork_Initializing()
        test_expoIntroduction_Initializing()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
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
                                               duration: "1900. 04. 14 - 1900. 11. 12",
                                               description: "Description",
                                               artworks: [])
        
        XCTAssertEqual(sutExpoIntroduction.title, "Title")
        XCTAssertEqual(sutExpoIntroduction.visitors, 1234567890)
        XCTAssertEqual(sutExpoIntroduction.location, "Location")
        XCTAssertEqual(sutExpoIntroduction.duration, "1900. 04. 14 - 1900. 11. 12")
        XCTAssertEqual(sutExpoIntroduction.description, "Description")
        XCTAssertEqual(sutExpoIntroduction.artworks, [])
    }
    
}
