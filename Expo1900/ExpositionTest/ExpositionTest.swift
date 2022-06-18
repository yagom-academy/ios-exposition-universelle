//
//  ExpositionTest.swift
//  ExpositionTest
//
//  Created by Baek on 2022/06/14.
//

import XCTest
@testable import Expo1900

class ExpositionTest: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_Json데이터를_가져온다() {
        //given
        
        //when
        guard let result = try? JsonParser<ExpositionPostEntity>.fetch(JSONFile.expositionPost.name) else {
            return
        }
        //then
        XCTAssertNotNil(result)
    }
    
    func test_Json_데이터가_Entity에_들어있는지_확인한다() {
        //given
        let expectation = "파리 만국박람회 1900\n(L\'Exposition de Paris 1900)"
        
        //when
        guard let result = try? JsonParser<ExpositionPostEntity>.fetch(JSONFile.expositionPost.name) else {
            return
        }
        
        //then
        switch result {
        case .success(let data):
            let title = data.manufacture(.title)
            XCTAssertEqual(title, expectation)
        case .failure(let error):
            print(error.message)
        }
    }
    
    func test_Json_데이터가져오는것을_실패하는경우_메세지를반환한다() {
        //given
        let fileName = "백곰"
        let expectation = "JSON파일이 없습니다.!"
        
        //when
        guard let result = try? JsonParser<ExpositionPostEntity>.fetch(fileName) else {
            return
        }
        
        //then
        switch result {
        case .success(_):
            break
        case .failure(let error):
            let errorMessage = error.message
            XCTAssertEqual(errorMessage, expectation)
        }
    }
}
