//
//  UInt+.swift
//  Expo1900
//
//  Created by MARY, KOBE on 2023/06/30.
//

import Foundation

extension UInt {
	func changeToString() -> String? {
		let numberFormatter = NumberFormatter()
        
		numberFormatter.numberStyle = .decimal
        
		return numberFormatter.string(for: self)
	}
}
