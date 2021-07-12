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
    
    let cutWithExposition = ExpositionTest()
    let cutWithItems = ItemTest()
    
    func test_파일이름이exposition블라블라일때_Exposition의title은_파리만국박람회블라블라() {
        //Given
        let fileName = "exposition_universelle_1900"
        let expectInputValue = "파리 만국박람회 1900(L'Exposition de Paris 1900)"
        //When
        let expectResult = try? cutWithExposition.decodeJSON(fileName: fileName)
        //Then
        XCTAssertEqual(expectInputValue, expectResult?.title)
    }
    
    func test_파일이름이itesm일때_Item의첫번째요소의타이틀은_직지심체요절이다() {
        //Given
        let fileName = "items"
        let expectInputValue = "직지심체요절"
        //When
        let expectResult = try? cutWithItems.decodeJSON(fileName: fileName).first?.name
        //Then
        XCTAssertEqual(expectInputValue, expectResult)
    }
    
    func test_파일이름이itesm일때_Item의마지막요소의타이틀은_거문고이다() {
        //Given
        let fileName = "items"
        let expectInputValue = "거문고"
        //When
        let expectResult = try? cutWithItems.decodeJSON(fileName: fileName).last?.name
        //Then
        XCTAssertEqual(expectInputValue, expectResult)
    }
    
    func test_파일이름이itesm일때_Item의카운트는_13개이다() {
        //Given
        let fileName = "items"
        let expectInputValue = 13
        //When
        let expectResult = try? cutWithItems.decodeJSON(fileName: fileName).count
        //Then
        XCTAssertEqual(expectInputValue, expectResult)
    }
}
