//
//  ModelTests.swift
//  ModelTests
//
//  Created by 사파리, papri on 12/04/2022.
//

import XCTest
@testable import Expo1900

class ExpoModelTest: XCTestCase {
    var jsonDecoder: JSONDecoder!
    var sut: Expo!

    override func setUpWithError() throws {
        guard let path = Bundle.main.path(forResource: "exposition_universelle_1900", ofType: "json") else { return }
        guard let jsonString = try? String(contentsOfFile: path) else { return }
        guard let data = jsonString.data(using: .utf8) else { return }
        
        jsonDecoder = JSONDecoder()
        sut = try? jsonDecoder.decode(Expo.self, from: data)
    }

    override func tearDownWithError() throws {
        jsonDecoder = nil
        sut = nil
    }
    
    func test_jsonDecoder_작동하는가() {
        XCTAssertNotNil(sut)
    }
    
    func test_Expo의_title이_일치하는가() {
        let title = "파리 만국박람회 1900(L'Exposition de Paris 1900)"
        
        let result = sut.title
        
        XCTAssertEqual(result, title)
    }

}

