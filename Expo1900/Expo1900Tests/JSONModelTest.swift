//
//  JSONModelTest.swift
//  Expo1900Tests
//
//  Created by duckbok on 2021/04/14.
//

import XCTest
@testable import Expo1900

class JSONModelTest: XCTestCase {
    var sut: Exposition?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Exposition(title: "대전 엑스포(Taejŏn Expo '93)", visitors: 14_005_808, location: "대한민국 대전직할시 엑스포과학공원", duration: "1993. 08. 07 - 1993. 11. 07", description: "1993년 세계 박람회는 1993년 8월 7일부터 11월 7일까지 93일간 대한민국 대전직할시 대덕연구단지 일대에서 열린 세계 박람회로, 대전 엑스포라고도 한다.")
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_박람회_방문자수에_반점이_잘붙고_뒤에_명이_붙는다() {
        XCTAssertEqual(sut?.formattedVisitors, "14,005,808 명")
    }
    
    func test_박람회_제목이_여는_소괄호를_기준으로_개행이_된다() {
        XCTAssertEqual(sut?.formattedTitle, "대전 엑스포\n(Taejŏn Expo '93)")
    }
}
