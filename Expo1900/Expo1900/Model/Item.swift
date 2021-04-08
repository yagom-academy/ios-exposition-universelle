//
//  Item.swift
//  Expo1900
//
//  Created by 이영우 on 2021/04/06.
//

import Foundation

/// JSON 파일 items에 해당되는 타입
/// - name : String 타입으로 item의 이름, nil 값에 해당할 경우 비어 있는 문자열 반환
/// - imageName : String 타입으로 item 이미지 이름, nil 값에 해당할 경우 비어 있는 문자열 반환
/// - shortDesc : String 타입으로 item 요약 설명, nil 값에 해당할 경우 비어 있는 문자열 반환
/// - description : String 타입으로 item 설명, nil 값에 해당할 경우 비어 있는 문자열 반환
struct Item: Decodable {
    let name: String
    let imageName: String
    let shortDesc: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDesc = "short_desc"
        case description = "desc"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = (try? container.decode(String.self, forKey: .name)) ?? .blank
        self.imageName = (try? container.decode(String.self, forKey: .imageName)) ?? .blank
        self.shortDesc = (try? container.decode(String.self, forKey: .shortDesc)) ?? .blank
        self.description = (try? container.decode(String.self, forKey: .description)) ?? .blank
    }
}
