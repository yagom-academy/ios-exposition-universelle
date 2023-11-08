//
//  IdentifierNameSpace.swift
//  Expo1900
//
//  Created by uemu on 2023/11/06.
//

protocol Identifying {
    static var reuseIdentifier: String { get }
}

extension Identifying {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
