//
//  expositionUiverselle1900.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/06.
//

import Foundation

struct ExpositionUnivereselle1900: Decodable {
    var title: String = DefaultValues.text
    var visitors: Int = DefaultValues.number
    var location: String = DefaultValues.text
    var duration: String = DefaultValues.text
    var description: String = DefaultValues.text
}
