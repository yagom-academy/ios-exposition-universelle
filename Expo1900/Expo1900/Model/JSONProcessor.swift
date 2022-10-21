//  Expo1900 - JSONProcessor.swift
//  Created by Ayaan, Bella on 2022/10/21.
//  Copyright © yagom academy. All rights reserved.

import UIKit

struct JSONProcessor {
    private init() {}
    static func process<T>(_ dataType: T.Type, dataName: String) throws -> T where T: Decodable {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: dataName) else {
            throw JSONProcessorError.invalidDataName
        }
        let decoder: JSONDecoder = JSONDecoder()

        return try decoder.decode(T.self, from: dataAsset.data)
    }
}

enum JSONProcessorError: Error {
    case invalidDataName
}
