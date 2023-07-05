//
//  Data.swift
//  Expo1900
//
//  Created by mint, Yetti on 2023/07/03.
//

struct Data {
    static func unwrap<T: Decodable>(initialValue: T, file: String) -> T {
        do {
            let data = try T.decode(file)
            return data
        } catch {
            print(error.localizedDescription)
            return initialValue
        }
    }
}
