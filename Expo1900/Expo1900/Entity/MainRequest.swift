//
//  MainRequest.swift
//  Expo1900
//
//  Created by 최정민 on 2021/04/06.
//

import Foundation

struct MainRequest: Decodable {
    var titleKorean: String
    var titleEngilsh: String
    var photo: String
    var numberOfVisitor: Int
    var venue: String
    var venuePeriod: String
    var content: String
}

