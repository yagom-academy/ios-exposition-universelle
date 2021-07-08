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
    
    private init() {}
    
    func parsing<T: Codable>(about type: T.Type) -> Result<[T], ParsingError> {
        
        let jsonDecoder = JSONDecoder()
        var parsedData = [T]()
        switch type {
        case is ExpoIntroduction.Type:
            guard let asset = NSDataAsset(name: "exposition_universelle_1900") else {
                return .failure(.dataSetNotFound)
            }
            let data = asset.data
            do {
                let result = try jsonDecoder.decode(T.self, from: data)
                parsedData.append(result)
                return .success(parsedData)
            } catch {
                return .failure(.decodingFailed)
            }
        case is ExpoEntry.Type:
            break
        default:
            return .failure(.invalidType)
        }
        return .failure(.unknown)
    }
}
