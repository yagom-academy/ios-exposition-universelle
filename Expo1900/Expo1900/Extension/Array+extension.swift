import Foundation

extension Array {
    subscript(index index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
