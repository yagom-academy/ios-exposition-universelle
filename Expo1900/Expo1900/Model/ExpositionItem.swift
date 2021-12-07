import Foundation

struct ExpositionItem: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
<<<<<<< HEAD
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName
        case shortDescription = "short_desc"
        case description = "desc"
    }
=======

    enum Codingkeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }

>>>>>>> 26af217d6983ab44d5609ee4ed9c193bf3536d9f
}
