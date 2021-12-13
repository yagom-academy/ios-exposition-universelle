import Foundation

enum ExpoEntries {
    static var list: [ExpoEntry] {
        return Parser<[ExpoEntry]>.decode(from: .items) ?? []
    }
}
