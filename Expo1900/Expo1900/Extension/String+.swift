//
//  String+.swift
//  Expo1900
//
//  Created by Kiseok, Toy on 2023/11/01.
//

import Foundation

extension String {
    func convertToDecimal() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(for: Int(self)) ?? ""
    }
}
