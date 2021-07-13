//
//  ExpositionModel.swift
//  Expo1900
//
//  Created by 홍정아 on 2021/07/13.
//

import Foundation

struct ExpositionModel: JSONDecodable {
    typealias JSONModel = Exposition
    private(set) var title: String = .blank
    private(set) var visitors: UInt = .zero
    private(set) var location: String = .blank
    private(set) var duration: String = .blank
    private(set) var description: String = .blank
    
    init() {
        let expositionFileName = "exposition_universelle_1900"
        if let exposition = try? decodeJSON(fileName: expositionFileName) {
            self.title = exposition.title
            self.visitors = exposition.visitors
            self.location = exposition.location
            self.duration = exposition.duration
            self.description = exposition.description
        }
    }
}
