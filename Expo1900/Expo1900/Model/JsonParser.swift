//
//  JsonParser.swift
//  Expo1900
//
//  Created by Baek on 2022/06/14.
//


import UIKit

enum JsonParser {
    static func fetch(_ fileName: String) -> ExpositionPostEntity? {
        let jsonDecoder = JSONDecoder()
        var expositionPostEntity: ExpositionPostEntity?
        
        if let asset = NSDataAsset.init(name: fileName) {
            do {
                expositionPostEntity = try jsonDecoder.decode(ExpositionPostEntity.self, from: asset.data)
            } catch {
                print(error.localizedDescription)
            }
        }
        return expositionPostEntity
    }
}
