//
//  JSONParser.swift
//  Expo1900
//
//  Created by duckbok on 2021/04/09.
//

import Foundation
import UIKit

/// Decodable을 채택한 타입을 JSON 데이터 파일로부터 Parsing해주는 생성불가능한 객체
///
/// 아래와 같이 사용하세요.
///
///     struct Exposition: Codable {
///         let title: String
///         let visitors: Int
///         let location: String
///     }
///
///     // exposition.dataset
///     guard let exposition: Exposition = JSONParser<Exposition>.parse("exposition") else { return }
///
///     print(exposition.title)
enum JSONParser<Type: Decodable> {
    
    /// 주어진 dataset 이름으로 지정한 타입의 인스턴스를 반환한다.
    static func parse(_ dataName: String) -> Type? {
        guard let dataAsset = extractData(from: dataName) else { return nil }
        
        return convert(from: dataAsset)
    }
    
    /// 주어진 dataset 이름이 Asset 카탈로그에 존재한다면 해당 dataset Type을 반환한다.
    static func extractData(from dataName: String) -> NSDataAsset? {
        guard let dataAsset = NSDataAsset(name: dataName) else { return nil }
        
        return dataAsset
    }
    
    /// 주어진 dataAsset에서 지정한 타입의 인스턴스로 decode한다.
    static func convert(from dataAsset: NSDataAsset) -> Type? {
        let decoder = JSONDecoder()
        guard let instance: Type = try? decoder.decode(Type.self, from: dataAsset.data) else { return nil }
        
        return instance
    }
}
