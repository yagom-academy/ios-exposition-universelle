//
//  extension+Int.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/18.
//

import Foundation

extension Int {
    func changeVisitorsFormat() -> String? {
        let numberFormmater = NumberFormatter()
        numberFormmater.numberStyle = .decimal
        guard let changedNumber = numberFormmater.string(from: self as NSNumber) else { return nil }
        
        return changedNumber + " 명"
    }
}
