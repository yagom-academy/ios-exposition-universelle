import UIKit

enum JSONParser {
    static func decodeData<T: Decodable>(of dataName: String, type: T.Type) -> Result<T, Error> {
        guard let assetFile = NSDataAsset(name: dataName) else { return .failure(.dataNotExist) }
        
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(type, from: assetFile.data) else { return .failure(.decodeFailure) }
        
        return .success(decodedData)
    }
    
    enum Error: LocalizedError {
        case dataNotExist
        case decodeFailure
        
        var errorDescription: String? {
            switch self {
            case .decodeFailure:
                return "데이터가 존재하지 않습니다."
            case .dataNotExist:
                return "데이터를 JSON으로 decode 하는 과정에서 실패하였습니다."
            }
        }
    }
}
