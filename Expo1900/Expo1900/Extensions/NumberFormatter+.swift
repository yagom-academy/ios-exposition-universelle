//
//  NumberFormatter+.swift
//  Expo1900
//
//  Created by Yejin Hong on 3/13/24.
//

import Foundation

extension NumberFormatter {
    func string(with number: Int) -> String {
        self.numberStyle = .decimal
        return (self.string(for: number) ?? "0") + "명"
    }
}
