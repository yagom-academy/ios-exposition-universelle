//
//  ExpositionPostEntity.swift
//  Expo1900
//
//  Created by Derrick kim on 2022/06/13.
//

import Foundation

struct ExpositionPostEntity: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String  
    let description: String
}

extension ExpositionPostEntity {
    func manufacture(_ content: ExpositionPost) -> String {
        switch content {
        case .title:
            let result = title.replacingOccurrences(of: "(", with: "\n(")
            return result
        case .visitors:
            return "방문객 : \(visitors.setNumberFormatter()) 명"
        case .location:
            return "개최지 : \(location)"
        case .duration:
            return "개최 기간 : \(duration)"
        case .description:
            return description
        }
    }
}
private extension Int {
    func setNumberFormatter() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesSignificantDigits = true
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
