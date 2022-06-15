    
    private func decodeExpositionData() throws -> Exposition {
        guard let mainPage = NSDataAsset.init(name: "exposition_universelle_1900") else { throw DataHandlingError.invalidFile }
        
        var exposition: Exposition
        let jsonDecoder = JSONDecoder()
        exposition = try jsonDecoder.decode(Exposition.self, from: mainPage.data)
        
        return exposition
    }
    private func setAllImages() {
        expositionImageView.image = #imageLiteral(resourceName: "poster")
        
        leftFlagImageView.image = #imageLiteral(resourceName: "flag")
        rightFlagImageView.image = #imageLiteral(resourceName: "flag")
    }
