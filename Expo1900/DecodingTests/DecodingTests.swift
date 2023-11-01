//
//  DecodingTests.swift
//  DecodingTests
//
//  Created by Hisop on 2023/11/01.
//

import XCTest
@testable import Expo1900

final class DecodingTests: XCTestCase {
    var decoder = JSONDecoder()

    func test_dataAsset이_exposition_universelle_1900_일_때_Decoding이_정상적으로_이루어지는지() {
        let title: String = "파리 만국박람회"
        let visitors: Int = 48130300
        let location: String = "프랑스 파리"
        let duration: String = "1900. 04. 14"
        let explanation: String = "1900년 파리 만국박람회(지금의 세계 박람회[World’s Fair/Exposition/Expo])"
        let json: Data = """
{
    "title":"\(title)",
    "visitors":\(visitors),
    "location":"\(location)",
    "duration":"\(duration)",
    "description":"\(explanation)"
}
""".data(using: .utf8)!
        
        let exposition = Exposition(
            title: title,
            visitors: visitors,
            location: location,
            duration: duration,
            explanation: explanation
        )

        XCTAssertEqual(exposition, try! decoder.decode(Exposition.self, from: json))
    }
    
    func test_dataAsset이_items_일_때_Decoding이_정상적으로_이루어지는지() {
        guard let dataAsset = NSDataAsset(name: "items") else {
            return
        }

        XCTAssertNoThrow(try decoder.decode([CulturalAsset].self, from: dataAsset.data))
    }
}

extension Exposition: Equatable {
    public static func == (lhs: Exposition, rhs: Exposition) -> Bool {
        return lhs.title == rhs.title && 
        lhs.visitors == rhs.visitors &&
        lhs.location == rhs.location &&
        lhs.duration == rhs.duration &&
        lhs.explanation == rhs.explanation
    }
}
