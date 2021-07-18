//
//  ParsedItems.swift
//  Expo1900
//
//  Created by kjs on 2021/07/14.
//

import Foundation

struct ParsedItems: JSONDecodable {
    typealias JSONModel = [Item]
    var items: [Item]?
    
    init() {
        let itemsFileName = "items"
        
        items = try? decodeJSON(fileName: itemsFileName)
    }
    
}
