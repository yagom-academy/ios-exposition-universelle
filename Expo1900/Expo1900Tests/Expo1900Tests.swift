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
        test_expoIntroduction_jsonDecoding()
        test_artworks_jsonDecoding()
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
    
    func test_expoIntroduction_jsonDecoding() {
        let decoder = JSONDecoder()
        
        guard let expoIntroductionData: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do  {
            self.sutExpoIntroduction = try decoder.decode(ExpoIntroduction.self, from: expoIntroductionData.data)
        } catch {
            print(error.localizedDescription)
        }
        
        XCTAssertNotEqual(sutExpoIntroduction, nil)
//        XCTAssertEqual(sutExpoIntroduction.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
//        XCTAssertEqual(sutExpoIntroduction.visitors, 48130300)
//        XCTAssertEqual(sutExpoIntroduction.location, "프랑스 파리")
//        XCTAssertEqual(sutExpoIntroduction.duration, "1900. 04. 14 - 1900. 11. 12")
    }
    
    func test_artworks_jsonDecoding() {
        let decoder = JSONDecoder()

        guard let artworksData: NSDataAsset = NSDataAsset(name: "items") else { return }
        
        do  {
            self.sutArtworks = try decoder.decode([Artwork].self, from: artworksData.data)
        } catch {
            print(error.localizedDescription)
        }
        
        for index in 0...(sutArtworks.count - 1) {
            XCTAssertNotEqual(sutArtworks[index].name, nil)
            XCTAssertNotEqual(sutArtworks[index].imageName, nil)
            XCTAssertNotEqual(sutArtworks[index].shortDescription, nil)
            XCTAssertNotEqual(sutArtworks[index].description, nil)
        }
        
//        XCTAssertNotEqual(sutArtworks, nil)
//        XCTAssertEqual(sutArtworks.count, 13)
    }
    
}
