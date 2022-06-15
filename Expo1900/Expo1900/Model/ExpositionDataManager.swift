//
//  ExpositionDataManager.swift
//  Expo1900
//
//  Created by 웡빙, bonf on 2022/06/14.
//

import Foundation

struct ExpositionDataManager {
    
    func getData() -> Exposition? {
        guard let filePath = Bundle.main.path(forResource: "exposition_universelle_1900",
                                              ofType: "json",
                                              inDirectory: "expo_assets/exposition_universelle_1900.dataset") else {
            return nil
        }
        guard let data = try? String(contentsOfFile: filePath).data(using: .utf8) else {
            return nil
        }
        let decoder = JSONDecoder()
        var expositionList: Exposition?
        do {
            expositionList = try decoder.decode(Exposition.self, from: data)
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
        return expositionList
    }
}
