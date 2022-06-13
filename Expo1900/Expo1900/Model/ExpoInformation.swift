//
//  ExpoInformation.swift
//  Expo1900
//
//  Created by 김동용 on 2022/06/13.
//

import Foundation

struct ExpoInformation: Codable {
    var title: String
    var visitors: Int
    var location: String
    var duration: String
    var description: String
}
