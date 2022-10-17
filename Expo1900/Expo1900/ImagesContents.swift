//
//  ImagesContents.swift
//  Expo1900
//
//  Created by baem,woong on 2022/10/17.
//

struct ImagesContents: Codable {
    struct Images: Codable {
        let filename: String
        let idiom: String
        let scale: String
    }
    
    struct Info: Codable {
        let author: String
        let version: Int
    }
    
    let images: [Images]
    let info: [Info]
}
