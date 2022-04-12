//
//  JsonManager.swift
//  Expo1900
//
//  Created by 우롱차, marisol on 2022/04/12.
//

import Foundation
import UIKit

protocol JsonManagerable {
    func getDecodedItems() -> [Item]?
}

struct JsonManager: JsonManagerable {
    func getDecodedItems() -> [Item]? {
        var items: [Item]? = []
        let jsonDecoder = JSONDecoder()
        
        guard let itemData: NSDataAsset = NSDataAsset(name: "items") else { return nil }
        
//        do {
//            items = try jsonDecoder.decode([Item].self, from: itemData.data)
//        } catch {
//            return nil
//        }
        items = try? jsonDecoder.decode([Item].self, from: itemData.data)
        return items
    }
}
