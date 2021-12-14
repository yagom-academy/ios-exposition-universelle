
import UIKit

enum Parser {
    private enum Information {
        case expo
        case items
        
        var fileName: String {
            switch self {
                case .expo:
                    return "exposition_universelle_1900"
                case .items:
                    return "items"
            }
        }
    }
    
    static private let decoder = JSONDecoder()
    
    static func parsedExpoInfo() throws -> ExpoInfo {
        return try parsedInfo(name: Information.expo.fileName, error: ParserError.failToParseExpoInfo) as ExpoInfo
    }
    
    static func parsedItemsInfo() throws -> [ItemInfo] {
        return try parsedInfo(name: Information.items.fileName, error: ParserError.failToParseItemsInfo) as [ItemInfo]
    }
    
    static func parsedInfo<T: Decodable>(name: String, error: ParserError) throws -> T {
        guard let data = NSDataAsset(name: name, bundle: .main)?.data else {
            throw ParserError.invaildFileName
        }
        do {
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch {
            throw error
        }
    }
}
