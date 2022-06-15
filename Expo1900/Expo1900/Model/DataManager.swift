//
//  DataManager.swift
//  Expo1900
//
//  Created by dhoney96 on 2022/06/15.
//

import Foundation

struct DataManager<T> {
    func load(fileName: String) -> Data? {
        guard let fileLocation = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            return nil
        }
        
        do {
            let data = try Data(contentsOf: fileLocation)
            return data
        } catch {
            return nil
        }
    }
}

extension DataManager where T: Codable {
    func parse(fileName: String) -> T? {
        guard let jsonData = load(fileName: fileName),
              let dataList = try? JSONDecoder().decode(T.self, from: jsonData) else {
            return nil
        }
        
        return dataList
    }
}
