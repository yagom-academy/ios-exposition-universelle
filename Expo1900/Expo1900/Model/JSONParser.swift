//
//  JSONParser.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/16.
//

import UIKit

struct JSONParser {
    static func parseExpoInformation() throws -> ExpoInformation {
        guard let data = NSDataAsset(name: "exposition_universelle_1900")?.data else { throw ParseError.unknown }
        guard let decodedData = try? JSONDecoder().decode(ExpoInformation.self, from: data) else { throw ParseError.unknown  }
        return decodedData
    }
    
    static func parseEntryList() throws -> [EntryList] {
        guard let data = NSDataAsset(name: "items")?.data else { throw ParseError.unknown }
        guard let decodedData = try? JSONDecoder().decode([EntryList].self, from: data) else { throw ParseError.unknown  }
        return decodedData
    }
}
