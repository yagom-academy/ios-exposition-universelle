//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by 이윤주 on 2021/07/13.
//

import XCTest
@testable import Expo1900

class Expo1900Tests: XCTestCase {
    let sut = ParsingManager.shared
    
    func test_테스트파일을_가져와서파싱했을때_모델타입에적절한데이터가들어올것이다() {
        //given
        let expectInputFileName = "daejeon_expo"
        
        //when
        let outputValue = sut.parse(from: expectInputFileName, to: ExpoIntroduction.self)
        let expectResult: Result<ExpoIntroduction, ParsingError> = .success(ExpoIntroduction(title: "대전 EXPO 1993", visitors: 1000, location: "대한민국 대전", duration: "1993", description: "꿈돌이와 함께하는 대전 EXPO"))
        
        //then
        XCTAssertEqual(outputValue, expectResult)
    }
    
    func test_존재하지않는파일을_가져와서파싱했을때_에러가발생할것이다() {
        //given
        let expectInputFileName = ""
        
        //when
        let outputValue = sut.parse(from: expectInputFileName, to: ExpoIntroduction.self)
        let expectResult: Result<ExpoIntroduction, ParsingError> = .failure(.dataSetNotFound)
        
        //then
        XCTAssertEqual(outputValue, expectResult)
    }
    
    func test_rtf파일을_가져와서파싱했을때_에러가발생할것이다() {
        //given
        let expectInputFileName = "daejeon_expo2"
        
        //when
        let outputValue = sut.parse(from: expectInputFileName, to: ExpoIntroduction.self)
        let expectResult: Result<ExpoIntroduction, ParsingError> = .failure(.decodingFailed)
        
        //then
        XCTAssertEqual(outputValue, expectResult)
    }
    
    func test_JSON문법에어긋나는파일을_가져와서파싱했을때_에러가발생할것이다() {
        //given
        let expectInputFileName = "daejeon_expo3"
        
        //when
        let outputValue = sut.parse(from: expectInputFileName, to: ExpoIntroduction.self)
        let expectResult: Result<ExpoIntroduction, ParsingError> = .failure(.decodingFailed)
        
        //then
        XCTAssertEqual(outputValue, expectResult)
    }
    
    func test_모델과호환되지않는파일을_가져와서파싱했을때_에러가발생할것이다() {
        //given
        let expectInputFileName = "daejeon_expo4"
        
        //when
        let outputValue = sut.parse(from: expectInputFileName, to: ExpoIntroduction.self)
        let expectResult: Result<ExpoIntroduction, ParsingError> = .failure(.decodingFailed)
        
        //then
        XCTAssertEqual(outputValue, expectResult)
    }
}
