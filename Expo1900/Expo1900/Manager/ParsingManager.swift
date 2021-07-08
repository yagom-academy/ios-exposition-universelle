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
    
    func parsing<T: Codable>(about type: T.Type) -> Result<[T], Error> {
        switch type {
        case is ExpoIntroduction.Type:
            guard let asset = NSDataAsset(name: "exposition_universelle_1900") else {
                fatalError()
            }
            let data = asset.data
            print(String(data: data, encoding: .utf8))
            break
        case is ExpoEntry.Type:
            break
        default:
            print("실패")
            break
        }
        return .failure(NSError())
    }
}
