//
//  File.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/05.
//

import Foundation

struct Content: Decodable {
    
    struct Image: Decodable {
        let filename: String
        let idiom: String?
        let scale: String?
    }
    
    struct Info: Decodable {
        let author: String?
        let version: Int?
    }
    
    let images: [Image]?
    let info: Info?

}
