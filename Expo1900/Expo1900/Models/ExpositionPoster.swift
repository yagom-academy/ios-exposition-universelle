import Foundation

struct ExpositionPoster: Decodable {
    let description: String
    
    private let title: String
    private let visitors: Int
    private let location: String
    private let duration: String
    
    var formattedTitle: String {
        return title.replacingOccurrences(of: "(", with: "\n(")
    }
    
    var formattedVisitor: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let visitorInFormat = formatter.string(from: NSNumber(value: visitors)) ?? "0"
        return "방문객 : \(visitorInFormat) 명"
    }
    
    var formattedLocation: String {
        return "개최지 : \(location)"
    }
    
    var formattedDuration: String {
        return "개최 기간 : \(duration)"
    }
}
