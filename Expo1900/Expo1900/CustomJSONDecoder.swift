//
//  CustomJSONDecoder.swift
//  Expo1900
//
//  Created by Ryan-Son on 2021/04/06.
//

import Foundation
import UIKit

class CustomJSONDecoder<T> where T: Decodable {
    private var decodedResult: T?

    public func decode(jsonFileName: String) -> T? {
        let jsonDecoder = JSONDecoder()

        guard let jsonData: NSDataAsset = NSDataAsset(name: jsonFileName) else { return nil }

        do  {
            self.decodedResult = try jsonDecoder.decode(T.self, from: jsonData.data)
        } catch {
            print(error.localizedDescription)
        }

        return self.decodedResult
    }
}
