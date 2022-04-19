//
//  extension+Array.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/18.
//

import Foundation

extension Array where Element == Item {
    subscript(safe index: Int) -> Item {
        if self.count > index {
            return self[index]
        }
        return Item(name: "알수없음", imageName: "알수없음", shortDescription: "알수없음", description: "알수없음")
    }
}
