//
//  ModelTests.swift
//  ModelTests
//
//  Created by 사파리, papri on 12/04/2022.
//

import XCTest
@testable import Expo1900

class ExpoModelTest: XCTestCase {

    func test_parsingJson_작동하는가() {
        //given
        let Expotitle = "파리 만국박람회 1900(L'Exposition de Paris 1900)"
        
        //when
        let title = Expo.parsingJson(name: "exposition_universelle_1900")?.title
        
        //then
        XCTAssertEqual(title, Expotitle)
    }

}

