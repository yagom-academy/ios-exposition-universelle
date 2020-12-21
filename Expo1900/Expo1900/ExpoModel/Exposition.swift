import Foundation
import UIKit

struct Exposition: Codable {
    let title: String
    let titleImageName: String
    let visitors: UInt
    let location: String
    let duration: String
    let descriptions: String
    
    var titleImage: UIImage {
        return UIImage(named: "titleImageName")!
    }

    enum CodingKeys: String, CodingKey {
        case title, visitors, location, duration, descriptions
        case titleImageName = "titleImage"
    }
}
