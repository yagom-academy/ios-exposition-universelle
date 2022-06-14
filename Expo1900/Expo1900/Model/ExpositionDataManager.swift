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
            print(error)
        }
        return expositionList
    }
}
