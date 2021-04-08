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
    private var sut_Item: [Item]?

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        try setUpWithError()
        sut_Expo = nil
        sut_Item = nil
    }
    
    func test_ExpoData() {
        guard let asset = NSDataAsset.init(name: "exposition_universelle_1900") else {
            return
        }
        do {
            sut_Expo = try JSONDecoder().decode(Expo.self, from: asset.data)
            XCTAssertEqual(sut_Expo?.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)" )
        } catch {
        }
    }
    
    func test_itemData() {
        guard let asset = NSDataAsset.init(name: "items") else {
            return
        }
        do {
            sut_Item = try JSONDecoder().decode([Item].self, from: asset.data)
            XCTAssertEqual(sut_Item?.first?.name, "직지심체요절")
        } catch {
            
        }
    }
}
