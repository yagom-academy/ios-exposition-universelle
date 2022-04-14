//
//  HeritageModelTest.swift
//  ModelTests
//
//  Created by 이시원 on 2022/04/12.
//

import XCTest
@testable import Expo1900

class HeritageModelTest: XCTestCase {
    var jsonDecoder: JSONDecoder!
    var sut: [Heritage]!

    override func setUpWithError() throws {
        guard let path = Bundle.main.path(forResource: "items", ofType: "json") else { return }
        guard let jsonString = try? String(contentsOfFile: path) else { return }
        guard let data = jsonString.data(using: .utf8) else { return }
        
        jsonDecoder = JSONDecoder()
        sut = try? jsonDecoder.decode([Heritage].self, from: data)
    }

    override func tearDownWithError() throws {
        jsonDecoder = nil
        sut = nil
    }
    
    func test_jsonDecoder_작동하는가() {
        XCTAssertNotNil(sut)
    }
    
    func test_Heritage의_title이_일치하는가() {
        let title = "직지심체요절"

        let result = sut[0].title

        XCTAssertEqual(result, title)
    }

}
