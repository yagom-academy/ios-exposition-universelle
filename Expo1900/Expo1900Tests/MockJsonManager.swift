//
//  MockJsonManager.swift
//  Expo1900Tests
//
//  Created by 우롱차, marisol on 2022/04/13.
//

import UIKit
@testable import Expo1900

struct MockJsonManager: JsonManagerable {
    func decodedResult() throws -> [Item] {
        throw ExpoError.noFileError
    }
    
    func decodedResult() throws -> ExpositionInfo {
        throw ExpoError.decodingError
    }
}
