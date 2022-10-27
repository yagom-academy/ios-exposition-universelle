//  Created by Rhovin, Aejong on 2022/10/18.

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}

extension Exposition {
    var koreanTitle: String {
        guard let firstBracketIndex = title.firstIndex(of: "(") else { return "" }
        return String(title[..<firstBracketIndex])
    }
    var englishTitle: String {
        guard let firstBracketIndex = title.firstIndex(of: "(") else { return "" }
        return String(title[firstBracketIndex...])
    }
}
