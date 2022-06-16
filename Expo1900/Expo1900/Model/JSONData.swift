//
//  Parser.swift
//  Expo1900
//
//  Created by 수꿍, yeton on 2022/06/16.
//

import UIKit

struct JSONData {
    static func parse<T>(name: String, to parsedItems: T) -> T? where T: Decodable {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        let parsedItemsType = type(of: parsedItems)

        guard let dataAsset: NSDataAsset = NSDataAsset(name: name) else {
            return nil
        }

        do {
            let data = try jsonDecoder.decode(parsedItemsType.self, from: dataAsset.data)
            return data
        } catch {
            self.handleError(error)
            return nil
        }
    }

    static func parse<T>(name: String, to parsedItems: [T]) -> [T]? where T: Decodable {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        let parsedItemsType = type(of: parsedItems)

        guard let dataAsset: NSDataAsset = NSDataAsset(name: name) else {
            return nil
        }

        do {
            let data = try jsonDecoder.decode(parsedItemsType.self, from: dataAsset.data)
            return data
        } catch {
            self.handleError(error)
            return nil
        }
    }

    static private func handleError(_ error: Error) {
        switch error {
        case EXPOError.decoding:
            print(EXPOError.decoding.localizedDescription)
        default:
            print("unknown error!!")
        }
    }
}



