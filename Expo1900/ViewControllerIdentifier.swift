//
//  ViewControllerIdentifier.swift
//  Expo1900
//
//  Created by 곽우종 on 2022/04/22.
//

import Foundation

protocol ViewControllerIdentifier {
    static var identifier: String { get }
}

extension ViewControllerIdentifier {
    static var identifier: String {
        return String(describing: self.self)
    }
}
