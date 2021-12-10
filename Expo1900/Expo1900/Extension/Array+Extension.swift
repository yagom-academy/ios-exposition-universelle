
extension Array {
    subscript(index index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

