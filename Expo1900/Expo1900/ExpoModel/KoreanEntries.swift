import Foundation

struct KoreanEntries: Codable {
    let name: String
    let imageName: String
    let shortDescriptions: String
    let descriptions: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescriptions = "short_desc"
        case descriptions = "desc"
    }
}
