import Foundation

struct Entry: Decodable {
    let name: String
    let imageName: String
    let introduction: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case introduction = "short_desc"
        case description = "desc"
    }
}
