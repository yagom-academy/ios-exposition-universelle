//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by 이영우 on 2021/04/06.
//

import XCTest
import Foundation
@testable import Expo1900

class Expo1900Tests: XCTestCase {

    var decoder: JSONDecoder!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        decoder = JSONDecoder()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        decoder = nil
    }

    func test_itemAssetName() {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else { return }
        do {
            let result = try decoder.decode([Item].self, from: dataAsset.data)
            XCTAssertEqual(result.first?.name, "직지심체요절")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func test_itemAssetImageName() {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else { return }
        do {
            let result = try decoder.decode([Item].self, from: dataAsset.data)
            XCTAssertEqual(result.first?.imageName, "jikji")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func test_expositionAssetTitle() {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        do {
            let result = try decoder.decode(Exposition.self, from: dataAsset.data)
            XCTAssertEqual(result.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func test_expositionAssetVisitors() {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        do {
            let result = try decoder.decode(Exposition.self, from: dataAsset.data)
            XCTAssertEqual(result.visitors, 48130300)
        } catch {
            print(error.localizedDescription)
        }
    }
}
