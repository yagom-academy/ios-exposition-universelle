//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by 홍정아 on 2021/07/06.
//
@testable import Expo1900
import XCTest

class Expo1900Tests: XCTestCase {
    class Test: JSONDecodable {
        typealias JSONModel = Exposition
    }
    let cut = Test()
    
    func test_파일이름이exposition블라블라일때_Exposition의title은_파리만국박람회블라블라() {
        //Given
        let fileName = "exposition_universelle_1900"
        let expectInputValue = "파리 만국박람회 1900(L'Exposition de Paris 1900)"
        //When
        let expectResult = try? cut.decodeJSON(fileName: fileName)
        //Then
        XCTAssertEqual(expectInputValue, expectResult?.title)
    }
}
