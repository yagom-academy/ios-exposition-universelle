//
//  ExpoInformationTest.swift
//  ExpoInformationTest
//
//  Created by Brad, Groot on 2022/06/13.
//

import XCTest
@testable import Expo1900

class ExpoInformationTest: XCTestCase {
    var expo1900: NSDataAsset!
    var jsonDecoder: JSONDecoder!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        expo1900 = NSDataAsset.init(name: "exposition_universelle_1900")
        jsonDecoder = JSONDecoder()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        expo1900 = nil
        jsonDecoder = nil
    }
    
    func test_exposition_universelle_1900파일의_title값이_디코딩되는지() {
        // given
        let expoInformation = try? jsonDecoder.decode(ExpoInformation.self, from: expo1900.data)
        
        // when
        let result = "파리 만국박람회 1900(L'Exposition de Paris 1900)"
        
        // then
        XCTAssertEqual(result, expoInformation?.getTitle())
    }
    
    func test_exposition_universelle_1900파일의_visitors값이_디코딩되는지() {
        // given
        let expoInformation = try? jsonDecoder.decode(ExpoInformation.self, from: expo1900.data)
        
        // when
        let result = 48130300
        
        // then
        XCTAssertEqual(result, expoInformation?.getVisitors())
    }
    
    func test_exposition_universelle_1900파일의_location값이_디코딩되는지() {
        // given
        let expoInformation = try? jsonDecoder.decode(ExpoInformation.self, from: expo1900.data)
        
        // when
        let result = "프랑스 파리"
        
        // then
        XCTAssertEqual(result, expoInformation?.getLocation())
    }
    
    func test_exposition_universelle_1900파일의_duration값이_디코딩되는지() {
        // given
        let expoInformation = try? jsonDecoder.decode(ExpoInformation.self, from: expo1900.data)
        
        // when
        let result = "1900. 04. 14 - 1900. 11. 12"
        
        // then
        XCTAssertEqual(result, expoInformation?.getDuration())
    }
    
    func test_exposition_universelle_1900파일의_description값이_디코딩되는지() {
        // given
        let expoInformation = try? jsonDecoder.decode(ExpoInformation.self, from: expo1900.data)
        
        // when
        let result = "1900년 파리 만"
        
        // then
        XCTAssertEqual(result, expoInformation?.getDescription().prefix(10).description)
    }
}
