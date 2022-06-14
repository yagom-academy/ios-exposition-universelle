//
//  ExpositionTest.swift
//  ExpositionTest
//
//  Created by Baek on 2022/06/14.
//

import XCTest
@testable import Expo1900

class ExpositionTest: XCTestCase {
    
    var sut: ExpositionPostEntity!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_Json데이터를_가져온다() {
        //given
        do {
            guard
                let jsonData = JsonParser.fetch("ExpositionPost"),
                let post = try? JSONDecoder().decode(ExpositionPostEntity.self, from: jsonData)
            else { return }
            //when
            let data = try? JSONDecoder().decode(ExpositionPostEntity.self, from: jsonData)
            
            //then
            XCTAssertNotNil(data)
        } catch {
            
        }
    }
}
