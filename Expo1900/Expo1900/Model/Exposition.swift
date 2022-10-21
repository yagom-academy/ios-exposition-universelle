//
//  Exposition.swift
//  Expo1900
//
//  Created by Jeremy, 준호 on 2022/10/18.
//
import Foundation

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var visitorsDescription: String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let visitorsDescription: String = numberFormatter.string(from: NSNumber(value: visitors)) ?? ""
        return visitorsDescription + " 명"
    }
}
