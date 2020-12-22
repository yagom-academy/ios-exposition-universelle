import Foundation
import UIKit

struct Exposition: Codable {
    let title: String
    private let titleImageName: String
    let visitors: UInt
    private let location: String
    private let duration: String
    let description: String

    var titleImage: UIImage? {
        return UIImage(named: self.titleImageName)
    }
    
    var expositionLocation: String {
        return "개최지 : " + location
    }
    
    var expositionDuration: String {
        return "개최기간 : " + duration
    }
    
    enum CodingKeys: String, CodingKey {
        case title, visitors, location, duration, description
        case titleImageName = "title_Image"
    }
}
