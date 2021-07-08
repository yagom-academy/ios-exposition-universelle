//
//  ParsingError.swift
//  Expo1900
//
//  Created by JINHONG AN on 2021/07/08.
//

import Foundation

enum ParsingError: Error {
    case dataSetNotFound
    case decodingFailed
    case invalidType
    case unknown
}
