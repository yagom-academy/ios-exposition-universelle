//
//  ExhibitionInfomation.swift
//  Expo1900
//
//  Created by seungwoo kim on 2021/04/06.
//

import Foundation

struct ExhibitionInfomation: Decodable {
    var title: String
    var visitors: Int
    var location: String
    var duration: String
    var description: String
    
    var newlineTitle: String {
        return title.replacingOccurrences(of: "(", with: "\n(")
    }
    
    var formattedVistorsNumber: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let formattedNumber = numberFormatter.string(for: visitors) else { return String(visitors) }
        return formattedNumber
    }
}
