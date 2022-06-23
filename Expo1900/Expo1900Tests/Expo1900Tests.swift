//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by seohyeon park on 2022/06/22.
//

import XCTest
import Foundation
@testable import Expo1900

class Expo1900Tests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
    }

    struct NameData: Codable {
        let data: [Name]
    }

    struct Name: Codable {
        let name: String?
        
        enum CodingKeys: String, CodingKey {
            case name
        }
        
        init(from decoder: Decoder) throws {
            let value = try decoder.container(keyedBy: CodingKeys.self)
            name = try? value.decode(String.self, forKey: .name)
        }
    }

    
    func test_잘못된_json데이터가_있을때_정상적인_데이터만_반환해주는지() {
        // given
        let data = """
        {
        "data" : [
            {"name" : "wody"},
            {"name" : 0},
            {"name" : "coda"},
            {"name" : "현이"}
        ]
        }
        """.data(using: .utf8)!

        guard let product = try? JSONDecoder().decode(NameData.self, from: data) else { return }
        
        // when
        let result = product.data.filter { $0.name != nil }.compactMap { $0.name }
        
        // then
        XCTAssertEqual(["wody", "coda", "현이"], result)
    }
    
    func test_잘못된_json데이터가_있을때_정상적인_데이터만_반환해주는지2() {
        //given
        let dataList = DataManager().entryParse(fileName: "items").filter { item in
            item?.name != nil && item?.imageName != nil && item?.shortDescription != nil && item?.longDescription != nil
        }.compactMap { $0 }
        
        let nameData = dataList.compactMap { $0.name }
        let imageNameData = dataList.compactMap { $0.imageName }
        let shortDescriptionData = dataList.compactMap { $0.shortDescription }
        let longDescriptionData = dataList.compactMap { $0.longDescription }
        
        // when
        let result = nameData
        
        // then
        XCTAssertEqual(["직지심체요절", "팔만대장경", "삼국사기", "해금", "용고", "놋그릇", "나막신", "나전칠기", "병풍", "갓", "가야금", "거문고"], result)
    }
}

