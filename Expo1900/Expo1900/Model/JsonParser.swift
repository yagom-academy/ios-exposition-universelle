import UIKit

enum JsonParser {
    static func decodeData(of dataName: String) -> Exposition {
        guard let data = NSDataAsset(name: dataName) else {
            fatalError()
        }
        
        let decoder = JSONDecoder()
        guard let expositionData = try? decoder.decode(Exposition.self, from: data.data) else { fatalError()}
        
        return expositionData
    }
    
}
