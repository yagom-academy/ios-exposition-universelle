//
//  ModelTests.swift
//  ModelTests
//
//  Created by 사파리, papri on 12/04/2022.
//

import XCTest
@testable import Expo1900

class ModelTests: XCTestCase {
    var jsonDecoder: JSONDecoder!
    var sut: Expo!

    override func setUpWithError() throws {
        jsonDecoder = JSONDecoder()
    }

    override func tearDownWithError() throws {
        jsonDecoder = nil
        sut = nil
    }
    
    func test_jsonDecoder_작동하는가() {
        guard let dataAsset = NSDataAsset.init(name: "exposition_universelle_1900") else { return }
        sut = try? jsonDecoder.decode(Expo.self, from: dataAsset.data)
        
        XCTAssertNotNil(sut)
        
    }

}

