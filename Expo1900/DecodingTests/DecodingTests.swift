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
    
    func test_init을_통해_만든_Exposition타입과_JSON을_디코딩하여_만든_Exposition타입이_일치하는지_확인() {
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
    
    func test_init을_통해_만든_CulturalAsset타입과_JSON을_디코딩하여_만든_CulturalAsset타입이_일치하는지_확인() {
        let name: String = "직지심체요절"
        let imageName: String = "jikji"
        let shortDescription: String = "백운화상 경한(景閑)이 1372년에 초록한 불교 서적"
        let detailDescription: String = "《백운화상초록불조직지심체요절》(白雲和尙抄錄佛祖直指心體要節)"
        let json: Data = """
[{
    "name":"\(name)",
    "image_name":"\(imageName)",
    "short_desc":"\(shortDescription)",
    "desc":"\(detailDescription)"
}]
""".data(using: .utf8)!
        
        let culturalAsset = [CulturalAsset(
            name: name,
            imageName: imageName,
            shortDescription: shortDescription,
            detailDescription: detailDescription
        )]
        
        XCTAssertEqual(culturalAsset, try! decoder.decode([CulturalAsset].self, from: json))
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

extension CulturalAsset: Equatable {
    public static func == (lhs: CulturalAsset, rhs: CulturalAsset) -> Bool {
        return lhs.name == rhs.name &&
        lhs.imageName == rhs.imageName &&
        lhs.shortDescription == rhs.shortDescription &&
        lhs.detailDescription == rhs.detailDescription
    }
}
