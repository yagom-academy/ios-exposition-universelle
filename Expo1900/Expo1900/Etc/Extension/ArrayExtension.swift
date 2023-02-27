//
//  ArrayExtension.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/27.
//

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
