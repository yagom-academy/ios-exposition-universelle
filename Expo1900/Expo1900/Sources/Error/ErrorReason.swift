//
//  ErrorReason.swift
//  Expo1900
//
//  Created by hyunMac on 11/6/23.
//

enum ErrorReason: String {
    case emptyImageData = "이미지 불러오지 못함"
    case emptyAssetData = "에셋 데이터 불러오지 못함"
    case noNextViewController = "다음 뷰컨트롤러를 불러오지 못함"
    case noJSONData = "json 데이터를 불러오지 못함"
    case noJSONItems = "json 데이터가 비어있음"
    case lackData = "데이터가 충분하지 않음"
}
