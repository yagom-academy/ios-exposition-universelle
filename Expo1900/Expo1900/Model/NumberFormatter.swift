//
//  NumberFormatter.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/20.
//

import Foundation
struct ExpoNumberFormatter {
    static let shared = NumberFormatter()
    
    static func changeVisitorsFormat(from visitor: Int) -> String? {
        shared.numberStyle = .decimal
        guard let changedNumber = shared.string(from: visitor as NSNumber) else { return nil }
        
        return changedNumber + " 명"
    }
}
