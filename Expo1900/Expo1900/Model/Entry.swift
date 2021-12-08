import Foundation

struct Entry: Decodable {
    let name: String
    let image: String
    let simpleDescription: String
    let detailDescription: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case image = "image_name"
        case simpleDescription = "short_desc"
        case detailDescription = "desc"
    }
}
