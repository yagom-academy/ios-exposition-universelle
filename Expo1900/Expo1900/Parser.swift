//
//  Parser.swift
//  Expo1900
//
//  Created by yun on 2021/07/06.
//

import Foundation

struct Parser {
    let fileName: String
    var expo: Exposition? {
        guard let data = readLocalJSONFile(forName: fileName), let exposition = parseToExposition(data: data) else {
            return nil
        }
        return exposition
    }
    
    var items: [KoreanItem]? {
        guard let data = readLocalJSONFile(forName: fileName), let items = parseToItems(data: data) else {
            return nil
        }
        return items
    }
    
    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                print(bundlePath)
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    func parseToExposition(data: Data) -> Exposition? {
        do {
            let expo = try JSONDecoder().decode(Exposition.self, from: data)
            return expo
        } catch {
            print(error)
        }
        return nil
    }
    
    func parseToItems(data: Data) -> [KoreanItem]? {
        do {
            let items = try JSONDecoder().decode([KoreanItem].self, from: data)
            return items
        } catch {
            print(error)
        }
        return nil
    }
    
}
