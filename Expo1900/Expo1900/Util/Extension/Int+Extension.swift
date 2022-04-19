//
//  Int+Extension.swift
//  Expo1900
//
//  Created by mmim, Minseong.
//

import Foundation

extension Int {
    func formatString() throws -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let numberOfVisitors = numberFormatter.string(for: self) else {
            throw DecodingError.unformattedType
        }
        
        return "\(numberOfVisitors) 명"
    }
}
