//
//  JSONParse.swift
//  Expo1900
//
//  Created by 김동욱 on 2022/04/12.
//

import Foundation
import UIKit

protocol JsonDecoder where Self: Codable {
    static func parse(name: String) -> Self?
}

extension JsonDecoder {
    static func parse(name: String) -> Self? {
        guard let asset = NSDataAsset(name: name) else {
            return nil
        }
        let jsonData = try? JSONDecoder().decode(Self.self, from: asset.data)
        
        return jsonData
    }
}
