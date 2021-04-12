//
//  Exposition.swift
//  Expo1900
//
//  Created by 이영우 on 2021/04/06.
//

import Foundation

/// JSON 파일 Exposition1900에 해당되는 타입
/// - title : String 타입으로 엑스포 제목, nil 값에 해당할 경우 비어 있는 문자열 반환
/// - visitors : Int 타입으로 엑스포 참가 인원, nil 값에 해당할 경우 0 반환
/// - location : String 타입으로 엑스포 장소, nil 값에 해당할 경우 비어 있는 문자열 반환
/// - duration : String 타입으로 엑스포 기간 정보, nil 값에 해당할 경우 비어 있는 문자열 반환
struct Exposition: Decodable {
    let title: String
    private let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var visitorsStringFormat: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let result = numberFormatter.string(from: NSNumber(value: self.visitors)) else {
            return .blank
        }
        return result
    }
    
    private enum CodingKeys: CodingKey {
        case title
        case visitors
        case location
        case duration
        case description
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = (try? container.decode(String.self, forKey: .title)) ?? .blank
        self.visitors = (try? container.decode(Int.self, forKey: .visitors)) ?? .zero
        self.location = (try? container.decode(String.self, forKey: .location)) ?? .blank
        self.duration = (try? container.decode(String.self, forKey: .duration)) ?? .blank
        self.description = (try? container.decode(String.self, forKey: .description)) ?? .blank
    }
}
