//
//  EntryTests.swift
//  EntryTests
//
//  Created by Dasan & Moon on 2023/06/26.
//

import XCTest
@testable import Expo1900

final class EntryTests: XCTestCase {
    var sut: [Entry]!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let decoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        
        do {
            self.sut = try decoder.decode([Entry].self, from: dataAsset.data)
        } catch {
            print(error)
        }
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_sut첫번째의_name은_직지심체요절이다() {
        // given
        let expectation = "직지심체요절"
        // when
        let result = sut.first?.name
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_sut마지막번째의_name은_거문고이다() {
        // given
        let expectation = "거문고"
        // when
        let result = sut.last?.name
        // then
        XCTAssertEqual(expectation, result)
    }
}
