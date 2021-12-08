import UIKit

struct ExpositionInformation: Decodable {
    let title: String
    private let visitorsInformation: Int
    private let locationInformation: String
    private let durationInformation: String
    let description: String

    var poster: UIImage? {
        return UIImage(named: "poster")
    }
    var visitors: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        guard let visitorsNumber = formatter.string(for: visitorsInformation) else {
            return "잘못된 방문객 정보"
        }
        return "방문객 : \(visitorsNumber)명"
    }
    var location: String {
        return "개최지 : \(locationInformation)"
    }
    var duration: String {
        return "개최 기간 : \(durationInformation)"
    }
    
    private enum CodingKeys: String, CodingKey {
        case title
        case visitorsInformation = "visitors"
        case locationInformation = "location"
        case durationInformation = "duration"
        case description
    }
}
