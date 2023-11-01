//
//  DecodingTests.swift
//  DecodingTests
//
//  Created by Hisop on 2023/11/01.
//

import XCTest
@testable import Expo1900

final class DecodingTests: XCTestCase {
    var decoder = JSONDecoder()

    func test_dataAsset이_exposition_universelle_1900_일_때_Decoding이_정상적으로_이루어지는지() {
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }

        XCTAssertNoThrow(try decoder.decode(Exposition.self, from: dataAsset.data))
    }
    
    func test_dataAsset이_items_일_때_Decoding이_정상적으로_이루어지는지() {
        guard let dataAsset = NSDataAsset(name: "items") else {
            return
        }

        XCTAssertNoThrow(try decoder.decode([CulturalAssets].self, from: dataAsset.data))
    }
}
