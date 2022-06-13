//
//  ImageEntity.swift
//  Expo1900
//
//  Created by Baek on 2022/06/13.
//

import Foundation

struct FileEntity: Codable {
    let data: [FileInfo]
    let info: FrameworkInfo
}

struct FileInfo: Codable {
    let fileName: String
    let idiom: String
    let scale: String?
}

struct FrameworkInfo: Codable {
    let author: String
    let version: Int
}
