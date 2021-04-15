//
//  File.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/16.
//

import Foundation
import UIKit

enum JsonFetcher {
    static func fetchJsonData<DecodeType: Decodable>(dataAssetName: String, completionHandler: (Result<DecodeType, JsonDecodingError>) -> Void) {
        guard let data = NSDataAsset(name: dataAssetName)?.data else {
            completionHandler(.failure(.wrongJsonFileName(fileName: "\(dataAssetName)")))
            return
        }
        guard let decodedData = try? JSONDecoder().decode(DecodeType.self, from: data) else {
            completionHandler(.failure(.jsonFormatFailed(fileName: "\(dataAssetName)")))
            return
        }
        completionHandler(.success(decodedData))
    }
}
