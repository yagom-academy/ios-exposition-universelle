struct ExpositionViewModel {
    var title: String = ""
    var image: String = ""
    var visitors: String = ""
    var location: String = ""
    var duration: String = ""
    var description: String = ""
    
    mutating func setUpData() {
        let expositionIdentifier = "exposition_universelle_1900"
        guard let data = JsonParser.decodeData(of: expositionIdentifier, how: Exposition.self) else { return }
        
        title = data.title.replacingOccurrences(of: "(", with: "\n(")
        image = "poster"
        visitors = "방문객 : " + data.visitor + "명"
        location = "개최지 : " + data.location
        duration = "개최 기간 : " + data.duration
        description = data.description
    }
}
