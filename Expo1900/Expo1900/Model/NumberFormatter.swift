//
//  NumberFormatter.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/20.
//

import Foundation
enum ExpoNumberFormatter {
    private static let numberFomatter = NumberFormatter()
    
    static func changeVisitorsFormat(from visitor: Int) -> String? {
        numberFomatter.numberStyle = .decimal
        guard let changedNumber = numberFomatter.string(from: visitor as NSNumber) else { return nil }
        
        return changedNumber + " 명"
    }
}
