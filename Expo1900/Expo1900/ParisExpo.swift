//
//  ParisExpo.swift
//  Expo1900
//
//  Created by Rowan, 리지 on 2023/02/20.
//

struct ParisExpo: Decodable {
    struct Data: Decodable {
        let filename: String
        let idiom: String
    }
    
    struct Information: Decodable {
        let author: String
        let version: Int
    }
    
    let data: [Data]
    let info: Information
    
}
