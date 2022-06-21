//
//  ExpoItemModelsTests.swift
//  ExpoItemModelsTests
//
//  Created by 재재, 보리사랑 on 2022/06/15.
//

import XCTest

class ExpoItemModelsTests: XCTestCase {
    var jsonDecoder: JSONDecoder!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        jsonDecoder = JSONDecoder()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        jsonDecoder = nil
    }
    
//MARK: - JSON Modeling Test
    
    func test_ExpoItemElement의_배열이_decoding되면_true() throws {
        //given
        let fileName = "items"
        let extensionName = "json"
        let testBundle = Bundle(for: type(of: self))
        guard let fileUrl = testBundle.url(forResource: fileName, withExtension: extensionName) else {
            return
        }
        
        //when
        let data = try Data(contentsOf: fileUrl)
        guard let decodedData = try jsonDecoder.decode([ExpoItemElement].self, from: data) as? [ExpoItemElement] else {
            return
        }
        
        //then
        XCTAssertNotNil(decodedData)
    }
}
