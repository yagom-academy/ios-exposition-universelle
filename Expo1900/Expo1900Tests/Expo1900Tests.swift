//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by Eddy on 2022/04/11.
//

import XCTest
@testable import Expo1900

class Expo1900Tests: XCTestCase {
    var sut: WorldFairPoster!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func test_decode_Json_data_compare_to_decode_WorldFairPoster_file() {
        let decoder = JSONDecoder()
        guard let asset = NSDataAsset(name: "exposition_universelle_1900", bundle: .main),
              let expos = try? decoder.decode([WorldFairPoster].self, from: asset.data)
        else {
            return
        }
        let result = WorldFairPoster(title: "파리 만국박람회 1900(L'Exposition de Paris 1900)",
    }
    
    func test_decode_Json_data_compare_to_decode_WorldFairPoster_file() {
        let decoder = JSONDecoder()
        guard let asset = NSDataAsset(name: "exposition_universelle_1900", bundle: .main),
            let expo = try? decoder.decode(WorldFairPoster.self, from: asset.data)
        else {
            return
        }
        XCTAssertEqual(expo.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
    }
}
