//
//  Int+Extension.swift
//  Expo1900
//
//  Created by 김동욱 on 2022/04/19.
//

import Foundation

extension Int {
    static func numberFormatter(by inputText: Int?) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let result = numberFormatter.string(for: inputText) else {
            return nil
        }
        
        return result + PosterLetter.numberOfPeople
    }
}
