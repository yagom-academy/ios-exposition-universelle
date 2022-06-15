//
//  ExpoItemModelsTests.swift
//  ExpoItemModelsTests
//
//  Created by 재재, 보리사랑 on 2022/06/15.
//

import XCTest
@testable import ExpoItemModelsTests

class ExpoItemModelsTests: XCTestCase {
    
    func testExample() throws {
        guard let fileLocation = Bundle.main.url(forResource: fileName, withExtension: extensionName) else {
            return nil
        }
        
        do{
            let data = try Data(contentsOf: fileLocation)
            return data
        } catch {
            return nil
        }
        
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode([ExpoItemElement].self, from: data ?? Data())
            ExpoItemElement = decodedData
        } catch {
            print("error")
            return
        }
    }
}
