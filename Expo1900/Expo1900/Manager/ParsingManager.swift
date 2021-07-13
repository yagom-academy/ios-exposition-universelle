//
//  ParsingManager.swift
//  Expo1900
//
//  Created by 이윤주 on 2021/07/08.
//

import UIKit

class ParsingManager {
    //MARK: Singleton Instance
    static let shared = ParsingManager()
    
    //MARK: Properties
    private let expoIntroductionFileName = "exposition_universelle_1900"
    private let expoEntryFileName = "items"
    private let jsonDecoder = JSONDecoder()
    
    //MARK: Initializer
    private init() {}
}

//MARK:- Parse JSON
extension ParsingManager {
    func parse<T: Codable>(from fileName: String, to type: T.Type) -> Result<T, ParsingError> {
        guard let asset = NSDataAsset(name: fileName) else {
            return .failure(.dataSetNotFound)
        }
        guard let data = try? jsonDecoder.decode(type, from: asset.data) else {
            return .failure(.decodingFailed)
        }
        
        return .success(data)
    }
}
