//
//  Item.swift
//  Item
//
//  Copyright (c) 2022 제이푸시, Minii All rights reserved.

struct Item: Decodable {
    let name: String
    let imageName: String
    let summary: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case summary = "short_desc"
        case description = "desc"
    }
}
