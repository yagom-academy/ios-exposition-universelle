import Foundation

struct Entry: Decodable {
    var name: String
    var imageName: String
    var introduction: String
    var description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case introduction = "short_desc"
        case description = "desc"
    }
}
