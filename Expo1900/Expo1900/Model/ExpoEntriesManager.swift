//
//  ExpoEntriesManager.swift
//  Expo1900
//
//  Created by Jeremy, 준호 on 2022/10/24.
//

import UIKit.NSDataAsset

struct ExpoEntriesManager {
    private(set) var expoEntries: [ExpoEntry]?
    private let assetName: String = "items"
    
    var entriesCount: Int {
        guard let itemCount = self.expoEntries?.count else { return 0 }
        return itemCount
    }
    
    mutating func configureExpoEntriesFromJSON() {
        guard let expoEntries = JSONDecoder().decode(from: assetName, to: expoEntries) else { return }
        self.expoEntries = expoEntries
    }
    
    func expoEntryImage(index: Int) -> UIImage? {
        guard let imageName = expoEntries?[index].imageName else { return nil }
        return UIImage(named: imageName)
    }
}
