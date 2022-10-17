//
//  DataContents.swift
//  Expo1900
//
//  Created by baem,woong on 2022/10/17.
//

struct DataContents: Codable {
    struct Data: Codable {
        let filename: String
        let idiom: String
    }
    
    struct Info: Codable {
        let author: String
        let version: Int
    }
    
    let data: [Data]
    let info: Info
}
