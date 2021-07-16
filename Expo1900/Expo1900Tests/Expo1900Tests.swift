//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by WANKI KIM on 2021/07/08.
//

import XCTest

@testable import Expo1900
class Expo1900Tests: XCTestCase {
    private var expositionItemManager: ExpositionItemManager! = .init()
    private var expositionInformationManager: ExpositionInformationManager! = .init()
    
    private let expositionInformation = ExpositionInformation.init(title: "0", visitors: 0, location: "0", duration: "0", description: "0")
    private let expositionItems = [ExpositionItem.init(name: "1", imageName: "1", shortDescription: "1", description: "1")
                           ,ExpositionItem.init(name: "2", imageName: "2", shortDescription: "2", description: "2")
                           ,ExpositionItem.init(name: "3", imageName: "3", shortDescription: "3", description: "3")]
    
    func test_ExpositionInformation_타입으로_디코딩을_성공한다() {
        // given
        let jsonData = try! JSONEncoder().encode(expositionInformation)
        // when
        let decodedResult = try! expositionInformationManager.decodejsonData(jsonData: jsonData)
        // then
        XCTAssertEqual(decodedResult, expositionInformation)
    }
    
    func test_ExpositionItem_타입으로_디코딩을_성공한다() {
        // given
        let jsonData = try! JSONEncoder().encode(expositionItems)
        // when
        let decodedResult = try! expositionItemManager.decodejsonData(jsonData: jsonData)
        // then
        XCTAssertEqual(decodedResult, expositionItems)
    }
    
    func test_ExpositionInformation_디코딩을_실패해_failDecoding에러가발생한다() {
        // given
        let jsonData = try! JSONEncoder().encode(expositionItems)
        // when
        do {
            _ = try expositionInformationManager.decodejsonData(jsonData: jsonData)
        } catch let error as JsonDataFetchError {
        // then
            XCTAssertEqual(error, JsonDataFetchError.failDecoding)
        } catch {
        }
    }
    
    func test_ExpositionItem_타입으로_디코딩을_실패해_failDecoding에러가발생한다() {
        // given
        let jsonData = try! JSONEncoder().encode(expositionInformation)
        // when
        do {
            _ = try expositionItemManager.decodejsonData(jsonData: jsonData)
        } catch let error as JsonDataFetchError {
        // then
            XCTAssertEqual(error, JsonDataFetchError.failDecoding)
        } catch {
        }
    }
    
    func test_ExpositionInformation_title_원하는결과로_반환된다() {
        // given
        let dummyTitle: String = "엘렌(거주지: 중국옆동네)"
        // when
        let sut = ExpositionInformation.init(title: dummyTitle, visitors: 1, location: "", duration: "", description: "")
        // then
        let 예상결과 = "엘렌\n(거주지: 중국옆동네)"
        XCTAssertEqual(sut.formattedTitle, 예상결과)
    }
    
    func test_ExpositionInformation_visitors_원하는결과로_반환된다() {
        // given
        let dummyVisitors: UInt = 30000000
        // when
        let sut = ExpositionInformation.init(title: "", visitors: dummyVisitors, location: "", duration: "", description: "")
        // then
        let 예상결과 = "30,000,000명"
        XCTAssertEqual(sut.formattedVisitors, 예상결과)
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

extension ExpositionItem: Encodable {
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

extension ExpositionItem: Equatable {
    public static func == (lhs: ExpositionItem, rhs: ExpositionItem) -> Bool {
        return lhs.name == rhs.name &&
            lhs.imageName == rhs.imageName &&
            lhs.shortDescription == rhs.shortDescription &&
            lhs.description == rhs.description
    }
}


extension ExpositionInformationManager {
    public func decodejsonData(jsonData: Data) throws -> ExpositionInformation {
        do {
            return try JSONDecoder().decode(ExpositionInformation.self, from: jsonData)
        } catch {
            throw JsonDataFetchError.failDecoding
        }
    }
}

extension ExpositionItemManager {
    public func decodejsonData(jsonData: Data) throws -> [ExpositionItem] {
        do {
            return try JSONDecoder().decode([ExpositionItem].self, from: jsonData)
        } catch {
            throw JsonDataFetchError.failDecoding
        }
    }
}
