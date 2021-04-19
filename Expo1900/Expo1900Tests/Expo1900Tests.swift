//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by 배은서 on 2021/04/07.
//

import XCTest
@testable import Expo1900

class Expo1900Tests: XCTestCase {

    var decoder = JSONDecoder()
    
    func test_expoInfo_decoding() {
        guard let dataAsset = NSDataAsset.init(name: "exposition_universelle_1900") else {
            XCTFail("File Not Found")
            return
        }
        
        do {
            let expoInfo = try decoder.decode(ExpoInfo.self, from: dataAsset.data)
            XCTAssertEqual(expoInfo.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
            XCTAssertEqual(expoInfo.visitors, 48130300)
        } catch {
            XCTFail("Fail Decoding")
        }
    }
    
    func test_entryWorkItem_decoding() {
        var entryWorkItems: [EntryWorkItem]
        guard let dataAsset = NSDataAsset.init(name: "items") else {
            XCTFail("File Not Found")
            return
        }
        
        do {
            entryWorkItems = try decoder.decode([EntryWorkItem].self, from: dataAsset.data)
            XCTAssertEqual(entryWorkItems[0].name, "직지심체요절")
        } catch {
            XCTFail("Fail Decoding")
        }
    }

}
