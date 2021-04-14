//
//  expositionUiverselle1900.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/06.
//

import Foundation

struct ExpositionUnivereselle1900: Decodable {
    var title: String = DefaultJSONValues.text
    var visitors: Int = DefaultJSONValues.number
    var location: String = DefaultJSONValues.text
    var duration: String = DefaultJSONValues.text
    var description: String = DefaultJSONValues.text
}
