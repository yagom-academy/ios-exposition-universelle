//
//  Error.swift
//  Expo1900
//
//  Created by 천수현 on 2021/04/06.
//

import Foundation

enum JsonDecodingError: Error {
    case dataCorrupted(context: String)
    case failToFormatJSON(context: String)
    case wrongJSONFileName(fileName: String)
    case keyNotFound(key: String, context: String)
    case valueNotFound(value: String, context: String)
}
