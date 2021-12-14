import UIKit.NSDataAsset

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var visitorsDescription: NSMutableAttributedString {
        return NSMutableAttributedString()
            .title3(text: "방문객")
            .body(text: " : \(visitors.decimalString) 명")
    }
    var locationDescription: NSMutableAttributedString {
        return NSMutableAttributedString()
            .title3(text: "개최지")
            .body(text: " : \(location)")
    }
    var durationDescription: NSMutableAttributedString {
        return NSMutableAttributedString()
            .title3(text: "개최 기간")
            .body(text: " : \(duration)")
    }
    
    init() throws {
        guard let expositionJSON = NSDataAsset(name: JSONAssetNameList.exposition.rawValue) else {
            throw Expo1900Error.dataNotFoundInAsset(JSONAssetNameList.exposition.rawValue)
        }
        
        self = try JSONDecoder.shared.decode(Exposition.self, from: expositionJSON.data)
    }
}
