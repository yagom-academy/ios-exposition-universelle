struct ExpositionViewModel {
    
    var exposition: Exposition
    
    var title: String {
        exposition.title.replacingOccurrences(of: "(", with: "\n(")
    }
    
    var image: String {
        "poster"
    }
    
    var visitors: String {
        "방문객 : " + exposition.visitor + "명"
    }
    
    var location: String {
        "개최지 : " + exposition.location
    }
    
    var duration: String {
        "개최 기간 : " + exposition.duration
    }
    
    var description: String {
        exposition.description
    }
    
    init() {
        let expositionIdentifier = "exposition_universelle_1900"
        let result = JSONParser.decodeData(of: expositionIdentifier, type: Exposition.self)
        
        switch result {
        case .success(let data):
            self.exposition = data
        default:
            self.exposition = Exposition()
        }
    }
}
