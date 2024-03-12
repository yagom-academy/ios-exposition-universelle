//
//  Exposition.swift
//  Expo1900
//
//  Created by Yejin Hong on 3/5/24.
//

struct Exposition {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var formattedTitle: String {
        let title = title.replacingOccurrences(of: "(", with: "\n(")
        return title
    }
}
