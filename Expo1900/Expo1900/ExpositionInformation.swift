//
//  ParsingData.swift
//  Expo1900
//
//  Created by iluxsm on 2020/12/21.
//

import Foundation

struct ExpositionInformation: Decodable {
    private let title: String?
    private let visitors: Int?
    private let location: String?
    private let duration: String?
    private let description: String?
}
