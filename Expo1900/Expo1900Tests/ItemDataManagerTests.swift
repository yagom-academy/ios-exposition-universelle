//
//  ItemDataManagerTests.swift
//  Expo1900Tests
//
//  Created by 웡빙, bonf on 2022/06/14.
//

import XCTest
@testable import Expo1900

class ItemDataManagerTests: XCTestCase {
    var sut: ItemDataManager!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ItemDataManager()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_Item의JSON데이터가_읽어와지는지_확인() {
        //given
        let result = sut.fetchData()!
        XCTAssertEqual(result[0].name, "직지심체요절")
    }
}
