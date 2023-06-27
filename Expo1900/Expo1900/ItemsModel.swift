//
//  ItemsModel.swift
//  Expo1900
//
//  Created by MARY, KOBE on 2023/06/27.
//

struct ItemsModel: Decodable {
	let name: String
	let imageName: String
	let shortDescription: String
	let desc: String
	
	enum CodingKeys: String, CodingKey {
		case name, desc
		case imageName = "image_name"
		case shortDescription = "short_desc"
	}
}
