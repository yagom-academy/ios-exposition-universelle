//
//  Int+Extension.swift
//  Expo1900
//
//  Created by leewonseok on 2022/10/21.
//
import Foundation

extension Int {
    var formatNumber: String {
        get throws {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            
            guard let string = formatter.string(for: self) else {
                throw IntError.formatterError
            }
            
            return string
        }
    }
    
    enum IntError: Error {
        case formatterError
    }
}
