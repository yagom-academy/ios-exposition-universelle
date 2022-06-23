import Foundation

struct ExpositionPoster: Decodable {
    let title: String
    let description: String
    
    private let visitors: Int
    private let location: String
    private let duration: String
    
    var visitorContents: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let visitorInFormat = formatter.string(from: NSNumber(value: visitors)) ?? "0"
        return "방문객 : \(visitorInFormat) 명"
    }
    
    var locationContents: String {
        return "개최지 : \(location)"
    }
    
    var durationContents: String {
        return "개최 기간 : \(duration)"
    }
}
