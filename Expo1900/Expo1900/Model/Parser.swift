//
//  Parse.swift
//  Expo1900
//
//  Created by 김태훈 on 2022/04/14.
//

import UIKit

struct Parser<T: Decodable> {
    static func parse(name: String) -> T? {
        let decoder = JSONDecoder()
        guard let asset = NSDataAsset(name: name, bundle: .main),
            let expoData = try? decoder.decode(T.self, from: asset.data)
        else {
            return nil
        }
        return expoData
    }
}
