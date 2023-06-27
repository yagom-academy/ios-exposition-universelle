//
//  Expo1900ItemsTests.swift
//  Expo1900ModelTests
//
//  Created by Max, Whales on 2023/06/27.
//

import XCTest
@testable import Expo1900

final class Expo1900ItemsTests: XCTestCase {
    var sut: [ExpositionItemData]!

    override func setUpWithError() throws {
        guard let itemsData = NSDataAsset.init(name: "items") else {
            return
        }
        
        let decorder = JSONDecoder()
        sut = try decorder.decode([ExpositionItemData].self, from: itemsData.data)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_첫데이터의_이름이_직지심체요절이다() {
        // given
        let expectation = "직지심체요절"
        
        // when
        guard let firstItem = sut.first else {
            return
        }
        
        // then
        XCTAssertEqual(expectation, firstItem.name)
    }
}
