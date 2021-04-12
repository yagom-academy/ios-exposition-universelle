//
//  expositionUiverselle1900.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/06.
//

import Foundation

struct ExpositionUnivereselle1900: Decodable {
    var title: String
    var visitors: Int
    var location: String
    var duration: String
    var description: String
    
    init() {
        title = DefaultValues.text
        visitors = DefaultValues.number
        location = DefaultValues.text
        duration = DefaultValues.text
        description = DefaultValues.text
    }
}
