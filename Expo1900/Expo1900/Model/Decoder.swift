//
//  Decoder.swift
//  Expo1900
//
//  Created by MARY, KOBE on 2023/07/03.
//

import UIKit

struct Decoder {
	static func decodeJSON<`Data`: Decodable>(dataAssetName: String) throws -> `Data` {
		let jsonDecoder: JSONDecoder = JSONDecoder()
		
		guard let dataAsset = NSDataAsset(name: dataAssetName) else {
			throw DecodeError.NotFoundFile
		}
		
		do {
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
			let decodeData = try jsonDecoder.decode(`Data`.self, from: dataAsset.data)
			
            return decodeData
		} catch {
			throw DecodeError.FailedDecode
		}
	}
}
