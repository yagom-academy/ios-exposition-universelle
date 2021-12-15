import UIKit.NSDataAsset

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var visitorsDescription: NSMutableAttributedString {
        let description = NSMutableAttributedString()
        description.append("방문객", forTextStyle: .title3)
        description.append(" : \(visitors.decimalString) 명", forTextStyle: .body)
        
        return description
    }
    var locationDescription: NSMutableAttributedString {
        let description = NSMutableAttributedString()
        description.append("개최지", forTextStyle: .title3)
        description.append(" : \(location)", forTextStyle: .body)
        
        return description
    }
    var durationDescription: NSMutableAttributedString {
        let description = NSMutableAttributedString()
        description.append("개최 기간", forTextStyle: .title3)
        description.append(" : \(duration)", forTextStyle: .body)
        
        return description
    }
    
    init() throws {
        guard let expositionJSON = NSDataAsset(name: JSONAssetNameList.exposition.rawValue) else {
            throw Expo1900Error.dataNotFoundInAsset(JSONAssetNameList.exposition.rawValue)
        }
        
        self = try JSONDecoder.shared.decode(Exposition.self, from: expositionJSON.data)
    }
}
