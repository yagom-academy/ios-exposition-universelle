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
            switch error {
            case DecodingError.typeMismatch(let type, let context):
                let descriptionList = context.debugDescription.split(separator: " ")
                print("타입이 \(type) 가 아닙니다. \(descriptionList[descriptionList.count - 2]) 타입을 사용 해주세요.")
            case DecodingError.dataCorrupted(let context):
                print(context.debugDescription)
            case DecodingError.valueNotFound(_ , let context):
                print(context.debugDescription)
            case DecodingError.keyNotFound(_ , let context):
                print(context.debugDescription)
            default:
                break
            }
        }
        return itemList
    }
}
