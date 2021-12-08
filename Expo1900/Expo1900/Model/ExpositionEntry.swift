import UIKit

struct ExpositionEntry: Decodable {
    let name: String
    private let imageName: String
    let shortDescription: String
    let description: String
    
    var image: UIImage? {
        return UIImage(named: imageName)
    }
    
    init(name: String, imageName: String, shortDescription: String, description: String) {
        self.name = name
        self.imageName = imageName
        self.shortDescription = shortDescription
        self.description = description
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
