//
//  String.swift
//  Expo1900
//
//  Created by hy on 2022/10/28.
//

import Foundation
extension String {
    func insertedLineBreak(at character: Character) -> String {
        guard let index = self.firstIndex(of: character) else {
            return ""
        }
        let lineBreak: Character = "\n"
        var value: String = self
        value.insert(lineBreak, at: index)
        return value
    }
}
