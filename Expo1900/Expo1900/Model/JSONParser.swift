import UIKit

enum JSONParser<Element: Decodable> {
    static func decode(from jsonFileName: String) -> Element? {
        guard let entriesData = NSDataAsset(name: jsonFileName) else {
            return nil
        }
        let data = try? JSONDecoder().decode(Element.self, from: entriesData.data)
        return data
    }
}
