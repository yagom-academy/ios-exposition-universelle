//
//  ExpositionUniverselle.swift
//  Expo1900
//
//  Created by mmim, Minseong.
//

import Foundation

struct ExpoInformation: Codable {
    let title: String?
    let visitors: Int?
    let location: String?
    let duration: String?
    let description: String?
    
    init(title: String? = nil,
         visitors: Int? = nil,
         location: String? = nil,
         duration: String? = nil,
         description: String? = nil)
    {
        self.title = title
        self.visitors = visitors
        self.location = location
        self.duration = duration
        self.description = description
    }
}
