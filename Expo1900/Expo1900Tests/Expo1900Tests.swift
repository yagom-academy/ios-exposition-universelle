//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by 이윤주 on 2021/07/13.
//

import XCTest
@testable import Expo1900

class Expo1900Tests: XCTestCase {
    //TODO: ParsingManager의 Parse메소드가 무결한 데이터에 대해 잘 파싱을 수행하는지, 그리고 그 데이터를 모델로 잘 변환하는지
    //      ParsingManager의 Parse메소드가 존재하지 않는 파일에 대해 어떻게 처리를 수행하는지
    //      존재하는 파일이기는 하나 JSON파일이 아니거나 형식이 올바르지 않은경우
    //      데이터와 모델의 타입이 상호 호환되지 않는경우
    let sut = ParsingManager.shared
    
    func test_테스트파일을_가져와서파싱했을때_모델타입에적절한데이터가들어올것이다() {
        //given
        let expectInputFileName = "test_expo"
        
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
}
