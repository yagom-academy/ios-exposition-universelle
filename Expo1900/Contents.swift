//
//  Contents.swift
//  Expo1900
//
//  Created by 오승기 on 2021/07/06.
//

import Foundation

struct Contents: Codable {
    
    struct Images: Codable {
        let filename: String
        let idiom: String
        let scale: String?      // 어느 파일이 nil일지 아닐지 모른데 모든 상수마다 옵셔널로 처리해줘야 하나요??
    }
    
    struct Info: Codable {
        let author: String
        let version: String
    }
    
    let images: Images
    let info:   Info
}
