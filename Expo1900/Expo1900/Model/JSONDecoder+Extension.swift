//
//  JSONEncoder+Extension.swift
//  Expo1900
//
//  Created by Kiwi, Finnn on 2022/06/16.
//

import Foundation

extension JSONDecoder {
    static func decodeJson<T: Codable>(jsonName: String) -> T? {
        let decoder = JSONDecoder()
        
        guard let fileLocation = Bundle.main.url(forResource: jsonName, withExtension: "json") else { return nil }
        
        do {
            let data = try Data(contentsOf: fileLocation)
            let expoInfo =  try decoder.decode(T.self, from: data)
            return expoInfo
        } catch {
            print(error)
            return nil
        }
    }
}
