//
//  ExpositionUniverselle.swift
//  Expo1900
//
//  Created by idinaloq, hoon on 2023/06/26.
//

struct ExpositionUniverselle: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let totalDescription: String
    
    enum CodingKeys: String, CodingKey {
        case title, visitors, location, duration
        case totalDescription = "description"
    }
}
