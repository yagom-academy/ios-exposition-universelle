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
enum JSONConverterError: Error, Equatable {
    case inputWrongAssetName(String)
    case isNotMatchingType
    case otherError
}

/// JSONConverter는 parse라는 통합된 메서드를 담고 있는 타입이닷 ~~! 🥺
///
///     return try decodeAsset(of: extractData(assetName: assetName))
/// assetName에 원하는 JSON 파일의 이름을 'String'타입으로 적어주는 것이 중요하니깐!!
/// 반드시 String으로 넣어주어야 된다는 것!! 아시겠죠~! :-) 😋
/// (Zedd체 따라해봤습니다...깨알 이스터에그)
struct JSONConverter<T: Decodable> {
    
    /// extractData라는 메서드와 decodeAsset이라는 메서드를 통합하여 실행하는 메서드이다.
    /// 반환값은 Result 타입을 가지는데, success의 경우 제네릭 타입을 반환하고,
    /// failure의 경우에는 throw 되는 에러 case 를  보여준다.
    static func parse(assetName: String) -> Result<T, JSONConverterError> {
        do {
            return .success(try decodeAsset(of: extractData(assetName: assetName)))
        } catch JSONConverterError.inputWrongAssetName {
            return .failure(JSONConverterError.inputWrongAssetName(assetName))
        } catch JSONConverterError.isNotMatchingType {
            return .failure(JSONConverterError.isNotMatchingType)
        } catch {
            return .failure(JSONConverterError.otherError)
        }
    }
    
    /// JSON 파일을 가져와 NSDataAsset 타입으로 리턴해 주는 메서드
    private static func extractData(assetName: String) throws -> NSDataAsset {
        guard let dataAsset = NSDataAsset.init(name: assetName) else { throw JSONConverterError.inputWrongAssetName(assetName) }
        return dataAsset
    }
    
    /// 메서드는 extractData 메서드에서 리턴한 NSDataAsset 타입의 인자를 제네릭 T로 반환하는 메서드
    private static func decodeAsset(of: NSDataAsset) throws -> T {
        let decoder = JSONDecoder()
    
        guard let convertedData = try? decoder.decode(T.self, from: of.data) else { throw JSONConverterError.isNotMatchingType }
        return convertedData
    }
}

