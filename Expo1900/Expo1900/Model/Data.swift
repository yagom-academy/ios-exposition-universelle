//
//  Data.swift
//  Expo1900
//
//  Created by mint, Yetti on 2023/07/03.
//

import Foundation

struct Data {
    static func unwrap<T: Decodable>(type: T, file: String) -> T {
        do {
            let data = try T.decode(file)
            return data
        } catch {
            print(error.localizedDescription)
            return type
        }
    }
}
