//
//  ExpoError.swift
//  Expo1900
//
//  Created by 기원우 on 2021/04/13.
//

import Foundation

enum ExpoError: String, Error {
    case invaildJsonFileName = "존재하지 않거나 올바르지 않은 Json file 이름입니다."
    case failJsonParser = "파싱에 실패했습니다"
    
}
