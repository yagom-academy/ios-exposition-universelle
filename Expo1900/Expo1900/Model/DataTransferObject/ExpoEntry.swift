//
//  ExpoEntry.swift
//  Expo1900
//
//  Created by yyss99, kyungmin on 2023/06/27.
//

struct ExpoEntry: Decodable {
    let name: String
    let imageName: String
    let shortEntryDescription: String
    let entryDescription: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortEntryDescription = "short_desc"
        case entryDescription = "desc"
    }
}
