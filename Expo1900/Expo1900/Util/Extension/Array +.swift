//
//  Array +.swift
//  Expo1900
//
//  Created by Hyungmin Lee on 2023/07/02.
//

extension Array {
    subscript(safe index: Int) -> Element? {
        guard (0..<self.count).contains(index) else { return nil }
        
        return self[index]
    }
}
