import Foundation

struct Image: Codable {
    var filename: String
    var idiom: String
    var scale: String
}

struct Info: Codable {
    var author: String
    var version: Int
}

struct ItemData: Codable {
    var filename: String
    var idiom: String
}

struct Content: Codable {
    var images: [Image]?
    var data: [ItemData]?
    var info: Info
}
