//
//  ExpoInformation.swift
//  Expo1900
//
//  Created by yyss99, kyungmin on 2023/06/27.
//

struct ExpoInformation: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let expoDescription: String
    
    private enum CodingKeys: String, CodingKey {
        case title, visitors, location, duration
        case expoDescription = "description"
    }
}
