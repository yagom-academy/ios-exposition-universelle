//
//  ReuseIdentifying.swift
//  Expo1900
//
//  Created by Gordon Choi on 2022/06/20.
//

protocol ReuseIdentifying {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
