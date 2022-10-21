//  Created by Rhovin, Aejong on 2022/10/18.

struct Item: Decodable {
    let name: String
    let imageName: String
    let shortDesc: String
    let desc: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case desc
        case imageName = "image_name"
        case shortDesc = "short_desc"
    }
}
