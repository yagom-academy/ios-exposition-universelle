//
//  ExpositionManager.swift
//  Expo1900
//
//  Created by Jeremy, 준호 on 2022/10/24.
//

import UIKit.NSDataAsset

struct ExpositionManager: Manager {
    private let assetName: String = "exposition_universelle_1900"
    private(set) var exposition: Exposition?
    private(set) var posterImage: UIImage?
    
    var titleLineBreak: String {
        return exposition?.title.replacingOccurrences(of: "(", with: "\n(") ?? ""
    }
    
    var formattedVisitorsDescription: String? {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let visitors = self.exposition?.visitors,
              let visitorsDescription = numberFormatter.string(from: NSNumber(value: visitors)) else { return nil }
        return visitorsDescription + " 명"
    }
    
    init() {
        self.posterImage = makeImage(name: "poster")
        self.exposition = configureFromJson(assetName: assetName, type: exposition)
    }
}
