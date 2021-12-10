//
//  ParisExpoInformation.swift
//  Expo1900
//
//  Created by 박병호 on 2021/12/06.
//

import Foundation

struct ParisExpoInformation: Decodable {
    private let title: String
    private let visitors: Int
    private let location: String
    private let duration: String
    private let description: String
    
    var setTitle: String {
        return title
    }
    
    var setVisitors: String {
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        guard let visitor = numberFormat.string(for: visitors) else {
            return ""
        }
        
        return "방문객 : \(visitor) 명"
    }
    
    var setLocation: String {
        return "개최지 : \(location)"
    }
    
    var setDuration: String {
        return "개최 기간 : \(duration)"
    }
    
    var setDescription: String {
        return description
    }
}

