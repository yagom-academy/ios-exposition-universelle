import UIKit

enum Parser<Element: Decodable> {
    static func decode(from jsonName: String) -> [Element]? {
        guard let data: NSDataAsset = NSDataAsset(name: jsonName) else {
            return nil
        }
        
        let decoder = JSONDecoder()
        let products = try? decoder.decode([Element].self, from: data.data)
        
        return products
    }
}
