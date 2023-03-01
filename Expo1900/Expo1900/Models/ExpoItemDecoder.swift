//
//  ExpoItemDecoder.swift
//  Expo1900
//
//  Created by 세홍, 송준, 무리 on 2023/02/24.
//

import UIKit

struct ExpoItemDecoder {
    private(set) var expoItems: [ExpoItem] = []
    
    mutating func decodeData() throws {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else { return }
        
        do {
            expoItems = try jsonDecoder.decode([ExpoItem].self, from: dataAsset.data)
        } catch {
            throw DecodeError.expoItemDecodeError
        }
    }
}
