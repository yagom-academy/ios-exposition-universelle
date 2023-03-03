//
//  Expo1900 - Int+.swift
//  Created by Christy, Rhode.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

extension Int {
    func insertComma() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: self as NSNumber) ?? String(self)
    }
}
