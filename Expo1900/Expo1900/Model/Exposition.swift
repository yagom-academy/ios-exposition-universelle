//
//  Exposition.swift
//  Expo1900
//
//  Created by 양호준 on 2021/12/06.
//

import Foundation

struct Exposition: Codable {
    var title: String
    var visitors: Int
    var location: String
    var duration: String
    var description: String
    
    var titleWithLineBreak: String {
        return title.replacingOccurrences(of: "(", with: "\n(")
    }
}
