import Foundation

struct ExpositionItem {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String

    enum Codingkeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }

}
