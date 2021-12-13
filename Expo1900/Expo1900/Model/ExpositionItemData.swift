import Foundation

struct ExpositionItemData {
    let decodedData = JsonParser.decodeData(of: "items", how: [ExpositionItem].self)
}
