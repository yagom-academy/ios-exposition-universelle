//  Exposition.swift
//  Expo1900
//  Created by inho, LJ on 2022/10/18.

import UIKit

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    var visitorInformation: String {
        return "방문객 : \(visitors) 명"
    }
    var locationInformation: String {
        return "개최지 : \(location)"
    }
    var durationInformation: String {
        return "개최 기간 : \(duration)"
    }
    var expositionImage: UIImage? {
        return UIImage(named: "poster")
    }
    var flagImage: UIImage? {
        return UIImage(named: "flag")
    }
    var exhibitButtonText: String {
        return "한국의 출품작 보러가기"
    }
}
