//
//  ExpositionDataManagerTests.swift
//  Expo1900Tests
//
//  Created by 웡빙, bonf on 2022/06/14.
//

import XCTest
@testable import Expo1900

class ExpositionDataManagerTests: XCTestCase {
    var sut: ExpositionDataManager!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ExpositionDataManager()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_Exposition의JSON데이터가_읽어와지는지_확인() {
        //given
        let result = sut.fetchData()!
        XCTAssertEqual(result.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
    }
}
