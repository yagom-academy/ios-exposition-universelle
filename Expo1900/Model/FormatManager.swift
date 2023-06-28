//
//  FormatManager.swift
//  Expo1900
//
//  Created by Hemg, RedMango on 2023/06/28.
//

import Foundation

struct FormatManager {
    let numberFormatter: NumberFormatter = {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter
    }()
}
