//
//  Collection.swift
//  Expo1900
//
//  Created by hyunMac on 11/8/23.
//

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
