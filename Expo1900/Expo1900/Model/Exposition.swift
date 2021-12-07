import UIKit

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    init() throws {
        guard let data = NSDataAsset(name: "exposition_universelle_1900") else {
            throw Expo1900Error.dataNotFoundInAsset("exposition_universelle_1900")
        }
        
        self = try JSONDecoder.shared.decode(Exposition.self, from: data.data)
    }
}
