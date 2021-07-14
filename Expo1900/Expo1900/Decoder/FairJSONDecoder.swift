//
//  FairJSONDecoder.swift
//  Expo1900
//
//  Created by Hosinging, EHD on 2021/07/10.
//
import UIKit

enum DecodingError: Error {
    case failedToDecode
}

class FairJSONDecoder {
    
    //MARK: - Singleton
    static let shared = FairJSONDecoder()
    private init(){}
    
    //MARK: - Property
    let decoder: JSONDecoder = JSONDecoder()
}
