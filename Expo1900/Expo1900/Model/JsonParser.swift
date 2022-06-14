//
//  JsonParser.swift
//  Expo1900
//
//  Created by Baek on 2022/06/14.
//

import Foundation

enum JsonParser {
    static func fetch(_ fileName: String) -> Data? {
        let extensionType = "json"
        
        guard let fileLocation = Bundle.main.url(forResource: fileName, withExtension: extensionType) else {
            return nil
        }
        
        do {
            let data = try Data(contentsOf: fileLocation)
            return data
        } catch {
            return nil
        }
    }
}
