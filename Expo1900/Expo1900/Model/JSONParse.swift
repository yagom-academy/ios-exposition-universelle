import UIKit

enum JSONError: LocalizedError {
    case notFound
    
    var errorDescription: String? {
        switch self {
        case .notFound:
            return "데이터를 불러오지 못했습니다."
        }
    }
}

enum JSONParse<T: Decodable> {
    static func decode(fileName: String) -> Result<T, JSONError>  {
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
