//
//  DecodableExtension.swift
//  Expo1900
//
//  Created by 사파리, 파프리 on 14/04/2022.
//

import Foundation

extension Decodable {
    func parsingJson(name: String) -> Self? {
        guard let path = Bundle.main.path(forResource: name, ofType: "json") else { return nil }
        guard let jsonString = try? String(contentsOfFile: path) else { return nil }
        guard let data = jsonString.data(using: .utf8) else { return nil }
        let jsonDecoder = JSONDecoder()
        
        return try? jsonDecoder.decode(Self.self, from: data)
    }
}
