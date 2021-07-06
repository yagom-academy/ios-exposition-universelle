//
//  Parser.swift
//  Expo1900
//
//  Created by yun on 2021/07/06.
//

import Foundation

struct Parser {
    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
}
