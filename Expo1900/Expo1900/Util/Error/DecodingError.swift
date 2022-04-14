//
//  DecodingError.swift
//  Expo1900
//
//  Created by mmim, Minseong.
//

import Foundation

enum DecodingError: Error, LocalizedError {
    case fileNameNotFound
    case decodeError
    case unformattedType
}
