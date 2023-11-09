//
//  ErrorReason.swift
//  Expo1900
//
//  Created by hyunMac on 11/6/23.
//

enum AlertMessage: Error {
    case emptyImageData
    case emptyAssetData
    case noNextViewController
    case noJSONData
    case noJSONItems
    case lackData
    case errorAlertTitle
    case confirm
    
    var description: String {
        switch self {
        case .emptyImageData:
            return "이미지를 불러오지 못하였습니다."
        case .emptyAssetData:
            return "에셋 데이터를 불러오지 못하였습니다."
        case .noNextViewController:
            return "다음 뷰컨트롤러를 불러오지 못하였습니다."
        case .noJSONData:
            return "json 데이터를 불러오지 못하였습니다."
        case .noJSONItems:
            return "json 데이터 내부의 items가 비어있습니다."
        case .lackData:
            return "데이터가 충분하지 않습니다."
        case .errorAlertTitle:
            return "Error"
        case .confirm:
            return "확인"
        }
    }
    
}
