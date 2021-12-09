
import UIKit

enum Paser {
    static private let decoder = JSONDecoder()
    
    static func parsedExpoInfo() throws -> ExpoInfo {
        guard let data = NSDataAsset(name: "exposition_universelle_1900")?.data else {
            fatalError()
        }
        let result = try decoder.decode(ExpoInfo.self, from: data)
        
        return result
    }
}
