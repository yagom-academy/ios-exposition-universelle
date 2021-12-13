import UIKit.NSDataAsset

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var visitorsDescription: String {
        return "방문객 : \(visitors.decimalString) 명"
    }
    var locationDescription: String {
        return "개최지 : \(location)"
    }
    var durationDescription: String {
        return "개최 기간 : \(duration)"
    }
    
    init() throws {
        guard let expositionJSON = NSDataAsset(name: JSONAssetNameList.exposition.rawValue) else {
            throw Expo1900Error.dataNotFoundInAsset(JSONAssetNameList.exposition.rawValue)
        }
        
        self = try JSONDecoder.shared.decode(Exposition.self, from: expositionJSON.data)
    }
}
