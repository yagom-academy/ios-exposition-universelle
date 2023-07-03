//
//  DecodingHelper.swift
//  Expo1900
//
//  Created by Minsup, Jusbug on 2023/06/28.
//

import Foundation

enum DecodingHelper {
    enum File: String {
        case exposition = "exposition"
        case entry = "entry"
        
        var name: String {
            return self.rawValue
        }
    }
    
    static func decode<T: Decodable>(fileName file: File) -> T? {
        let decoder = JSONDecoder()
        
        guard let path = Bundle.main.path(forResource: file.name, ofType: "json") else {
            print("Bundle에서 \(file.name).json 파일을 찾을 수 없습니다.")
            return nil
        }
        
        guard let content = try? String(contentsOfFile: path).data(using: .utf8) else {
            print("\(file.name).json 파일의 내용을 읽을 수 없습니다.")
            return nil
        }
            
        guard let result = try? decoder.decode(T.self, from: content) else {
            print("\(file.name).json 파일을 \(T.self)으로 변환하는데 실패하였습니다.")
            return nil
        }
        
        return result
    }
}
