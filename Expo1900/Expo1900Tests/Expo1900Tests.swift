//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by 윤재웅 on 2021/04/12.
//

import XCTest
import Foundation
@testable import Expo1900

final class Expo1900Tests: XCTestCase {
    
    private var decoder: JSONDecoder?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        decoder = JSONDecoder()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        decoder = nil
    }

    func test_KoreaEntryTitle() {
        guard let assetData = NSDataAsset(name: "items") else { return }
        do {
            let data = try decoder?.decode([StateEntry].self, from: assetData.data)
            XCTAssertEqual(data?.first?.name, "직지심체요절")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func test_KoreaEntryImage() {
        guard let assetData = NSDataAsset(name: "items") else { return }
        do {
            let data = try decoder?.decode([StateEntry].self, from: assetData.data)
            XCTAssertEqual(data?.first?.imageName, "jikji")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func test_ExpoTitle() {
        guard let assetData = NSDataAsset(name: "exposition_universelle_1900") else { return }
        do {
            let data = try decoder?.decode(Expo.self, from: assetData.data)
            XCTAssertEqual(data?.title, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // fail
    func test_ExpoLocation() {
        guard let assetData = NSDataAsset(name: "exposition_universelle_1900") else { return }
        do {
            let data = try decoder?.decode(Expo.self, from: assetData.data)
            XCTAssertEqual(data?.location, "Seoul")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func test_ExpoVisitors() {
        guard let assetData = NSDataAsset(name: "exposition_universelle_1900") else { return }
        do {
            let data = try decoder?.decode(Expo.self, from: assetData.data)
            XCTAssertEqual(data?.visitors, 48130300)
        } catch {
            print(error.localizedDescription)
        }
    }
}

