import UIKit

enum Parser<Element: Decodable> {
    static func decode(from jsonName: NSDataAssetName) -> Element? {
        guard let data = NSDataAsset(name: jsonName) else {
            return nil
        }
        
        let products = try? JSONDecoder().decode(Element.self, from: data.data)
        
        return products
    }
}
