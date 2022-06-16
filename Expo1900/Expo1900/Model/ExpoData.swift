//
//  ExpoData.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/16.
//

import UIKit.NSDataAsset

struct ExpoData {
    private(set) var title: String?
    private(set) var visitors: String?
    private(set) var location: String?
    private(set) var duration: String?
    private(set) var description: String?

    mutating func decodingJsonData() {
        guard let expo1900 = NSDataAsset(name: "exposition_universelle_1900"),
              let expoInformation = try? JSONDecoder().decode(ExpoInformation.self, from: expo1900.data) else {
            return
        }
        title = expoInformation.title
        visitors = "방문객 : \(expoInformation.visitors.description) 명"
        location = "개최지 : \(expoInformation.location)"
        duration = "개최기간 : \(expoInformation.duration)"
        description = expoInformation.description
    }
}

