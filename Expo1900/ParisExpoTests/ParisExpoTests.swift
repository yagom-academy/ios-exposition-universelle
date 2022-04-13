//
//  ParisExpoTests.swift
//  ParisExpoTests
//
//  Created by LIMGAUI on 2022/04/11.
//

import XCTest
@testable import Expo1900

extension ParisExpo: Equatable {
    public static func == (lhs: ParisExpo, rhs: ParisExpo) -> Bool {
        return lhs.title == rhs.title && lhs.description == rhs.description && lhs.duration == rhs.duration && lhs.visitors == rhs.visitors && lhs.location == rhs.location
    }
}

final class ParisExpoTests: XCTestCase {
    func test_jsondata를_decode했을때_값추출이_정상적으로되는지() throws {
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
        
        let result = ParisExpo(title: "파리 만국박람회 1900(L'Exposition de Paris 1900)",
                               visitors: 48130300,
                               location: "프랑스 파리",
                               duration: "1900. 04. 14 - 1900. 11. 12",
                               description: "1900년 파리 만국박람회(지금의 세계 박람회[World’s")
        
        XCTAssertEqual(result, item)
    }
}
