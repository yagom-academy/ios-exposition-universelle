//
//  Int+Extension.swift
//  Expo1900
//
//  Created by 김동욱 on 2022/04/19.
//

import Foundation

extension Int {
    func numberFormatter() -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let result = numberFormatter.string(for: self) else {
            return nil
        }
        
        return result + PosterLetter.numberOfPeople
    }
}
