//
//  DataManager.swift
//  Expo1900
//
//  Created by dhoney96 on 2022/06/15.
//

import Foundation

struct DataManager {
    private func load(fileName: String) -> Data? {
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
    
    func expositionParse(fileName: String) throws -> Exposition?  {
        guard let jsonData = load(fileName: fileName),
              let dataList = try? JSONDecoder().decode(Exposition.self, from: jsonData) else {
            throw ParsingError.decodingError
        }
        
        return dataList
    }
    
    func entryParse(fileName: String) -> [Entry?]  {
        guard let jsonData = load(fileName: fileName),
              let dataList = try? JSONDecoder().decode([Entry].self, from: jsonData) else {
            return [nil]
        }
        
        let result = dataList.filter { item in
            item.name != nil && item.imageName != nil && item.shortDescription != nil && item.longDescription != nil
        }
        return result
    }
}

