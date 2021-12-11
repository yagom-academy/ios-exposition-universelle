import Foundation

struct Exposition: Decodable {
    let title: String
    let visitorsCount: Int
    let location: String
    let duration: String
    let description: String
}

struct ExpositionPoster {
    let imageResourceLocator: String
}
