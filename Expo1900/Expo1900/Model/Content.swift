//
//  File.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/05.
//

import Foundation

struct Content: Decodable {
    
    struct Image: Decodable {
        let fileName: String
        let idiom: String
        let scale: String
        
        private enum CodingKeys: String, CodingKey {
            case fileName = "filename"
            case idiom, scale
        }
    }
    
    struct Info: Decodable {
        let author: String?
        let version: Int?
    }
    
    struct Data: Decodable {
        let fileName: String
        let idiom: String
        
        private enum CodingKeys: String, CodingKey {
            case fileName = "filename"
            case idiom
        }
    }
    
    let images: [Image]?
    let info: Info?
    let data: [Data]?
}
