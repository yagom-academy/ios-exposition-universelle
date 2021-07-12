//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by WANKI KIM on 2021/07/08.
//

import XCTest

@testable import Expo1900
class Expo1900Tests: XCTestCase {
    var jsonDecoder: JSONDecoder!
    let expositionInformation = ExpositionInformation.init(title: "0", visitors: 0, location: "0", duration: "0", description: "0")
    let exhibitionItems = [ExhibitionItem.init(name: "1", imageName: "1", shortDescription: "1", description: "1")
                           ,ExhibitionItem.init(name: "2", imageName: "2", shortDescription: "2", description: "2")
                           ,ExhibitionItem.init(name: "3", imageName: "3", shortDescription: "3", description: "3")]
    
    override func setUp() {
        jsonDecoder = JSONDecoder()
    }
    
    func test_ExpositionInformation_타입으로_디코딩을_성공한다() {
        // given
        let jsonData = try! JSONEncoder().encode(expositionInformation)
        // when
        let decodedResult = try! jsonDecoder.decode(ExpositionInformation.self, from: jsonData)
        // then
        XCTAssertEqual(decodedResult, expositionInformation)
    }
    
    func test_ExhibitionItem_타입으로_디코딩을_성공한다() {
        // given
        let jsonData = try! JSONEncoder().encode(exhibitionItems)
        // when
        let decodedResult = try! jsonDecoder.decode([ExhibitionItem].self, from: jsonData)
        // then
        XCTAssertEqual(decodedResult, exhibitionItems)
    }
}

extension ExpositionInformation: Encodable {
    enum CodingKeys: CodingKey {
        case title
        case visitors
        case location
        case duration
        case description
    }
    
    public func encode(to encoder: Encoder) throws {
        var value = encoder.container(keyedBy: CodingKeys.self)
        try value.encode(title, forKey: .title)
        try value.encode(visitors, forKey: .visitors)
        try value.encode(location, forKey: .location)
        try value.encode(duration, forKey: .duration)
        try value.encode(description, forKey: .description)
    }
}

extension ExpositionInformation: Equatable {
    public static func == (lhs: ExpositionInformation, rhs: ExpositionInformation) -> Bool {
        return lhs.title == rhs.title &&
            lhs.visitors == rhs.visitors &&
            lhs.location == rhs.location &&
            lhs.duration == rhs.duration &&
            lhs.description == rhs.description
    }
}

extension ExhibitionItem: Encodable {
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
    
    public func encode(to encoder: Encoder) throws {
        var value = encoder.container(keyedBy: CodingKeys.self)
        try value.encode(name, forKey: .name)
        try value.encode(imageName, forKey: .imageName)
        try value.encode(shortDescription, forKey: .shortDescription)
        try value.encode(description, forKey: .description)
    }
}

extension ExhibitionItem: Equatable {
    public static func == (lhs: ExhibitionItem, rhs: ExhibitionItem) -> Bool {
        return lhs.name == rhs.name &&
            lhs.imageName == rhs.imageName &&
            lhs.shortDescription == rhs.shortDescription &&
            lhs.description == rhs.description
    }
}
