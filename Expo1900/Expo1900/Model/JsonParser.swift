import UIKit

enum JsonParser {
    static func decodeData<T: Decodable>(of dataName: String, how: T.Type) -> T {
        guard let data = NSDataAsset(name: dataName) else {
            fatalError()
        }
        
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(how, from: data.data) else { fatalError() }
        
        return decodedData
    }
    
}
