import UIKit

struct Entry: Codable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    var image: UIImage? {
        return UIImage(named: imageName)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
