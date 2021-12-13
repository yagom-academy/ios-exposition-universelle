import Foundation

struct Exposition: Decodable {
    let title: String
    let visitorsCount: Int
    let location: String
    let duration: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case visitorsCount = "visitors"
        case location
        case duration
        case description
    }
}
