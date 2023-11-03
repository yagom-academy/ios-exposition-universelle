//
//  exposition.swift
//  Expo1900
//
//  Created by Hisop on 2023/10/31.
//

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let explanation: String
    
    var titleWithNewLine: String {
        guard let index = title.firstIndex(of: "(") else {
            return title
        }
        
        return "\(title.prefix(upTo: index))\n\(title.suffix(from: index))"
    }
    
    enum CodingKeys: String, CodingKey {
        case title, visitors, location, duration
        case explanation = "description"
    }
}
