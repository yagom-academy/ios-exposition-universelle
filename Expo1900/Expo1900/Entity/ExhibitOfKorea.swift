//
//  ExhibitOfKorea.swift
//  Expo1900
//
//  Created by 최정민 on 2021/04/07.
//

import Foundation

struct ExhibitOfKorea: Decodable {
    var items: [item]
}

struct item: Decodable {
    var name: String
    var imageName: String
    var shortDescription: String
    var description: String
}
