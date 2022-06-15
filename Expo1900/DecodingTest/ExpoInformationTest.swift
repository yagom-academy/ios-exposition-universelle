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
        expo1900 = NSDataAsset(name: "exposition_universelle_1900")
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
        XCTAssertEqual(result, expoInformation?.title)
    }
}
