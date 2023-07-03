//
//  Int+.swift
//  Expo1900
//
//  Created by 박종화 on 2023/07/03.
//

import Foundation

extension Int {
    var expositionFormat: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
