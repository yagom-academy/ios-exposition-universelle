//
//  MainPoster.swift
//  Expo1900
//
//  Created by Harry, 레옹아범 on 2023/02/20.
//

import UIKit

struct MainPoster: Decodable {
    let title: String
    private let numberOfVisitors: Int
    private let location: String
    private let duration: String
    let description: String
    
    var visitorsText: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let formattedText = numberFormatter.string(for: self.numberOfVisitors) else {
            return "방문객 : \(self.numberOfVisitors)명"
        }
        
        return "방문객 : \(formattedText)명"
    }
    
    var locationText: String {
        return "개최지 : \(self.location)"
    }
    
    var durationText: String {
        return "개최 기간 : \(self.duration)"
    }
    
    enum CodingKeys: String, CodingKey {
        case title, location, duration, description
        case numberOfVisitors = "visitors"
    }
}
