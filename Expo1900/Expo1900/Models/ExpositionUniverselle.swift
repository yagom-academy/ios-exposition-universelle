//
//  ExpositionUniverselle.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/20.
//

struct ExpositionUniverselle: Decodable {
    let title: String
    let numberOfVisitor: UInt
    let location: String
    let duration: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case title, location, duration, description
        case numberOfVisitor = "visitors"
    }
    
    var displayedTitle: String {
        var displayedTitle = title
        guard let index = displayedTitle.firstIndex(of: "(") else {
            return displayedTitle
        }
        
        displayedTitle.insert("\n", at: index)
        return displayedTitle
    }
    
    var displayedNumberOfVisitor: String {
        return "방문객 : \(self.numberOfVisitor.convertToDecimal()) 명"
    }
    var displayedLocation: String {
        return "개최지 : " + self.location
    }
    var displayedDuration: String {
        return "개최 기간 : " + self.duration
    }
}
