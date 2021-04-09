//
//  JSONConverter.swift
//  Expo1900
//
//  Created by 김찬우 on 2021/04/09.
//

import Foundation
import UIKit

/// # JSONConverterError
/// ------
/// - JSONConverterError 는 JSONConverter를 활용할 때 발생할 수 있는 error의 종류를 정리함
enum JSONConverterError: Error {
    case inputWrongAssetName
    case isNotMaching
}

/// JSONConverter는 parse라는 통합된 메서드를 담고 있다.
///
///
///         return try decodeAsset(of: extractData(assetName: assetName))
///
///
/// assetName에 원하는 JSON 파일의 이름을 'String'타입으로 적어주는 것이 중요함.
struct JSONConverter<T: Decodable> {
    
    /// extractData라는 메서드와 decodeAsset이라는 메서드를 통합하여 실행하는 메서드
    static func parse(assetName: String) throws -> T {
        return try decodeAsset(of: extractData(assetName: assetName))
    }
    
    /// JSON 파일을 가져와 NSDataAsset 타입으로 리턴해 주는 메서드
    static func extractData(assetName: String) throws -> NSDataAsset {
        guard let dataAsset = NSDataAsset.init(name: assetName) else { throw JSONConverterError.inputWrongAssetName }
        return dataAsset
    }
    
    /// 메서드는 extractData 메서드에서 리턴한 NSDataAsset 타입의 인자를 제네릭 T로 반환하는 메서드
    static func decodeAsset(of: NSDataAsset) throws -> T {
        let decoder = JSONDecoder()
    
        guard let convertedData = try? decoder.decode(T?.self, from: of.data) else { throw JSONConverterError.isNotMaching }
            return convertedData
    }
}

