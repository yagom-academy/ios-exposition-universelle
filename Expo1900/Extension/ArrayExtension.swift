//
//  ArrayExtension.swift
//  Expo1900
//
//  Created by 우롱차, marisol on 2022/04/19.
//

extension Array {
    public subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
