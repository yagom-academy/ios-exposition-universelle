//
//  ExhibitOfKorea.swift
//  Expo1900
//
//  Created by 최정민 on 2021/04/07.
//

import Foundation

struct ExhibitOfKorea: Decodable {
    var exhibitItems: [ExhibitItem]
}

struct ExhibitItem: Decodable {
    var name: String
    var image_name: String
    var short_desc: String
    var desc: String
}
