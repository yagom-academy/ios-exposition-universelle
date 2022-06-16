import UIKit

struct ExpositionEntry: Decodable {
    let name: String
    let shortDescription: String
    let description: String
    
    private let imageName: String
    
    var thumbnail: UIImage? {
        return UIImage(named: imageName)
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
