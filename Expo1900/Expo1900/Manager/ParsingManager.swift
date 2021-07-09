//
//  ParsingManager.swift
//  Expo1900
//
//  Created by 이윤주 on 2021/07/08.
//

import UIKit

class ParsingManager {
    static let shared = ParsingManager()
    private let expoIntroductionFileName = "exposition_universelle_1900"
    private let expoEntryFileName = "items"
    private let jsonDecoder = JSONDecoder()
    
    private init() {}
}

extension ParsingManager {
    func parse<T: Codable>(name: String, to type: T.Type) -> Result<T, ParsingError> {
        guard let asset: NSDataAsset = NSDataAsset(name: name) else {
            return .failure(.dataSetNotFound)
        }
        guard let data = try? jsonDecoder.decode(type, from: asset.data) else {
            return .failure(.decodingFailed)
        }
        return .success(data)
    }
}
