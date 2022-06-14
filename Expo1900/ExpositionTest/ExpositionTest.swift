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
            //when
            let jsonData = JsonParser.fetch("ExpositionPost")
            
            //then
            XCTAssertNotNil(jsonData)
        } catch {
        }
    }
    
    func test_Json_데이터가_Entity에_들어있는지_확인한다() {
        //given
        let exposition: ExpositionPostEntity?
        let expectation = "파리 만국박람회 1900(L\'Exposition de Paris 1900)"
        do {
            //when
            let jsonData = JsonParser.fetch("ExpositionPost")
        
            let result = jsonData?.manufacture(.title)
            
            //then
            XCTAssertEqual(result, expectation)
        } catch {
            
        }
    }
}
