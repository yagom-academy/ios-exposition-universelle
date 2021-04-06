//
//  JSONDecodable.swift
//  Expo1900
//
//  Created by Ryan-Son on 2021/04/06.
//

import Foundation
import UIKit

protocol JSONDecodable {
    associatedtype T: Decodable
    
    func decode(jsonFileName: String) -> T?
}

extension JSONDecodable {
    func decode(jsonFileName: String) -> T? {
        var decodedResult: T?
        let jsonDecoder = JSONDecoder()
        guard let jsonData: NSDataAsset = NSDataAsset(name: jsonFileName) else { return nil }
        
        do  {
            decodedResult = try jsonDecoder.decode(T.self, from: jsonData.data)
        } catch {
            print(error.localizedDescription)
        }
        
        return decodedResult
    }
}
