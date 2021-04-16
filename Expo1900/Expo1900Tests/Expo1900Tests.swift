//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by 황인우 on 2021/04/07.
//

import XCTest
@testable import Expo1900
class Expo1900Tests: XCTestCase {
    private var sut_expo: Expo?
    private var sut_exhibit: [Exhibit]?

    override func setUpWithError() throws {
        try super.setUpWithError()
        guard let expoDataAsset = NSDataAsset.init(name: "exposition_universelle_1900"),
              let exhibitDataAsset = NSDataAsset.init(name: "items") else { return }
        sut_expo = try JSONDecoder().decode(Expo.self, from: expoDataAsset.data)
        sut_exhibit = try JSONDecoder().decode([Exhibit].self, from: exhibitDataAsset.data)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut_expo = nil
        sut_exhibit = nil
    }
    
    func test_parsingValidExpoData() {

        XCTAssertEqual(sut_expo?.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)" )
    }
    
    func test_ParsingValidExhibitData() {

        XCTAssertEqual(sut_exhibit?.first?.name, "직지심체요절")

    }
}
