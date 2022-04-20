//
//  extension+Array.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/18.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        if self.count <= index || Int.zero > index {
            return nil
        }
        return self[index]
    }
}
