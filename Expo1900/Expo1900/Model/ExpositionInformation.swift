import UIKit

struct ExpositionInformation: Decodable {
    private let titleInformation: String
    private let visitorsInformation: Int
    private let locationInformation: String
    private let durationInformation: String
    let description: String

    var title: String {
        return titleInformation.replacingOccurrences(of: "(", with: "\n(")
    }
    var poster: UIImage? {
        return UIImage(named: "poster")
    }
    var visitors: NSMutableAttributedString {
        let attributedString = NSMutableAttributedString()
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        guard let visitorsNumber = formatter.string(for: visitorsInformation) else {
            attributedString.append(NSAttributedString(string: "잘못된 방문객 정보"))
            return attributedString
        }
        let subject = NSAttributedString(string: "방문객 ", attributes: [.font: UIFont.preferredFont(forTextStyle: .title3)])
        let value = NSAttributedString(string: ": \(visitorsNumber)명", attributes: [.font: UIFont.preferredFont(forTextStyle: .body)])
        attributedString.append(subject)
        attributedString.append(value)
        return attributedString
    }
    var location: NSMutableAttributedString {
        let attributedString = NSMutableAttributedString()

        let subject = NSAttributedString(string: "개최지 ", attributes: [.font: UIFont.preferredFont(forTextStyle: .title3)])
        let value = NSAttributedString(string: ": \(locationInformation)", attributes: [.font: UIFont.preferredFont(forTextStyle: .body)])
        attributedString.append(subject)
        attributedString.append(value)
        return attributedString
    }
    var duration: NSMutableAttributedString {
        let attributedString = NSMutableAttributedString()

        let subject = NSAttributedString(string: "개최 기간 ", attributes: [.font: UIFont.preferredFont(forTextStyle: .title3)])
        let value = NSAttributedString(string: ": \(durationInformation)", attributes: [.font: UIFont.preferredFont(forTextStyle: .body)])
        attributedString.append(subject)
        attributedString.append(value)
        
        return attributedString
    }
    
    private enum CodingKeys: String, CodingKey {
        case description
        case titleInformation = "title"
        case visitorsInformation = "visitors"
        case locationInformation = "location"
        case durationInformation = "duration"
    }
}
