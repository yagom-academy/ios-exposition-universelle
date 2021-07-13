//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by 홍정아 on 2021/07/06.
//
@testable import Expo1900
import XCTest

class Expo1900Tests: XCTestCase {
    class ExpositionTest: JSONDecodable {
        typealias JSONModel = Exposition
    }
    class ItemTest: JSONDecodable {
        typealias JSONModel = [Item]
    }
    
    var cutWithExposition: ExpositionTest!
    var cutWithItems: ItemTest!
    
    override func setUp() {
        super.setUp()
        cutWithExposition = ExpositionTest()
        cutWithItems = ItemTest()
    }
    
    override func tearDown() {
        super.tearDown()
        cutWithExposition = nil
        cutWithItems = nil
    }
    
    func test_파일이름이exposition블라블라일때_에러를던지지않는다() {
        //Given
        let fileName = "exposition_universelle_1900"
        //When
        let testFunction = cutWithExposition.decodeJSON
        //Then
        XCTAssertNoThrow(try testFunction(fileName))
    }
    
    func test_파일이름이items일때_에러를던지지않는다() {
        //Given
        let fileName = "items"
        //When
        let testFunction = cutWithItems.decodeJSON
        //Then
        XCTAssertNoThrow(try testFunction(fileName))
    }
    
    func test_파일이름이exposition블라블라일때_Exposition의title은_파리만국박람회블라블라() {
        //Given
        let fileName = "exposition_universelle_1900"
        let expectedInputValue = "파리 만국박람회 1900(L'Exposition de Paris 1900)"
        //When
        let expectedResult = try? cutWithExposition.decodeJSON(fileName: fileName)
        //Then
        XCTAssertEqual(expectedInputValue, expectedResult?.title)
    }
    
    func test_파일이름이items일때_Item의첫번째요소의타이틀은_직지심체요절이다() {
        //Given
        let fileName = "items"
        let expectedInputValue = "직지심체요절"
        //When
        let expectedResult = try? cutWithItems.decodeJSON(fileName: fileName).first?.name
        //Then
        XCTAssertEqual(expectedInputValue, expectedResult)
    }
    
    func test_파일이름이items일때_Item의마지막요소의타이틀은_거문고이다() {
        //Given
        let fileName = "items"
        let expectedInputValue = "거문고"
        //When
        let expectedResult = try? cutWithItems.decodeJSON(fileName: fileName).last?.name
        //Then
        XCTAssertEqual(expectedInputValue, expectedResult)
    }
    
    func test_파일이름이items일때_Item의카운트는_13개이다() {
        //Given
        let fileName = "items"
        let expectedInputValue = 13
        //When
        let expectedResult = try? cutWithItems.decodeJSON(fileName: fileName).count
        //Then
        XCTAssertEqual(expectedInputValue, expectedResult)
    }
    
    func test_파일이름이items일때_name이_직지심체요절인요소가있다() {
        //Given
        let fileName = "items"
        let expectedInputValue = "직지심체요절"
        //When
        let decodedItems = try? cutWithItems.decodeJSON(fileName: fileName)
        let expectedResult = decodedItems?.contains { item in
            item.name == expectedInputValue
        }
        //Then
        XCTAssertTrue(expectedResult == true)
    }
}
