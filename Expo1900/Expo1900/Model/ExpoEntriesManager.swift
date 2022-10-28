//
//  ExpoEntriesManager.swift
//  Expo1900
//
//  Created by Jeremy, 준호 on 2022/10/24.
//

import UIKit.NSDataAsset

struct ExpoEntriesManager: Manager {
    private(set) var expoEntries: [ExpoEntry]?
    private let assetName: String = "items"
    
    var entriesCount: Int {
        guard let itemCount = self.expoEntries?.count else { return 0 }
        return itemCount
    }
    
    init() {
        self.expoEntries = configureFromJson(assetName: assetName, type: expoEntries)
    }
}
