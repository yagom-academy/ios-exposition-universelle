//
//  ExpositionIntroduction.swift
//  Expo1900
//
//  Created by tottalE, Kyo on 10/17/22.
//
import Foundation

struct ExpositionIntroduction: Codable {
    let title: String
    let visitorNumber: Int
    let location: String
    let duration: String
    let description: String
    
    func formatVisitorNumber() throws -> String {
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
                print(error.message)
            } else {
                print(DataError.unknownError.message)
            }
        }
        return "방문객 : \(formattedVistorNumber) 명"
    }
    var locationDescription: String {
        return "개최지 : \(self.location)"
    }
    var durationDescription: String {
        return "개최 기간 : \(self.duration)"
    }
}
