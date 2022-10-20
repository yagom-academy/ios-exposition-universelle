//
//  Item.swift
//  Expo1900

struct Item: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let itemDescription: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case itemDescription = "desc"
    }
}
