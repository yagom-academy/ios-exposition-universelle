//
//  Exposition.swift
//  Expo1900
//
//  Created by 세홍, 송준, 무리 on 2023/02/20.
//

import Foundation

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var titleLabelText: String {
        return title.replacingOccurrences(of: "(", with: "\n(")
    }
    var visitorLabelText: String {
        return "방문객 : \(visitors.setDecimal()) 명"
    }
    var locationLabelText: String {
        return "개최지 : \(location)"
    }
    var durationLabelText: String {
        return "개최 기간 : \(duration)"
    }
}
