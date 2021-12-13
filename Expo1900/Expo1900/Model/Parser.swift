
import UIKit

enum Parser {
    static private let decoder = JSONDecoder()
    
    static func parsedExpoInfo() throws -> ExpoInfo {
        return try parsedInfo(name: "items", error: ParserError.failToParseItemsInfo) as ExpoInfo
    }
    
    static func parsedItemsInfo() throws -> [ItemInfo] {
        return try parsedInfo(name: "items", error: ParserError.failToParseItemsInfo) as [ItemInfo]
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
