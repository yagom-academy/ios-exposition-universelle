import Foundation

struct Image: Codable {
    let images: [ImageInfo]
}

struct ImageInfo: Codable {
    let filename: String
    let scale: String
}
