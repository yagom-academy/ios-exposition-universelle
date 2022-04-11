//
//  ParisExpoTests.swift
//  ParisExpoTests
//
//  Created by LIMGAUI on 2022/04/11.
//

import XCTest
@testable import Expo1900

class ParisExpoTests: XCTestCase {
    func test_decode_값확인() throws {
        let json = """
        {
            "title":"파리 만국박람회 1900(L'Exposition de Paris 1900)",
            "visitors":48130300,
            "location":"프랑스 파리",
            "duration":"1900. 04. 14 - 1900. 11. 12",
            "description":"1900년 파리 만국박람회(지금의 세계 박람회[World’s"
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let item = try decoder.decode(ParisExpo.self, from: json)
        
        XCTAssertEqual(item.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
        XCTAssertEqual(item.visitors, 48130300)
        XCTAssertEqual(item.location, "프랑스 파리")
        XCTAssertEqual(item.duration, "1900. 04. 14 - 1900. 11. 12")
        XCTAssertEqual(item.description, "1900년 파리 만국박람회(지금의 세계 박람회[World’s")
    }
}
