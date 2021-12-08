import UIKit

enum JSONParse<T: Decodable> {
    static func decode(fileName: String) -> T? {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: fileName) else {
            return nil
        }
        let decoder: JSONDecoder = JSONDecoder()
        let decodedData: T? = try? decoder.decode(T.self, from: dataAsset.data)
        return decodedData
    }
}
