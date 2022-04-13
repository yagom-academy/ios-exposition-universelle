//
//  JSONParse.swift
//  Expo1900
//
//  Created by malrang, cathy on 2022/04/12.
//

import Foundation
import UIKit

extension Decodable {
    static func parse(_ name: String) -> Self? {
        guard let asset = NSDataAsset(name: name) else {
            return nil
        }
        let jsonData = try? JSONDecoder().decode(Self.self, from: asset.data)

        return jsonData
    }
}
