import Foundation

struct Entry: Codable {
    var name: String
    var image: String
    var introduction: String
    var description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case image = "image_name"
        case introduction = "short_desc"
        case description = "desc"
    }
}
