import Foundation

struct ExpoEntry {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
}

extension ExpoEntry: Decodable { }

extension ExpoEntry {
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
