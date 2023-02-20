//
//  ImageContent.swift
//  Expo1900
//
//  Created by kokkilE, rilla on 2023/02/20.
//

struct ImageContent: Decodable {
    let images: [Image]
    let info: Info
    
    struct Image: Decodable {
        let filename: String
        let idiom: String
        let scale: String
    }
    
    struct Info: Decodable {
        let author: String
        let version: Int
    }
}
