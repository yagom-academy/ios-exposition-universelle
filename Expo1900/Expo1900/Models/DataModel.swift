//
//  DataModel.swift
//  Expo1900
//
//  Created by 임성민 on 2020/12/23.
//

import UIKit

struct DataModel<T: Decodable> {
    private var data: T?
    private let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    private mutating func decode() throws {
        let jsonDecoder = JSONDecoder()
        guard let expositionDataAsset = NSDataAsset(name: self.fileName) else {
            return
        }
        self.data = try jsonDecoder.decode(T.self, from: expositionDataAsset.data)
    }
    
    mutating func requestData() throws -> T? {
        if self.data == nil {
            try self.decode()
        }
        
        return self.data
    }
}
