//
//  MainPoster.swift
//  Expo1900
//
//  Created by Harry, 레옹아범 on 2023/02/20.
//

import UIKit

struct MainPoster: Decodable {
    let title: String
    let numberOfVisitors: Int
    let location: String
    let duration: String
    let description: String
    
    var numberOfVisitorsText: String {
        return "방문객 : \(self.numberOfVisitors)명"
    }
    
    var locationText: String {
        return "개최지 : \(self.location)"
    }
    
    var durationText: String {
        return "개최 기간 : \(self.duration)"
    }
}
