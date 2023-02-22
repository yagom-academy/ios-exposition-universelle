//
//  Exposition.swift
//  Expo1900
//
//  Created by kokkilE, rilla on 2023/02/20.
//

struct Exposition: Decodable {
    
    let title: String
    let accumulatedVisitor: Int
    let location: String
    let duration: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case accumulatedVisitor = "visitors"
        case location
        case duration
        case description
    }
}
