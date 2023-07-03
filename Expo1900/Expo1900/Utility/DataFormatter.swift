//
//  DataFormatter.swift
//  Expo1900
//
//  Created by Dasan & Moon on 2023/06/30.
//

import Foundation

struct DataFormatter {
    static let decimalStyle: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter
    }()
}
