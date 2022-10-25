//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by Wonbi on 2022/10/19.
//

import XCTest
@testable import Expo1900

class Expo1900Tests: XCTestCase {
    func test_ExpoInformation의디코딩이정상적으로이루어지는지() {
        let result = JSONDecoder.decode(
            ExpoInformation.self,
            from: "exposition_universelle_1900"
        )
        
        XCTAssertEqual(result?.mainTitle, "파리 만국박람회 1900\n(L'Exposition de Paris 1900)")
        XCTAssertEqual(result?.decimalVisitor, "48,130,300")
    }
    
    func test_Entry의디코딩이정상적으로이루어지는지() {
        let result = JSONDecoder.decode([Entry].self, from: "items")
        
        XCTAssertEqual(result?[0].name , "직지심체요절")
        XCTAssertNotEqual(result?[0].name, "불경")
    }
}
