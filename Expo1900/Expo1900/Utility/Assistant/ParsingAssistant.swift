import UIKit

protocol ParsingAssistantable {
    func decodeContent<T: Decodable>(fileName: String) -> T?
}

final class ParsingAssistant: ParsingAssistantable {
    static let shared = ParsingAssistant()
    
    private init() { }
    
    private let decoder = JSONDecoder()
    
    func decodeContent<T>(fileName: String) -> T? where T : Decodable {
        guard let content = NSDataAsset(name: fileName) else { return nil }
        let data = try? decoder.decode(T.self, from: content.data)
        return data
    }
}

