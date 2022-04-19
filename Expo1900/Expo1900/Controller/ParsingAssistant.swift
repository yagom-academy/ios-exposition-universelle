import UIKit

protocol ParsingAssistantable {
    func decodeContent<T: Decodable>(fileName: String) -> T?
}

struct ParsingAssistant: ParsingAssistantable {
    private let decoder = JSONDecoder()

    func decodeContent<T: Decodable>(fileName: String) -> T? {
        guard let content = NSDataAsset(name: fileName) else { return nil }
        let data = try? decoder.decode(T.self, from: content.data)
        return data
    }
}
