import Foundation

struct ExpositionItem: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
