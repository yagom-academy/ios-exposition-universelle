//
//  DataRepository.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/21.
//

import Foundation

protocol DataRepository {
    static func fetch<T: Codable>(fileName: String, parsedItems: T) -> T?
}
