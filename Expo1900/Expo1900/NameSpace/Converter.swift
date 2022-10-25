//
//  Converter.swift
//  Expo1900
//
//  Created by Rhovin, Aejong on 2022/10/25.
//

import Foundation

enum Converter {
    static let jsonDecoder = JSONDecoder()
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal

        return formatter
    }()
}
