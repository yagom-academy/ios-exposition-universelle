//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by WANKI KIM on 2021/07/08.
//

import XCTest

@testable import Expo1900
class Expo1900Tests: XCTestCase {
    var jsonDecoder: JSONDecoder?
    
    override func setUp() {
        jsonDecoder = JSONDecoder()
    }

    func test_exposition_universelle_1900을_디코딩을_성공한다() {
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        let expositionInformation = try? jsonDecoder?.decode(ExpositionInformation.self, from: dataAsset.data)
        XCTAssertNotNil(expositionInformation, "exposition_universelle_1900 디코딩 성공!")
        
    }
}
