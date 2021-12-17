struct ExpositionViewModel {
    
    var exposition: Exposition
    let posterName = "poster"
  
    var title: String {
        exposition.title.replacingOccurrences(of: "(", with: "\n(")
    }
    
    var image: String {
        posterName
    }
    
    var visitors: String {
        exposition.visitor
    }
    
    var location: String {
        exposition.location
    }
    
    var duration: String {
        exposition.duration
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
