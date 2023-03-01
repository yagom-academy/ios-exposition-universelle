//
//  ExpositionDecoder.swift
//  Expo1900
//
//  Created by 세홍, 송준, 무리 on 2023/02/24.
//

import UIKit

struct ExpositionDecoder {
    private(set) var exposition: Exposition = Exposition(title: "", visitors: 0, location: "", duration: "", description: "")

    mutating func decodeData() throws {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do {
            exposition = try jsonDecoder.decode(Exposition.self, from: dataAsset.data)
        } catch {
            throw DecodeError.expositionDecodeError
        }
    }
}
