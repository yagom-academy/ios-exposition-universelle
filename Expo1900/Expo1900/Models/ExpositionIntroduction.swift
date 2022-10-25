//
//  ExpositionIntroduction.swift
//  Expo1900
//
//  Created by tottalE, Kyo on 10/17/22.
//
import Foundation

struct ExpositionIntroduction: Decodable {
    let title: String
    let visitorNumber: Int
    let location: String
    let duration: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case title, location, duration, description
        case visitorNumber = "visitors"
    }
    
    private func formatVisitorNumber() throws -> String {
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        guard let formattedVistorNumber = formatter.string(for: visitorNumber) else { throw DataError.formattingError }
        return formattedVistorNumber
    }
    
    var visitorNumberDescription: String {
        var formattedVistorNumber: String = ""
        do {
            formattedVistorNumber = try formatVisitorNumber()
        } catch {
            if let error = error as? DataError {
                print(error.localizedDescription)
            } else {
                print(DataError.unknownError.localizedDescription)
            }
        }
        return String(format: "방문객 : %@ 명", formattedVistorNumber)
    }
    var locationDescription: String {
        return String(format: "개최지 : %@", self.location)
    }
    var durationDescription: String {
        return String(format: "개최 기간 : %@", self.duration)
    }
}
