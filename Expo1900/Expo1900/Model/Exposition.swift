//
//  Exposition.swift
//  Expo1900
//
//  Created by Marco, Soll, Yescoach on 2021/07/05.
//

import Foundation

struct Exposition: Codable {
    let title: String?
    let visitors: Int?
    let location: String?
    let duration: String?
    let description: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try? container.decode(String.self, forKey: .title)
        self.visitors = try? container.decode(Int.self, forKey: .visitors)
        self.location = try? container.decode(String.self, forKey: .location)
        self.duration = try? container.decode(String.self, forKey: .duration)
        self.description = try? container.decode(String.self, forKey: .description)
    }
    
    func divideTitle() -> String? {
        guard let text = title else {
            return nil
        }
        return text.replacingOccurrences(of: "(", with: "\n(")
    }
}
