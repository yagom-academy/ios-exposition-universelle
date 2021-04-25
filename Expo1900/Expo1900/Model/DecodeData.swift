//
//  DecodeData.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/22.
//

import Foundation
import UIKit

protocol JsonDecoding {
    func jsonDecode<T>(assetName: String) throws -> Result<T, ExpoError> where T: Decodable
}

extension JsonDecoding {
    func jsonDecode<T>(assetName: String) throws -> Result<T, ExpoError> where T: Decodable {
        guard let dataAsset = NSDataAsset(name: assetName) else {
            return .failure(ExpoError.expoData)
        }
        return .success(try JSONDecoder().decode(T.self, from: dataAsset.data))
    }
}
