//
//  ExpoInformation.swift
//  Expo1900
//
//  Created by kiseok, Toy on 10/31/23.
//

struct ExpoInformation: Decodable {
    let title: String
    let visitorNumber: Int
    let location: String
    let duration: String
    let description: String
    
    var formattedTitle: String {
        let result = title.components(separatedBy: "(")
        
        return result[0] + "\n" + "(" + result[1]
    }
    
    var formattedVisitorsNumber: String {
        return String(visitorNumber).convertToDecimal() + " 명"
    }
    
    enum CodingKeys: String, CodingKey {
        case title, location, duration, description
        case visitorNumber = "visitors"
    }
}
