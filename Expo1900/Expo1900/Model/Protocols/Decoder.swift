//
//  Decoder.swift
//  Expo1900
//
//  Created by Jeremy, 준호 on 2022/10/28.
//

import UIKit.NSDataAsset

protocol Decoder { }

extension Decoder {
    
    func configureFromJson<T: Decodable>(assetName: String, type: T?) -> T? {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: assetName) else { return nil }
        let jsonDecoder: JSONDecoder = JSONDecoder ()
        guard let data =  try? jsonDecoder.decode(T?.self, from: dataAsset.data) else { return nil }
        return data
    }
}
