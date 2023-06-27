//
//  Expo1900ExpositionUniverselleTests.swift
//  Expo1900ModelTests
//
//  Created by Max, Whales on 2023/06/27.
//

import XCTest
@testable import Expo1900

final class Expo1900ExpositionUniverselleTests: XCTestCase {
    var sut: ExpositionUniverselle!

    override func setUpWithError() throws {
        guard let expositionUniverselleData = NSDataAsset.init(name: "exposition_universelle_1900") else {
            return
        }
        
        let decorder = JSONDecoder()
        sut = try decorder.decode(ExpositionUniverselle.self, from: expositionUniverselleData.data)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_개최지_이름이_프랑스_파리이다() {
        // given
        let expectation = "프랑스 파리"
        
        // when
        let location = sut.location
        
        // then
        XCTAssertEqual(expectation, location)
    }
}
