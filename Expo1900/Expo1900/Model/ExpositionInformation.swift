//
//  Exposition.swift
//  Expo1900
//
//  Created by WANKI KIM on 2021/07/06.
//

import Foundation

struct ExpositionInformation: Codable {
    private(set) var title: String
    private(set) var visitors: UInt
    private(set) var location: String
    private(set) var duration: String
    private(set) var description: String
}
