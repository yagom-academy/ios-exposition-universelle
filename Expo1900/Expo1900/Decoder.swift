//
//  Decoder.swift
//  Expo1900
//
//  Created by 김민성 on 2021/04/13.
//

import Foundation

class Decoder{
    let decoder = JSONDecoder()
    
    func decodeData<T: Decodable>(_ object: T.Type, of data: Data) -> T?{
        do {
            let contents = try decoder.decode(object, from: data)
            print(contents)
            return contents
        }
        catch {
            print(error)
            return nil
        }
    }
}
