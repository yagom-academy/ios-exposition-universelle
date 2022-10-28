//  Expo1900 - String.swift
//  Created by Ayaan, Bella on 2022/10/28.
//  Copyright © yagom academy. All rights reserved.

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
