//
//  DataManager.swift
//  Expo1900
//
//  Created by 이원빈 on 2022/06/13.
//

import Foundation

struct DataManager {
    
    func getData() {
        guard let filePath = Bundle.main.path(forResource: "items", ofType: "json", inDirectory: "expo_assets/items.dataset") else {
            return
        }
        guard let data = try? String(contentsOfFile: filePath).data(using: .utf8) else {return}
        let decoder = JSONDecoder()
        var itemList: [Item]?
        do {
            itemList = try decoder.decode([Item].self, from: data)
            itemList?.forEach { item in
                print(item.name, terminator: " ")
                print(item.imageName)
                print(item.shortDescription)
                print(item.description + "\n")
            }
        } catch {
            print(error)
        }
    }
}

