//
//  ExpositionModel.swift
//  Expo1900
//
//  Created by 홍정아 on 2021/07/13.
//

import Foundation

struct ParsedExposition: JSONDecodable {
    typealias JSONModel = Exposition
    
    enum Prefix {
        static let visitor = "방문객 : "
        static let location = "개최지 : "
        static let duration = "개최 기간 : "
    }
    
    private(set) var title: String?
    private(set) var visitors: String?
    private(set) var location: String?
    private(set) var duration: String?
    private(set) var description: String?
    
    init() {
        let expositionFileName = "exposition_universelle_1900"
        if let exposition = try? decodeJSON(fileName: expositionFileName) {
            self.title = format(title: exposition.title)
            self.visitors = formattedVisitor(visitors: exposition.visitors)
            self.location = formattedLocation(location: exposition.location)
            self.duration = formattedDuration(duration: exposition.duration)
            self.description = exposition.description
        }
    }
    
    private func formattedVisitor(visitors: UInt) -> String {
        let people = " 명"
        return Prefix.visitor + format(visitors: visitors) + people
    }
    
    private func formattedLocation(location: String) -> String {
        return Prefix.location + location
    }
    
    private func formattedDuration(duration: String) -> String {
        return Prefix.duration + duration
    }
    
    private func format(title: String) -> String {
        return title.replacingOccurrences(of: String.bracket,
                                          with: String.newLine + String.bracket)
    }
    
    private func format(visitors: UInt) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: visitors)) ?? .zero
    }
}
