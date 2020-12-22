import Foundation
import UIKit

struct Exposition: Codable {
    let title: String
    let titleImageName: String
    let visitors: UInt
    let location: String
    let duration: String
    let description: String

    var titleImage: UIImage? {
        return UIImage(named: self.titleImageName)
    }

    enum CodingKeys: String, CodingKey {
        case title, visitors, location, duration, description
        case titleImageName = "title_Image"
    }
}
