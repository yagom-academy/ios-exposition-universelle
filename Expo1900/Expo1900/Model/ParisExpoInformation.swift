//
//  ParisExpoInformation.swift
//  Expo1900
//
//  Created by 박병호 on 2021/12/06.
//

import Foundation

struct ParisExpoInformation: Decodable {
    let title: String
    private let visitors: Int
    private let location: String
    private let duration: String
    let description: String
    
    var setVisitors: String {
        return "방문객 \(visitors.decimalString) 명"
    }
    
    var setLocation: String {
        return "개최지 : \(location)"
    }
    
    var setDuration: String {
        return "개최 기간 : \(duration)"
    }
}

