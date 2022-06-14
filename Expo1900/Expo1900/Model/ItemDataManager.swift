//
//  ItemDataManager.swift
//  Expo1900
//
//  Created by 웡빙, bonf on 2022/06/13.
//

import Foundation

struct ItemDataManager {
    
    func getData() -> [Item]? {
        guard let filePath = Bundle.main.path(forResource: "items",
                                              ofType: "json",
                                              inDirectory: "expo_assets/items.dataset") else {
            return nil
        }
        guard let data = try? String(contentsOfFile: filePath).data(using: .utf8) else {
            return nil
        }
        let decoder = JSONDecoder()
        var itemList: [Item]?
        do {
            itemList = try decoder.decode([Item].self, from: data)
        } catch {
            print(error)
        }
        return itemList
    }
}
