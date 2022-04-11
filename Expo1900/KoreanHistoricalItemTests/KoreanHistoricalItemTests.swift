//
//  KoreanHistoricalItemTests.swift
//  KoreanHistoricalItemTests
//
//  Created by 김태현 on 2022/04/11.
//

import XCTest
@testable import Expo1900

final class KoreanHistoricalItemTests: XCTestCase {
    func test_jsondata를_decode했을때_값추출이_정상적으로되는지() throws {
        let json = """
        [
            {
                "name": "직지심체요절",
                "image_name": "jikji",
                "short_desc": "백운화상 경한(景閑)이 1372년에 초록한 불교 서적",
                "desc": "《'백운화상초록불조직지심체요절》(白雲和尙抄錄佛祖直指心體要節)은 백운화상 경한(景閑)이 1372년"
            }
        ]
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let items = try decoder.decode([KoreanHistoricalItem].self, from: json)
        
        for item in items {
            XCTAssertEqual(item.name, "직지심체요절")
            XCTAssertEqual(item.imageName, "jikji")
            XCTAssertEqual(item.shortDesciption, "백운화상 경한(景閑)이 1372년에 초록한 불교 서적")
            XCTAssertEqual(item.description, "《'백운화상초록불조직지심체요절》(白雲和尙抄錄佛祖直指心體要節)은 백운화상 경한(景閑)이 1372년")
        }
    }
    
}
