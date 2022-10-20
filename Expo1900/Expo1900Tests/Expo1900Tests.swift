//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by Wonbi on 2022/10/19.
//

import XCTest
@testable import Expo1900

class Expo1900Tests: XCTestCase {
    func test_ExpoInformation의디코딩이정상적으로이루어지는지() {
        let result = JSONDecoder.decode(
            ExpoInformation.self,
            from: "exposition_universelle_1900"
        )
        
        XCTAssertEqual(result?.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
        XCTAssertEqual(result?.visitors, 48130300)
    }
}
