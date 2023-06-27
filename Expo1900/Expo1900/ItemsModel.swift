//
//  ItemsModel.swift
//  Expo1900
//
//  Created by Minseong Kang on 2023/06/27.
//

struct ItemsModel {
	let name: String
	let imageName: String
	let shortDesc: String
	let desc: String
	
	enum CodingKeys: String, CodingKey {
		case name, desc
		case imageName = "image_name"
		case shortDesc = "short_desc"
	}
}
