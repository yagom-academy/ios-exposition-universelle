//
//  extension+Decodable.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/12.
//

import Foundation
import UIKit

extension Decodable {
    static func decode(with assetName: String) -> Self? {
        guard let asset = NSDataAsset.init(name: assetName) else { return nil }
        
        let decoder = JSONDecoder()
        let data = try? decoder.decode(Self.self, from: asset.data)
        return data
    }
}
