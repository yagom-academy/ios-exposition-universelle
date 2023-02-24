//
//  ReuseIdentifying.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/23.
//

protocol ReuseIdentifying {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
