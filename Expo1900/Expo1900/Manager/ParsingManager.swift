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
    func parsing<T: Codable>(about type: T.Type) -> Result<[T], ParsingError> {
        switch type {
        case is ExpoIntroduction.Type:
            do {
                let assetData = try bringAsset(name: expoIntroductionFileName)
                let parsedData = try decode(from: assetData, to: type, isArray: false)
                return .success(parsedData)
            } catch {
                return .failure(.decodingFailed)
            }
        case is ExpoEntry.Type:
            do {
                let assetData = try bringAsset(name: expoEntryFileName)
                let parsedData = try decode(from: assetData, to: type, isArray: true)
                return .success(parsedData)
            } catch {
                return .failure(.unknown)
            }
        default:
            return .failure(.invalidType)
        }
    }
    
    private func bringAsset(name fileName: String) throws -> Data {
        guard let asset = NSDataAsset(name: fileName) else {
            throw ParsingError.dataSetNotFound
        }
        return asset.data
    }
    
    private func decode<T: Codable>(from data: Data, to parsedType: T.Type, isArray: Bool) throws -> [T] {
        if isArray {
            let decodedResult = try jsonDecoder.decode([T].self, from: data)
            return decodedResult
        } else {
            var parsedData = [T]()
            let decodedResult = try jsonDecoder.decode(T.self, from: data)
            parsedData.append(decodedResult)
            return parsedData
        }
    }
}
