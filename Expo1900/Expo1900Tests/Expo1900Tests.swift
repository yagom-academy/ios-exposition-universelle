//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by 황인우 on 2021/04/07.
//

import XCTest
@testable import Expo1900
class Expo1900Tests: XCTestCase {
    private var sut_Expo: Expo?
    private var sut_Exhibit: [Exhibit]?

    override func setUpWithError() throws {
        try setUpWithError()
        sut_Exhibit = sut_Exhibit!
        sut_Expo = sut_Expo!
    }

    override func tearDownWithError() throws {
        try setUpWithError()
        sut_Expo = nil
        sut_Exhibit = nil
    }
    
    func test_parsingValidExpoData() {
        guard let asset = NSDataAsset.init(name: "exposition_universelle_1900") else {
            return
        }
        do {
            sut_Expo = try JSONDecoder().decode(Expo.self, from: asset.data)
            XCTAssertEqual(sut_Expo?.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)" )
        } catch {
        }
    }
    
    func test_ParsingValidExhibitData() {
        guard let asset = NSDataAsset.init(name: "items") else {
            return
        }
        do {
            sut_Exhibit = try JSONDecoder().decode([Exhibit].self, from: asset.data)
            XCTAssertEqual(sut_Exhibit?.first?.name, "직지심체요절")
        } catch {
            
        }
    }
}
