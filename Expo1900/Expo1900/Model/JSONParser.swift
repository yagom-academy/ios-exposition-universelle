import UIKit

struct JSONParser<T: Decodable> {
    func decode(fileName: String) -> Result<T, JSONError>  {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: fileName) else {
            return .failure(.notFound)
        }
        let decoder: JSONDecoder = JSONDecoder()
        guard let decodedData: T = try? decoder.decode(T.self, from: dataAsset.data) else {
            return .failure(.notFound)
        }
        return .success(decodedData)
    }
}
