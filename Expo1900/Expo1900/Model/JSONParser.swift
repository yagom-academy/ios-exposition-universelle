import UIKit

enum JSONParser {
    static func decodeData<T: Decodable>(of dataName: String, type: T.Type) -> T? {
        guard let data = NSDataAsset(name: dataName) else { return nil }
        
        let decoder = JSONDecoder()
        let decodedData = try? decoder.decode(type, from: data.data)
        
        return decodedData
    }
}
