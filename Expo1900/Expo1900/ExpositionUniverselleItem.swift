import UIKit
struct ExpositionUniverselleItem: Codable {
    let name: String
    private let imageName: String
    let shortDescription: String
    let description: String
    
    var image: UIImage? {
        return UIImage(named: self.imageName)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
